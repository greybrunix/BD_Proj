-- check who manages an employee
USE mademoiselle_borges

DELIMITER &&
CREATE FUNCTION check_manager (IN id VARCHAR(10))
RETURNS VARCHAR(10)
DETERMINISTIC
 BEGIN
    DECLARE manager VARCHAR(10);
    SELECT employee_id_e INTO manager
        FROM employee AS E
        WHERE id = E.id;
    RETURN manager;
END &&
-- check who an employee manages
DELIMITER &&
CREATE PROCEDURE check_managed_by (IN id VARCHAR(10))
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
     SELECT *
        FROM employee AS E
        WHERE E.employee_id_e = id;
END &&

-- check on employee sales
DELIMITER &&
CREATE PROCEDURE check_employee_sales (IN id VARCHAR(10))
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
        FROM employee AS E INNER JOIN sale as S
            ON E.id = S.id
        WHERE E.id = id;
END &&
-- check all sales
DELIMITER &&
CREATE PROCEDURE check_all_sales ()
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
        FROM sale;
END &&

-- check articles in sale
DELIMITER &&
CREATE PROCEDURE check_products_in_sale (IN id INTEGER)
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
CREATE FUNCTION check_participant_in_sale (IN id INTEGER)
RETURNS INTEGER
DETERMINISTIC
  BEGIN 
     DECLARE partic INTEGER;
     SELECT participant_id_s INTO partic
         FROM sale AS S
         WHERE S.id = id;
     RETURN partic;
END &&
-- check all products
DELIMITER &&
CREATE PROCEDURE check_all_products ()
  BEGIN 
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUTER' Message;
     SELECT *
         FROM product;
END &&
-- check alls sales associated with a participant
DELIMITER &&
CREATE PROCEDURE check_all_participant_sales (IN id INTEGER)
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT id
         FROM sale AS S
         WHERE S.participant_id_s = id
END &&
-- check part with most sales associated
DELIMITER &&
CREATE FUNCTION check_participant_with_most_sales ()
RETURNS INTEGER
DETERMINISTIC
  BEGIN
     DECLARE partic INTEGER ;
     SELECT P.id INTO partic -- sort and get first value
         FROM sale AS S INNER JOIN participant AS P
         ORDER BY (COUNT(S.participant_id_s = P.id))
     LIMIT 1;
     RETURN partic;
END &&
-- check all suppliers
DELIMITER &&
CREATE PROCEDURE check_all_suppliers ()
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT *
         FROM supplier;
END &&

-- perhaps merge into one procedure
-- check past suppliers of a product
DELIMITER &&
CREATE PROCEDURE check_product_suppliers (IN id INTEGER)
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT supplier_id_psp
         FROM product_supplier_past
         WHERE id = product_id_psp;
END &&
-- check sales in a given day
DELIMITER &&
CREATE PROCEDURE check_daily_sales (IN dos DATE)
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

