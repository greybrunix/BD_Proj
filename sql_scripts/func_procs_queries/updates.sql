USE mademoiselle_borges;

DELIMITER &&
CREATE PROCEDURE register_reservation_new_product (IN product_name VARCHAR(75),
	descript TEXT, baseprice DECIMAL(5,2), supplierid INTEGER, dateofschedule DATETIME,
	stock INT, dateofreservation DATETIME)
BEGIN
	DECLARE product_id INTEGER;
	DECLARE check_error BOOLEAN;
	START TRANSACTION;

	INSERT INTO Product(ProductName, ProductDescription, BasePrice, QuantityInStock)
	VALUES(product_name, descript, base_price, "0");

	SET @product_id = LAST_INSERT_ID();
	SET @check_error = (product_id = (SELECT ProductID FROM Product ORDER BY ProductID DESC
		LIMIT 1));

	IF check_error = TRUE THEN

		INSERT INTO ProductSupplierFuture(ProductID_psf,SupplierID_psf,DateOfReservation,
			DateOfSchedule, Quantity)
		VALUES(product_id, supplierid, dateofreservation, dateofschedule, stock);
		COMMIT;

	ELSE
		ROLLBACK;
	END IF;
END &&

DELIMITER &&
CREATE PROCEDURE register_reservation_exis_product (IN productid INTEGER,
	supplierid INTEGER, dateofschedule DATETIME, dateofreservation DATETIME, quantity INTEGER)
BEGIN
	-- update the future supplies table
	START TRANSACTION;
	INSERT INTO product_supplier_future(ProductID_psf, SupplierID_psf,
		DateOfSchedule, DateOfReservation, Quantity)
	VALUES(productid, supplierid, dateofschedule, dateofreservation, quantity);
	COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE register_delivery_product (IN p_id INTEGER,
	p_stock INTEGER, s_id INTEGER, p_dod DATETIME, p_quantity INTEGER)
BEGIN
	START TRANSACTION;
	UPDATE product
	SET stock = p_stock + p_quantity
	WHERE id = p_id;

	INSERT INTO product_supplier_past(product_id_psp, supplier_id_psp,dod, quantity)
	VALUES(p_id, s_id, p_dod, p_quantity);
	COMMIT;
END &&

-- Missing something to create participants
DELIMITER &&
CREATE PROCEDURE add_prod_to_new_shopping_cart(IN pa_id INTEGER,
	e_id VARCHAR(10), pd_id INTEGER, quant INTEGER)
BEGIN
	START TRANSACTION;
	DECLARE cur_stock INTEGER;
	INSERT INTO sale(employee_id_s, participant_id_s)
	VALUES(e_id, pd_id);

	SET @last_sale_id = LAST_INSERT_ID();

	SELECT price AS curr_val
		FROM product
		WHERE id = pd_id;

	INSERT INTO sale_product(sale_id_sp, product_id_sp, val, quantity)
	VALUES(@last_sale_id, pd_id, cur_val, quant);

	UPDATE product
	SET stock = stock - quant
	WHERE id = p;
	COMMIT;

END &&

DELIMITER &&
CREATE PROCEDURE register_sale (IN s_id INTEGER, s_dos DATETIME)
BEGIN
	-- update sale table
	START TRANSACTION;
	DECLARE s_totval DECIMAL(5,2);
	DECLARE s_totquant INTEGER;
	SELECT (SP.quantity * SP.val) INTO s_totval
		FROM sale_product AS SP INNER JOIN sale AS S
		ON s_id = S.id = SP.sale_id_sp;
	SELECT SUM(SP.quantity) INTO s_totquant
		FROM sale_product AS SP INNER JOIN sale AS S
		ON s_id =  S.id = SP.sale_id_sp;
	UPDATE sale
	SET val = s_totval, quantity = s_totquant, dos = s_dos
	where id = s_id;
	COMMIT;
	
END &&

DELIMITER &&
CREATE PROCEDURE register_new_employee (IN e_id VARCHAR(10), e_name VARCHAR(75),
	e_vat VARCHAR(9), e_birth   DATE, e_street   VARCHAR(50),
	e_locale   VARCHAR(30), e_postal   VARCHAR(15), e_employee_id_e   VARCHAR(10))
BEGIN
	-- update employee table
	START TRANSACTION;
	INSERT INTO Employee (EmployeeID, EmployeeName, EmployeeVAT, 
		EmployeeBirthDate, Street, Locale, PostalCode, EmployeeID_e)
	VALUES (e_id,e_name,e_vat,e_birth,e_street,e_locale,e_postal,e_employee_id_e);
	COMMIT;
END &&

DELIMITER &&
CREATE PROCEDURE register_new_event (IN e_name VARCHAR(75),
	e_descr TEXT,
	e_beg DATETIME, e_fin DATETIME, e_capacity INTEGER,
	t_descr TEXT, t_price DECIMAL(5,2))
BEGIN
	START TRANSACTION;
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
	COMMIT;
END &&
