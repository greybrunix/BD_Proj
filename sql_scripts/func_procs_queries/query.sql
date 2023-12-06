-- check who manages an employee
DELIMITER &&
CREATE PROCEDURE GetMngr (IN id VARCHAR(10))
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT employee_id_e
        FROM employee AS E
	WHERE id = E.id;
END &&
-- check who an employee manages
DELIMITER &&
CREATE PROCEDURE GetMngd (IN id VARCHAR(10))
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
     SELECT *
        FROM employee AS E
	   WHERE E.employee_id_e = id;
END &&

-- check on employee sales
DELIMITER &&
CREATE PROCEDURE GetVendasFunc (IN id VARCHAR(10))
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
        FROM employee AS E INNER JOIN sale as S
            ON E.id = S.id
        WHERE E.id = id;
END &&
-- check all sales
DELIMITER &&
CREATE PROCEDURE GetVendas ()
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
        FROM sale;
END &&

-- check articles in sale
DELIMITER &&
CREATE PROCEDURE GetProductsInSale (IN id INTEGER)
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
    SELECT product_id_sp
        FROM sale_product
	WHERE sale_id_sp = id;
END &&
-- check all participants of a given event
-- DELIMITER &&
-- CREATE PROCEDURE GetEvParticipants (IN id INTEGER)
--   BEGIN
--      DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
--      SELECT id
--          FROM sale AS S INNER JOIN 
--          WHERE S.participant_id_s = id AND 
-- S.participant_id_s <-> S.employee_id_s <-> event_employee.employee_id_ee
-- END &&
-- check all participants of all events
-- DELIMITER &&
-- CREATE PROCEDURE GetEvParticipants (IN id INTEGER)
--   BEGIN
--      DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
--      SELECT id
--          FROM sale AS S INNER JOIN 
--          WHERE S.participant_id_s = id AND 
-- S.participant_id_s <-> S.employee_id_s <-> event_employee.employee_id_ee
--END &&
-- check participant associated with a specific sale
DELIMITER &&
CREATE PROCEDURE GetPartInSale (IN id INTEGER)
  BEGIN 
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUTER' Message;
     SELECT participant_id_s
         FROM sale AS S
	 WHERE S.id = id;
END &&
-- check all products
DELIMITER &&
CREATE PROCEDURE GetProds ()
  BEGIN 
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUTER' Message;
     SELECT *
         FROM product;
END &&
-- check alls sales associated with a participant
DELIMITER &&
CREATE PROCEDURE GetSalesOfPart (IN id INTEGER)
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT id
         FROM sale AS S
	 WHERE S.participant_id_s = id
END &&
-- check part with most sales associated
DELIMITER &&
CREATE PROCEDURE GetPartWithMostSales ()
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT P.id -- sort and get first value
         FROM sale AS S INNER JOIN participant AS P
	 ORDER BY (COUNT(S.participant_id_s = P.id));
END &&
-- check all suppliers
DELIMITER &&
CREATE PROCEDURE GetSuppliers ()
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT *
         FROM supplier;
END &&
-- check past suppliers of a product
DELIMITER &&
CREATE PROCEDURE GetProdSupplier (IN id INTEGER)
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT supplier_id_psp
         FROM product_supplier_past
	 WHERE id = product_id_psp;
END &&
-- check sales in a given day
DELIMITER &&
CREATE PROCEDURE GetDaySakes (IN dos DATE)
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT *
         FROM sale AS S
	 WHERE S.dos = dos;
END &&
-- check who sold the most tickets in Event
-- DELIMITER &&
-- CREATE PROCEDURE GetSoldMostInEv (IN id INTEGER)
--   BEGIN
--      DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUTER' Message;
--      SELECT *
--          FROM sale AS S
--          WHERE S
-- END &&
-- asdklj

