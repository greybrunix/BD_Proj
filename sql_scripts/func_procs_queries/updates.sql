USE mademoiselle_borges;

DELIMITER &&
CREATE PROCEDURE register_supplier (IN s_name VARCHAR(75), iban VARCHAR(50), street VARCHAR(50),
		locale VARCHAR(30), postal VARCHAR(15), email VARCHAR(75), phone VARCHAR(20))
BEGIN
	DECLARE last_ins INTEGER;
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	INSERT INTO Supplier (SupplierName, IBAN, Street, Locale, Postal)
	VALUES(s_name, iban, street, locale, postal);
	IF check_error = FALSE THEN
		SET @last_ins = (SELECT SupplierID FROM Supplier
			ORDER BY SupplierID DESC LIMIT 1);
		CALL register_supplier_phone(last_ins, phone);
		CALL register_supplier_email(last_ins, email);
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_reservation_new_product (IN product_name VARCHAR(75),
	descript TEXT, baseprice DECIMAL(5,2), supplierid INTEGER, dateofschedule DATETIME,
	stock INT, dateofreservation DATETIME)
BEGIN
	DECLARE product_id INTEGER;
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;
	
	INSERT INTO Product(ProductName, ProductDescription, BasePrice, QuantityInStock)
	VALUES(product_name, descript, base_price, "0");

	SET @product_id = (SELECT ProductID FROM Product ORDER BY ProductID DESC
			LIMIT 1);

	CALL register_reservation_exis_product (product_id, supplierid, dateofschedule,
			dateofreservation, stock, @check_error);
END &&

DELIMITER &&
CREATE PROCEDURE register_reservation_exis_product (IN productid INTEGER,
	supplierid INTEGER, dateofschedule DATETIME, dateofreservation DATETIME, quantity INTEGER,
	INOUT check_error BOOLEAN)
BEGIN
	-- update the future supplies table
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;
	SET @check_error = FALSE;
	
	INSERT INTO ProductSupplierFuture(ProductID_psf, SupplierID_psf,
		DateOfSchedule, DateOfReservation, Quantity)
	VALUES(productid, supplierid, dateofschedule, dateofreservation, quantity);
END &&

DELIMITER &&
CREATE PROCEDURE register_delivery_product (IN p_id INTEGER,
	s_id INTEGER, p_dod DATETIME, p_quantity INTEGER)
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;
	
	UPDATE Product
	SET QuantityInStock = QuantityInStock + p_quantity
	WHERE ProductID = p_id;
	IF check_error = FALSE THEN

		INSERT INTO ProductSupplierPast
		VALUES(p_id, s_id, p_dod, p_quantity);
END &&

-- Creates participants
DELIMITER &&
CREATE PROCEDURE add_prod_new_shop_new_part(IN e_id VARCHAR(10), pd_id INTEGER,
						part_name VARCHAR(75), part_vat VARCHAR(9),
						street VARCHAR(50), locale VARCHAR(30), postal VARCHAR(15), part_bd DATE,
						quant INTEGER, phone VARCHAR(20), email VARCHAR(75))
BEGIN
	DECLARE last_ins INTEGER;
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	INSERT INTO Participant(ParticipantName, ParticipantVAT, ParticipantBirthDate,
				Street, Locale, Postal)
	VALUES (part_name, part_vat, part_bd, street, locale, postal);
    
    SET @last_ins = (SELECT ParticipantID FROM Participant
				ORDER BY ParticipantID DESC LIMIT 1);
	CALL register_participant_number(last_ins, phone);
    
    IF email IS NOT NULL THEN
		CALL register_participant_email(last_ins, email);
	END IF;
	
    INSERT INTO Sale(TotalValue, TotalQuantity, Employee_id_s, ParticipantID_s)
		VALUES(0,0, e_id, pa_id);
	
    SET @last_sale_id = (SELECT ReceiptNO FROM Sale
			ORDER BY ReceiptNO DESC LIMIT 1);

	SELECT BasePrice AS curr_val
		FROM Product
			WHERE ProductID = pd_id;

	INSERT INTO SaleProduct(ReceiptNO_sp, ProductID_sp, CurrentValue, Quantity)
		VALUES(last_sale_id, pd_id, cur_val, quant);
	
    UPDATE Product
		SET Stock = QuantityInStock - quant
			WHERE ProductID = pd_id;
END &&


DELIMITER &&
CREATE PROCEDURE add_prod_to_new_shopping_cart(IN pa_id INTEGER,
	e_id VARCHAR(10), pd_id INTEGER, quant INTEGER)
BEGIN
	DECLARE cur_stock INTEGER;
    DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	INSERT INTO Sale(TotalValue, TotalQuantity, Employee_id_s, ParticipantID_s)
	VALUES(0,0, e_id, pa_id);

	SET @last_sale_id = (SELECT ReceiptNO FROM Sale
		ORDER BY ReceiptNO DESC LIMIT 1);

	SELECT BasePrice AS curr_val
		FROM Product
			WHERE ProductID = pd_id;

	INSERT INTO SaleProduct(ReceiptNO_sp, ProductID_sp, CurrentValue, Quantity)
		VALUES(last_sale_id, pd_id, cur_val, quant);

	UPDATE Product
		SET Stock = QuantityInStock - quant
			WHERE ProductID = pd_id;
END &&

