USE mademoiselle_borges;

DELIMITER &&
CREATE PROCEDURE register_supplier (IN s_name VARCHAR(75), iban VARCHAR(50), street VARCHAR(50),
		locale VARCHAR(30), postal VARCHAR(15), email VARCHAR(75), phone VARCHAR(20))
BEGIN
    DECLARE last_ins INTEGER;


    START TRANSACTION;

    INSERT INTO Supplier (SupplierName, IBAN, Street, Locale, Postal)
    VALUES (s_name, iban, street, locale, postal);

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into Supplier.';
    END IF;

    SELECT SupplierID INTO last_ins FROM Supplier ORDER BY SupplierID DESC LIMIT 1;

    CALL register_supplier_phone(last_ins, phone);

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error calling register_supplier_phone.';
    END IF;

    CALL register_supplier_email(last_ins, email);

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error calling register_supplier_email.';
    END IF;

    COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE register_reservation_new_product (IN product_name VARCHAR(75),
    descript TEXT, baseprice DECIMAL(5,2), supplierid INTEGER, dateofschedule DATETIME,
    stock INT, dateofreservation DATETIME)
BEGIN
    DECLARE product_id INTEGER;

    START TRANSACTION;

    INSERT INTO Product (ProductName, ProductDescription, BasePrice, QuantityInStock)
    VALUES(product_name, descript, baseprice, 0);

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into Product.';
    END IF;

    SELECT ProductID INTO product_id FROM Product ORDER BY ProductID DESC LIMIT 1;

    INSERT INTO ProductSupplierFuture(ProductID_psf, SupplierID_psf,
        DateOfSchedule, DateOfReservation, Quantity)
    VALUES(product_id, supplierid, dateofschedule, dateofreservation, stock);

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into ProductSupplierFuture.';
    END IF;

    COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE register_reservation_exis_product (IN productid INTEGER,
    supplierid INTEGER, dateofschedule DATETIME, dateofreservation DATETIME, quantity INTEGER)
BEGIN

    START TRANSACTION;

    INSERT INTO ProductSupplierFuture(ProductID_psf, SupplierID_psf,
        DateOfSchedule, DateOfReservation, Quantity)
    VALUES(productid, supplierid, dateofschedule, dateofreservation, quantity);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into ProductSupplierFuture.';
    END IF;
    COMMIT;
END &&

DELIMITER &&

CREATE PROCEDURE register_delivery_product (IN p_id INTEGER,
    s_id INTEGER, p_dod DATETIME, p_quantity INTEGER)
BEGIN

    START TRANSACTION;

    UPDATE Product
    SET QuantityInStock = QuantityInStock + p_quantity
    WHERE ProductID = p_id;

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error updating product quantity.';
    END IF;

    INSERT INTO ProductSupplierPast
    VALUES(p_id, s_id, p_dod, p_quantity);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into ProductSupplierPast.';
    END IF;

    COMMIT;
END &&

-- Creates participants
DELIMITER &&
CREATE PROCEDURE add_prod_new_shop_new_part(IN e_id VARCHAR(10), pd_id INTEGER,
						part_name VARCHAR(75), part_vat VARCHAR(9),
						street VARCHAR(50), locale VARCHAR(30), postal VARCHAR(15), part_bd DATE,
						quant INTEGER, phone VARCHAR(20), email VARCHAR(75))
BEGIN
	DECLARE last_ins INTEGER;
    DECLARE last_sale_id INTEGER;
    DECLARE cur_val DECIMAL(5,2);

    START TRANSACTION;

    INSERT INTO Participant(ParticipantName, ParticipantVAT, ParticipantBirthDate,
                            Street, Locale, Postal)
    VALUES (part_name, part_vat, part_bd, street, locale, postal);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting participant information.';
    END IF;

    SELECT ParticipantID INTO last_ins FROM Participant
    ORDER BY ParticipantID DESC LIMIT 1;

    INSERT INTO ParticipantPhone
    VALUES (last_ins, phone);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting participant phone information.';
    END IF;

    IF email IS NOT NULL THEN
        INSERT INTO ParticipantEmail
        VALUES (last_ins, email);

        IF ROW_COUNT() = 0 THEN
			ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error inserting participant email information.';
        END IF;
    END IF;

    INSERT INTO Sale(TotalValue, TotalQuantity, DateOfSale, EmployeeID_s, ParticipantID_s)
    VALUES ("0.00", "0", NULL, e_id, last_ins);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting sale information.';
    END IF;

    SELECT ReceiptNO INTO last_sale_id FROM Sale
    ORDER BY ReceiptNO DESC LIMIT 1;

    SELECT BasePrice INTO cur_val
    FROM Product
    WHERE ProductID = pd_id;

    INSERT INTO SaleProduct(ReceiptNO_sp, ProductID_sp, CurrentValue, Quantity)
    VALUES (last_sale_id, pd_id, cur_val, quant);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting sale product information.';
    END IF;

    UPDATE Product
    SET QuantityInStock = QuantityInStock - quant
    WHERE ProductID = pd_id;

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error updating product quantity.';
    END IF;
    COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE add_prod_to_new_shopping_cart(IN pa_id INTEGER,
	e_id VARCHAR(10), pd_id INTEGER, quant INTEGER)
