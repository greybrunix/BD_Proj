USE mademoiselle_borges;

DELIMITER &&
CREATE PROCEDURE register_reservation_new_product (IN p_NAME VARCHAR(75),
       p_descr TEXT, p_price DECIMAL(5,2), s_id INTEGER, p_dod DATETIME,
       p_quantity INT)
  BEGIN
        -- update the product table
        INSERT INTO product(name, descr, price, stock)
        VALUES(p_NAME, p_descr, p_price, "0");

        -- update the the future supplies table
        INSERT INTO product_supplier_future(product_id_psp, supplier_id_psp,dod, quantity)
        VALUES(LAST_INSERT_ID(), s_id, p_dod, p_quantity);
END &&

DELIMITER &&
CREATE PROCEDURE register_reservation_exis_product (IN p_id INTEGER,
       p_stock INTEGER, s_id INTEGER, p_dod DATETIME, p_quantity INTEGER)
  BEGIN
        -- update the the future supplies table
        INSERT INTO product_supplier_future(product_id_psp, supplier_id_psp,dod, quantity)
        VALUES(p_id, s_id, p_dod, p_quantity);
END &&
DELIMITER &&
CREATE PROCEDURE register_delivery_product (IN p_id INTEGER,
       p_stock INTEGER, s_id INTEGER, p_dod DATETIME, p_quantity INTEGER)
  BEGIN
        -- update the remainding stock of the given product
        UPDATE product
        SET stock = p_stock + p_quantity
            WHERE id = p_id;
        -- 
        INSERT INTO product_supplier_past(product_id_psp, supplier_id_psp,dod, quantity)
        VALUES(p_id, s_id, p_dod, p_quantity);
END &&        

-- Missing something to create participants
DELIMITER &&
CREATE PROCEDURE add_prod_to_new_shopping_cart(IN pa_id INTEGER,
      e_id VARCHAR(10), pd_id INTEGER, quant INTEGER)
  BEGIN
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

END &&

DELIMITER &&
CREATE PROCEDURE register_sale (IN s_id INTEGER, s_dos DATETIME)
  BEGIN
  -- update sale table
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
	
END &&


DELIMITER &&
CREATE PROCEDURE register_new_employee (IN e_id VARCHAR(10), e_name VARCHAR(75),
       e_vat VARCHAR(9), e_birth   DATE, e_street   VARCHAR(50),
       e_locale   VARCHAR(30), e_postal   VARCHAR(15), e_employee_id_e   VARCHAR(10))
  BEGIN
    -- update employee table
        INSERT INTO employee (id, name, vat, birth, street, locale, postal, employee_id_e)
        VALUES (e_id,e_name,e_vat,e_birth,e_street,e_locale,e_postal,e_employee_id_e);
END &&

DELIMITER &&
CREATE PROCEDURE register_new_event (IN e_descr TEXT,
        e_beg DATETIME, e_fin DATETIME, e_capacity INTEGER)
  BEGIN
    -- update with new event
        INSERT INTO event (descr, beg, fin, capacity)
        VALUES (e_descr, e_beg, e_fin , e_capacity);
END &&

DELIMITER &&
CREATE PROCEDURE update_info_()
  BEGIN
END &&
