USE mademoiselle_borges;


-- check who manages an employee (43)
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

-- check products in sale (44)
DELIMITER &&
CREATE PROCEDURE check_products_in_sale (IN id INTEGER)
 BEGIN
    SELECT product_id_sp
        FROM sale_product
        WHERE sale_id_sp = id;
END &&

-- check all closed sales (45)
SELECT id
	FROM sale
	WHERE dos IS NOT NULL;

-- check all participants of a given event (46)
DELIMITER &&
CREATE PROCEDURE check_parts_in_ev (IN name VARCHAR(75))
  BEGIN
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
-- check all participants of all events (47)
SELECT P.id, P.name
  FROM participant AS P INNER JOIN sale as S
		ON P.id = S.participant_id_s
	  INNER JOIN employee as E
		ON S.employee_id_s = E.id
	  INNER JOIN event_employee as EE
		ON E.id = EE.employee_id_ee
	  INNER JOIN event as EV
		ON EE.event_id_ee = EV.id;

-- check all participants of all events (47)
SELECT id, name
	FROM participant;

-- check participant associated with a specific sale (48)
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

-- check all products (49)
SELECT id, name
 FROM product;

-- check suppliers of a product (50)
DELIMITER &&
CREATE PROCEDURE check_product_suppliers (IN id INTEGER) 
	BEGIN
     SELECT PSP.id, PSP.name, PSF.id, PSF.name
         FROM product_supplier_past AS PSP INNER JOIN product_supplier_future AS PSF
			ON PSP.product_id_psp = id AND PSF.product_id_psf = id;
END &&

-- check past suppliers of a product (51)
DELIMITER &&
CREATE PROCEDURE check_past_suppliers_prod (IN id INTEGER)
	BEGIN
	SELECT PSP.id, PSP.name
		FROM product_supplier_past AS PSP
		WHERE PSP.id = id;
END &&

-- check future supppliers of a product (52)
DELIMITER &&
CREATE PROCEDURE check_fut_suppliers_prod (IN id INTEGER)
	BEGIN
	SELECT PSF.id, PSP.name
		FROM product_supplier_future AS PSF
		WHERE PSF.id = id;
END &&

-- check all sales associated with a participant (53)
DELIMITER &&
CREATE PROCEDURE check_all_participant_sales (IN id INTEGER)
  BEGIN
     SELECT *
         FROM sale AS S
         WHERE S.participant_id_s = id;
END &&

-- check all suppliers (54)
SELECT id, name
 FROM supplier;
-- check all employees (55)
SELECT id, name
	FROM employee;
-- check all events (56)
SELECT id, name
	FROM event;

-- check sale values and volume in a given day (57 and 58)
DELIMITER &&
CREATE PROCEDURE check_daily_sales (IN dos DATE)
  BEGIN
     SELECT SUM(S.value) AS Value, SUM(S.quantity) AS Volume
         FROM sale AS S
         WHERE YEAR(S.dos) = YEAR(dos) AND MONTH(S.dos) = MONTH(dos) AND DAY(S.dos) = DAY(dos);
END &&

-- check participant with highest volume sales associated (59)
SELECT P.id, P.name, SUM(S.quantity) AS Volume
	FROM participant as P INNER JOIN sale as S
		ON P.id = S.participant_id_s
	GROUP BY P.id
		ORDER BY Volume DESC -- COUNT(P.id = S.participant_id_s) DESC
LIMIT 1;

-- check which event has most volume sales (60)
SELECT EV.id, EV.name, SUM(SP.quantity) AS quant
	FROM event AS EV INNER JOIN product AS P
		ON EV.name = P.name
	INNER JOIN sale_product AS SP
		ON P.id = SP.product_id_sp
	GROUP BY EV.id, EV.name
		ORDER BY quant DESC
LIMIT 1;

-- check event with highest rate participation (61)



-- check events in a given timespan (71)
DELIMITER &&
CREATE PROCEDURE EventsInTimespan(IN firstday DATETIME, IN lastday DATETIME)
 BEGIN
	SELECT id, name 
		FROM event
        WHERE TIMEDIFF(lastday,firstday) > '00:00:00' AND 
			 (TIMEDIFF(firstday,beg) >= '00:00:00' AND TIMEDIFF(lastday,fin) <= '00:00:00') OR
			 (TIMEDIFF(firstday,beg) < '00:00:00' AND TIMEDIFF(lastday,fin) <= '00:00:00' AND TIMEDIFF(lastday,beg) > '00:00:00') OR 
			 (TIMEDIFF(firstday,beg) >= '00:00:00' AND TIMEDIFF(firstday,fin) < '00:00:00' AND TIMEDIFF(lastday,fin) > '00:00:00');
 END&&
CALL EventsInTimespan('2023-12-10 08:00:00','2023-12-15 20:00:00');


-- check who sold the most tickets in Event (72)
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
			ORDER BY SUM(S.quantity)
	LIMIT 1;
    RETURN res;
END &&
-- FUNCTION????

-- events someone participated in (81)

-- check who an employee manages (92)
DELIMITER &&
CREATE PROCEDURE check_managed_by (IN id VARCHAR(10))
  BEGIN
     SELECT *
        FROM employee AS E
        WHERE E.employee_id_e = id;
END &&

-- check the event with the most value in sales (93)
SELECT E.id, E.name, SUM(S.Val) AS totVal
	FROM event AS E INNER JOIN sale as S
		ON S.dos BETWEEN E.beg AND E.fin
	GROUP BY E.id, E.name
		ORDER BY totVal DESC
LIMIT 1;

-- check on employee sales (98)
DELIMITER &&
CREATE PROCEDURE check_employee_sales (IN id VARCHAR(10))
 BEGIN 
    SELECT S.id
        FROM sale
        WHERE employee_id_s = id;
END &&

DROP FUNCTION GetSoldMostInEv;
SELECT GetSoldMostInEv(1);