BEGIN
    DECLARE cur_stock INTEGER;
    DECLARE cur_val DECIMAL(5,2);
    DECLARE last_sale_id INTEGER;

START TRANSACTION;

    INSERT INTO Sale(TotalValue, TotalQuantity, EmployeeID_s, ParticipantID_s)
    VALUES(0, 0, e_id, pa_id);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting sale information.';
    END IF;

    SELECT ReceiptNO INTO last_sale_id FROM Sale
    ORDER BY ReceiptNO DESC LIMIT 1;

    SELECT BasePrice INTO cur_val
    FROM Product
    WHERE ProductID = pd_id;

    INSERT INTO SaleProduct(ReceiptNO_sp, ProductID_sp, CurrentValue, Quantity)
    VALUES(last_sale_id, pd_id, cur_val, quant);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting sale product information.';
    END IF;

    UPDATE Product
    SET QuantityInStock = QuantityInStock - quant
    WHERE ProductID = pd_id;

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error updating product quantity.';
    END IF;
    COMMIT;
END &&

DELIMITER &&

CREATE PROCEDURE add_prod_to_shopping_cart(IN s_id INTEGER, pa_id INTEGER,
    pd_id INTEGER, quant INTEGER)
BEGIN
	DECLARE cur_stock INTEGER;
    DECLARE cur_val DECIMAL(5,2);


    START TRANSACTION;

    SELECT BasePrice INTO cur_val
    FROM Product
    WHERE ProductID = pd_id;

    INSERT INTO SaleProduct(ReceiptNO_sp, ProductID_sp, CurrentValue, Quantity)
    VALUES (s_id, pd_id, cur_val, quant);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into SaleProduct.';
    END IF;

    UPDATE Product
    SET QuantityInStock = QuantityInStock - quant
    WHERE ProductID = pd_id;

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error updating product quantity.';
    END IF;
    COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE register_sale (IN s_id INTEGER, s_dos DATETIME)
BEGIN
    DECLARE s_totval DECIMAL(5,2);
    DECLARE s_totquant INTEGER;


    START TRANSACTION;

    SELECT SUM(SP.Quantity) INTO s_totquant
    FROM SaleProduct AS SP
    INNER JOIN Sale AS S ON S.ReceiptNO = SP.ReceiptNO_sp
    WHERE S.ReceiptNO = s_id;

    SELECT (SP.Quantity * SP.CurrentValue) INTO s_totval
    FROM SaleProduct AS SP
    INNER JOIN Sale AS S ON S.ReceiptNO = SP.ReceiptNO_sp
    WHERE S.ReceiptNO = s_id;

    UPDATE Sale
    SET TotalValue = s_totval, TotalQuantity = s_totquant, DateOfSale = s_dos
    WHERE ReceiptNO = s_id;

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error updating Sale.';
    END IF;
    COMMIT;
END &&

DELIMITER &&

