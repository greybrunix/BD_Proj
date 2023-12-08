USE mademoiselle_borges

DELIMITER &&
CREATE PROCEDURE register_delivery_new_product (IN p_NAME VARCHAR(75),
       p_descr TEXT, p_price DECIMAL(5,2), p_stock INT, s_id INT, p_dod DATETIME,
       p_quantity INT)
  BEGIN
        -- update the product table
        INSERT INTO product(name, descr, price, stock)
        VALUES(p_NAME, p_descr, p_price, p_stock);

        -- update the the past supplies table
        INSERT INTO product_supplier_past(product_id_psp, supplier_id_psp,dod, quantity)
        VALUES(LAST_INSERT_ID(), s_id, p_dod, p_quantity);
END &&

DELIMITER &&
CREATE PROCEDURE register_delivery_exis_product (IN p_id INTEGER,
       p_stock INT, s_id INT, p_dod DATETIME, p_quantity INT)
  BEGIN
        -- update the remainding stock of the given product
        UPDATE product
        SET stock = p_stock + p_quantity
            WHERE id = p_id;
        -- 
        INSERT INTO product_supplier_past(product_id_psp, supplier_id_psp,dod, quantity)
        VALUES(LAST_INSERT_ID(), s_id, p_dod, p_quantity);
END &&        

DELIMITER &&
CREATE PROCEDURE register_sale (IN p_id INTEGER,
       	s_val DECIMAL(5,2),
	    s_quant INTEGER,
       	s_date DATETIME,
	    e_id VARCHAR(10))
  BEGIN
  -- update sale table
  INSERT INTO sale(val, quantity, dos, employee_id_s, participant_id_s)
	VALUES (s_val, s_quant, s_date, e_id, p_id);
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
CREATE PROCEDURE expunge_employee_data (IN e_id VARCHAR(10))
  BEGIN
    UPDATE employee
    SET is_del = 1
        WHERE id = e_id;
END &&

DELIMITER &&
CREATE PROCEDURE expunge_participant_data (IN p_id INTEGER)
  BEGIN
    UPDATE participant
    SET id_del = 1
        WHERE id = p_id;
END &&