DELIMITER &&
CREATE PROCEDURE register_sale (IN s_id INTEGER, s_dos DATETIME)
BEGIN
	-- update sale table
	DECLARE s_totval DECIMAL(5,2);
	DECLARE s_totquant INTEGER;

	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	SELECT SUM(SP.Quantity) INTO s_totquant
			FROM SaleProduct AS SP INNER JOIN Sale AS S
			ON S.ReceiptNO = SP.ReceiptNO_sp
			WHERE S.ReceiptNO = s_id;
	SELECT (SP.Quantity * SP.CurrentValue) INTO s_totval
			FROM SaleProduct AS SP INNER JOIN Sale AS S
			ON S.ReceiptNO = SP.ReceiptNO_sp
			WHERE S.ReceiptNO = s_id;

	UPDATE Sale
		SET TotalValue = s_totval, TotalQuantity = s_totquant, DateOfSale = s_dos
			WHERE ReceiptNO = s_id;
END &&

DELIMITER &&
CREATE PROCEDURE cancel_ongoing_sale (IN s_id INTEGER)
BEGIN
	DECLARE no_pds INT;
	DECLARE pd_id INT;
	DECLARE pd_quant_sold INT;
	DECLARE check_error BOOLEAN DEFAULT FALSE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	SELECT COUNT(SP.ProductID_sp) INTO no_pds
		FROM SaleProduct AS SP
		WHERE SP.ReceiptNO_sp = s_id;
	
    REPEAT -- Selecionar produtos para adicionar no stock
		SELECT SP.ProductID_sp, SP.Quantity INTO pd_id, pd_quant_sold
			FROM saleproduct AS SP
				INNER JOIN Product AS P
				ON SP.ProductID_sp = P.ProductID
					WHERE SP.ReceiptNO_sp = s_id
			ORDER BY SP.ProductID_sp DESC
		LIMIT 1;

	-- atualizar stock do produto selecionado
	UPDATE Product
		SET QuantityInStock = QuantityInStock + pd_quant_sold
			WHERE ProductID = pd_id;

	-- retirar a venda do produto selecionado
	DELETE FROM SaleProduct
			WHERE ReceiptNO_sp = s_id AND ProductID_sp = pd_id;
				SET no_pds = no_pds - 1;
		UNTIL no_pds <= 0 OR check_error != FALSE
	END REPEAT;

	DELETE FROM Sale
		WHERE ReceiptNO = s_id;
			-- check if loose participant
			DELETE FROM Participant
				WHERE ParticipantID NOT IN (SELECT ParticipantID_s
					FROM Sale);
END &&

DELIMITER &&
CREATE PROCEDURE register_new_employee (IN e_id VARCHAR(10), e_name VARCHAR(75),
		vat VARCHAR(9), bd DATE, street VARCHAR(50), locale VARCHAR(30),
		postal VARCHAR(15), manager VARCHAR(10), phone VARCHAR(20), email VARCHAR(75))
BEGIN

	INSERT INTO Employee
	VALUES (e_id, e_name, vat, bd, street, locale, postal, manager);

	CALL register_employee_email(e_id, email);

	CALL register_employee_phone(e_id, phone);

END &&

DELIMITER &&
CREATE PROCEDURE register_employee_email (IN e_id VARCHAR(10), e_email VARCHAR(75))
BEGIN
	INSERT INTO EmployeeEmail
	VALUES (e_id, e_email);
END &&

DELIMITER &&
CREATE PROCEDURE register_employee_phone (IN e_id VARCHAR(10), e_phone VARCHAR(20))
BEGIN
	INSERT INTO EmployeePhone
	VALUES (e_id, e_phone);
END &&

DELIMITER &&
CREATE PROCEDURE register_participant_email (IN p_id INTEGER, p_email VARCHAR(75))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	INSERT INTO ParticipantEmail
		VALUES (p_id, p_email);
END &&

DELIMITER &&
CREATE PROCEDURE register_participant_phone (IN p_id INTEGER, p_phone VARCHAR(20))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	INSERT INTO ParticipantPhone
	VALUES (p_id, p_phone);
END &&

DELIMITER &&
CREATE PROCEDURE register_supplier_email (IN s_id INTEGER, s_email VARCHAR(75))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	INSERT INTO SupplierEmail
		VALUES (s_id, s_email);
END &&

DELIMITER &&
CREATE PROCEDURE register_supplier_phone (IN s_id INTEGER, s_phone VARCHAR(20))
BEGIN
	DECLARE check_error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @check_error = TRUE;

	INSERT INTO SupplierPhone
		VALUES (s_id, s_phone);
END &&

DELIMITER &&
CREATE PROCEDURE register_new_event (IN e_name VARCHAR(75),
	e_descr TEXT,
	e_beg DATETIME, e_fin DATETIME, e_capacity INTEGER,
	t_descr TEXT, t_price DECIMAL(5,2))
BEGIN
	DECLARE t_stock INT;
	
	-- update with new event
	INSERT INTO EventCal (EventName, EventDescription, EventStart, EventEnd, Capacity)
		VALUES (e_name, e_descr, e_beg, e_fin , e_capacity);

	SET t_stock = e_capacity;
	IF e_capacity = 0 THEN
		SET t_stock = 94967294; -- max int
	END IF;

	INSERT INTO Product (ProductName, ProductDescription, BasePrice, QuantityInStock)
		VALUES (e_name, t_descr, t_price, t_stock);
END &&

DELIMITER &&
CREATE PROCEDURE assign_employee_event(IN e_id INTEGER, empl_id VARCHAR(10))
BEGIN
	INSERT INTO EventEmployee
		VALUES (e_id, empl_id);
END &&