CREATE PROCEDURE cancel_ongoing_sale (IN s_id INTEGER)
BEGIN
    DECLARE no_pds INT;
    DECLARE pd_id INT;
    DECLARE pd_quant_sold INT;


    START TRANSACTION;

    -- Count the number of products in the sale
    SELECT COUNT(SP.ProductID_sp) INTO no_pds
    FROM SaleProduct AS SP
    WHERE SP.ReceiptNO_sp = s_id;

    -- Loop to add products back to stock
    REPEAT
        SELECT SP.ProductID_sp, SP.Quantity INTO pd_id, pd_quant_sold
        FROM saleproduct AS SP
        INNER JOIN Product AS P ON SP.ProductID_sp = P.ProductID
        WHERE SP.ReceiptNO_sp = s_id
        ORDER BY SP.ProductID_sp DESC
        LIMIT 1;

        UPDATE Product
        SET QuantityInStock = QuantityInStock + pd_quant_sold
        WHERE ProductID = pd_id;

        IF ROW_COUNT() = 0 THEN
			ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error updating product stock.';
        END IF;

        DELETE FROM SaleProduct
        WHERE ReceiptNO_sp = s_id AND ProductID_sp = pd_id;

        IF ROW_COUNT() = 0 THEN
			ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error removing sale of the product.';
        END IF;

        SET no_pds = no_pds - 1;

    UNTIL no_pds <= 0
    END REPEAT;

    DELETE FROM Sale
    WHERE ReceiptNO = s_id;

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error removing the sale.';
    END IF;

    DELETE FROM Participant
    WHERE ParticipantID NOT IN (SELECT ParticipantID_s FROM Sale);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error removing loose participants.';
    END IF;

    COMMIT;
END &&

DELIMITER ;

DELIMITER &&
CREATE PROCEDURE register_new_employee (IN e_id VARCHAR(10), e_name VARCHAR(75),
		vat VARCHAR(9), bd DATE, street VARCHAR(50), locale VARCHAR(30),
		postal VARCHAR(15), manager VARCHAR(10), phone VARCHAR(20), email VARCHAR(75))
BEGIN
    START TRANSACTION;

    INSERT INTO Employee
    VALUES (e_id, e_name, vat, bd, street, locale, postal, manager);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into Employee.';
    END IF;

    CALL register_employee_email(e_id, email);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error calling register_employee_email.';
    END IF;

    CALL register_employee_phone(e_id, phone);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error calling register_employee_phone.';
    END IF;

    COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE register_employee_email (IN e_id VARCHAR(10), e_email VARCHAR(75))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET check_error = TRUE;

	START TRANSACTION;
	
	INSERT INTO EmployeeEmail
	VALUES (e_id, e_email);
	
	IF check_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_employee_phone (IN e_id VARCHAR(10), e_phone VARCHAR(20))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET check_error = TRUE;

	START TRANSACTION;

	INSERT INTO EmployeePhone
	VALUES (e_id, e_phone);
	
	IF check_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_participant_email (IN p_id INTEGER, p_email VARCHAR(75))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET check_error = TRUE;

	START TRANSACTION;

	INSERT INTO ParticipantEmail
	VALUES (p_id, p_email);
	
	IF check_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_participant_phone (IN p_id INTEGER, p_phone VARCHAR(20))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET check_error = TRUE;

	START TRANSACTION;

	INSERT INTO ParticipantPhone
	VALUES (p_id, p_phone);
	
	IF check_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_supplier_email (IN s_id INTEGER, s_email VARCHAR(75))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET check_error = TRUE;

	START TRANSACTION;

	INSERT INTO SupplierEmail
	VALUES (s_id, s_email);
	
	IF check_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_supplier_phone (IN s_id INTEGER, s_phone VARCHAR(20))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET check_error = TRUE;

	START TRANSACTION;

	INSERT INTO SupplierPhone
	VALUES (s_id, s_phone);
	
	IF check_error = FALSE THEN
	COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_new_event (IN e_name VARCHAR(75),
	e_descr TEXT,
	e_beg DATETIME, e_fin DATETIME, e_capacity INTEGER,
	t_descr TEXT, t_price DECIMAL(5,2))
BEGIN
	DECLARE t_stock INT;
	START TRANSACTION;

    INSERT INTO EventCal (EventName, EventDescription, EventStart, EventEnd, Capacity)
    VALUES (e_name, e_descr, e_beg, e_fin, e_capacity);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into EventCal.';
    END IF;

    SET t_stock = e_capacity;
    IF e_capacity = 0 THEN
        SET t_stock = 94967294; -- max int
    END IF;

    INSERT INTO Product (ProductName, ProductDescription, BasePrice, QuantityInStock)
    VALUES (e_name, t_descr, t_price, t_stock);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into Product.';
    END IF;

    COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE assign_employee_event(IN e_id INTEGER, empl_id VARCHAR(10))
BEGIN
    START TRANSACTION;

    -- Insert into EventEmployee
    INSERT INTO EventEmployee
    VALUES (e_id, empl_id);

    IF ROW_COUNT() = 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error inserting into EventEmployee.';
    END IF;

    -- Commit the transaction if all operations are successful
    COMMIT;
END &&
