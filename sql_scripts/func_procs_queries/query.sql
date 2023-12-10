-- check who manages an employee (RM01)
DELIMITER &&
CREATE FUNCTION check_manager (id VARCHAR(10))
RETURNS VARCHAR(10)
DETERMINISTIC
 BEGIN
    DECLARE manager VARCHAR(10);
    SELECT employee_id_e INTO manager
        FROM employee AS E
        WHERE id = E.id;
    RETURN manager;
END &&

-- check who an employee manages (RM35)
DELIMITER &&
CREATE PROCEDURE check_managed_by (IN id VARCHAR(10))
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
     SELECT *
        FROM employee AS E
        WHERE E.employee_id_e = id;
END &&

-- check on employee sales (RM02)
DELIMITER &&
CREATE PROCEDURE check_employee_sales (IN id VARCHAR(10))
 BEGIN 
    SELECT *
        FROM employee AS E INNER JOIN sale as S
            ON E.id = S.employee_id_s
        WHERE E.id = id;
END &&

-- check all sales (RM05)
DELIMITER &&
CREATE PROCEDURE check_all_closed_sales ()
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
        FROM sale;
END &&

-- check articles in sale (RM03)
DELIMITER &&
CREATE PROCEDURE check_products_in_sale (IN id INTEGER)
 BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
    SELECT product_id_sp
        FROM sale_product
        WHERE sale_id_sp = id;
END &&

-- check all participants of a given event (RM06)
DELIMITER &&
CREATE PROCEDURE GetEvParticipants (IN name VARCHAR(75))
  BEGIN
      DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
      SELECT P.id, P.name
          FROM participant AS P INNER JOIN sale as S
			ON P.id = S.participant_id_s
		  INNER JOIN employee as E
			ON S.employee_id_s = E.id
		  INNER JOIN event_employee as EE
			ON E.id = EE.employee_id_ee
		  INNER JOIN event as EV
			ON EE.event_id_ee = EV.id
		  WHERE EV.name = name;
END &&

-- check all participants of all events (RM07)
DELIMITER &&
CREATE PROCEDURE GetAllEvParticipants ()
BEGIN
      DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
      SELECT P.id, P.name
          FROM participant AS P INNER JOIN sale as S
			ON P.id = S.participant_id_s
		  INNER JOIN employee as E
			ON S.employee_id_s = E.id
		  INNER JOIN event_employee as EE
			ON E.id = EE.employee_id_ee
		  INNER JOIN event as EV
			ON EE.event_id_ee = EV.id;
END &&

-- check participant associated with a specific sale (RM08)
DELIMITER &&
CREATE FUNCTION check_participant_in_sale (id INTEGER)
RETURNS INTEGER
DETERMINISTIC
  BEGIN 
     DECLARE partic INTEGER;
     SELECT participant_id_s INTO partic
         FROM sale AS S
         WHERE S.id = id;
     RETURN partic;
END &&

-- check all products (RM09)
DELIMITER &&
CREATE PROCEDURE check_all_products ()
  BEGIN 
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUTER' Message;
     SELECT *
         FROM product;
END &&

-- check all sales associated with a participant (RM11)
DELIMITER &&
CREATE PROCEDURE check_all_participant_sales (IN id INTEGER)
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT *
         FROM sale AS S
         WHERE S.participant_id_s = id;
END &&

-- check participant with most sales associated (RM16)
DELIMITER &&
CREATE PROCEDURE check_participant_with_most_sales ()
  BEGIN 
     SELECT P.id, P.name
		FROM participant as P INNER JOIN sale as S
			ON P.id = S.participant_id_s
		GROUP BY P.id
			ORDER BY COUNT(P.id = S.participant_id_s) DESC
				LIMIT 1;
END &&

-- check all suppliers (RM12)
DELIMITER &&
CREATE PROCEDURE check_all_suppliers ()
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT *
         FROM supplier;
END &&

-- check suppliers of a product (RM10)
DELIMITER &&
CREATE PROCEDURE check_product_suppliers (IN id INTEGER) 
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT *
         FROM product_supplier_past AS PSP INNER JOIN product_supplier_future AS PSF
			ON PSP.product_id_psp = id AND PSF.product_id_psf = id;
END &&

-- check sales in a given day (RM15)
DELIMITER &&
CREATE PROCEDURE check_daily_sales (IN dos DATE)
  BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
     SELECT *
         FROM sale AS S
         WHERE YEAR(S.dos) = YEAR(dos) AND MONTH(S.dos) = MONTH(dos) AND DAY(S.dos) = DAY(dos);
END &&

-- check all employees (RM13)
DELIMITER &&
CREATE PROCEDURE check_all_employees ()
	BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
        SELECT *
			FROM employee;
END &&

-- check all events (RM14)
DELIMITER &&
CREATE PROCEDURE check_all_employees ()
	BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
        SELECT *
			FROM event;
END &&

-- check the event with the most value in sales (RM37) INCORRETO
DELIMITER &&
CREATE PROCEDURE check_event_most_value ()
	BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTER' Message;
        SELECT EV.id, EV.name
			FROM event AS EV INNER JOIN event_employee as EE
				ON EV.id = EE.event_id_ee
					INNER JOIN employee as E
						ON EE.employee_id_ee = E.id
					INNER JOIN sale as S
						ON E.id = S.employee_id_s
			GROUP BY Ev.id, EV.name
            ORDER BY SUM(S.val) 
            LIMIT 1;
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