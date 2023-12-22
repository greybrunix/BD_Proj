USE mademoiselle_borges;


-- check who manages an employee (41)
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
SELECT *
	FROM sale;

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
SELECT *
 FROM product;

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
SELECT P.id, P.name
	FROM participant as P INNER JOIN sale as S
		ON P.id = S.participant_id_s
	GROUP BY P.id
		ORDER BY COUNT(P.id = S.participant_id_s) DESC
LIMIT 1;

-- check all suppliers (RM12)
SELECT *
 FROM supplier;

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

-- check the event with the most value in sales (RM37) INCORRETO

SELECT E.id, E.name, SUM(S.Val) AS totVal
	FROM event AS E INNER JOIN sale as S
		ON S.dos BETWEEN E.beg AND E.fin
	GROUP BY E.id, E.name
		ORDER BY totVal DESC
LIMIT 1;

-- CHECK which event has most volume sales
SELECT EV.id, EV.name, SUM(SP.quantity) AS quant
	FROM event AS EV INNER JOIN product AS P
		ON EV.name = P.name
	INNER JOIN sale_product AS SP
		ON P.id = SP.product_id_sp
	GROUP BY EV.id, EV.name
		ORDER BY quant DESC
LIMIT 1;
-- check who sold the most tickets in Event
DELIMITER &&
CREATE FUNCTION GetSoldMostInEv (id INTEGER)
RETURNS VARCHAR(10)
DETERMINISTIC
   BEGIN
   DECLARE res VARCHAR(10);
	SELECT Em.id INTO res
		FROM event AS Ev INNER JOIN event_employee AS EE
			ON id = Ev.id = EE.event_id_ee -- bruh
			INNER JOIN employee AS Em
				ON EE.employee_id_ee = Em.id -- data probs
			INNER JOIN sale AS S
				ON Em.id = S.employee_id_s
		GROUP BY Ev.id, Ev.name
			ORDER BY SUM(S.quantity);
	-- LIMIT 1;
    RETURN res;
END &&

DROP FUNCTION GetSoldMostInEv;
SELECT GetSoldMostInEv(1);
