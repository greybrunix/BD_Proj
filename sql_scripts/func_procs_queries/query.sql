USE mademoiselle_borges;

-- check who manages an Employee (43)
DELIMITER &&
CREATE FUNCTION check_manager (id VARCHAR(10))
RETURNS VARCHAR(10)
DETERMINISTIC
 BEGIN
    DECLARE manager VARCHAR(10);
    SELECT EmployeeID_e INTO manager
        FROM Employee AS E
        WHERE id = E.EmployeeID;
    RETURN manager;
END &&

-- check all closed sales (45)
SELECT ReceiptNO
	FROM Sale
	WHERE DateOfSale IS NOT NULL;

-- check all participants of all events (47)
SELECT ParticipantID, ParticipantName
	FROM Participant;

-- check participant associated with a specific sale (48)
DELIMITER &&
CREATE FUNCTION check_participant_in_sale (id INTEGER)
RETURNS INTEGER
DETERMINISTIC
  BEGIN 
     DECLARE partic INTEGER;
     SELECT ParticipantID_s INTO partic
         FROM Sale AS S
         WHERE S.ReceiptNO = id;
     RETURN partic;
END &&

-- check all products (49)
SELECT ProductID, ProductName
 FROM Product;

-- check past suppliers of a product (51)
DELIMITER &&
CREATE PROCEDURE check_past_suppliers_prod (IN id INTEGER)
	BEGIN
	SELECT PSP.ProductID_psp, PSP.name
		FROM ProductSupplierPast AS PSP
		WHERE PSP.ProductID_psp = id;
END &&

-- check future supppliers of a product (52)
DELIMITER &&
CREATE PROCEDURE check_fut_suppliers_prod (IN id INTEGER)
	BEGIN
	SELECT PSF.ProductID_psf
		FROM ProductSupplierFuture AS PSF
		WHERE PSF.ProductID_psf = id;
END &&

-- check all sales associated with a participant (53)
DELIMITER &&
CREATE PROCEDURE check_all_participant_sales (IN id INTEGER)
  BEGIN
     SELECT *
         FROM Sale AS S
         WHERE S.ParticipantID_s = id;
END &&

-- check all suppliers (54)
SELECT SupplierID, SupplierName
 FROM Supplier;
-- check all Employees (55)
SELECT EmployeeID, EmployeeName
	FROM Employee;
-- check all events (56)
SELECT EventID, EventName
	FROM EventCal;

-- check sale values and volume in a given day (57 and 58)
DELIMITER &&
CREATE PROCEDURE check_daily_sales (IN dos DATE)
  BEGIN
     SELECT SUM(S.TotalValue) AS Value, SUM(S.TotalQuantity) AS Volume
         FROM Sale AS S
         WHERE YEAR(S.DateOfSale) = YEAR(dos) AND MONTH(S.DateOfSale) = MONTH(dos) AND DAY(S.DateOfSale) = DAY(dos);
END &&

-- check participant with highest volume sales associated (59)
SELECT P.ParticipantID, P.ParticipantName, SUM(S.TotalQuantity) AS Volume
	FROM Sale AS S INNER JOIN Participant AS P
		ON P.ParticipantID = S.ParticipantID_s
	GROUP BY P.ParticipantID
		ORDER BY Volume DESC -- COUNT(P.id = S.participant_id_s) DESC
LIMIT 1;

-- check which event has most volume sales (60)
SELECT EV.EventID, EV.EventName, SUM(S.TotalQuantity) AS quant
	FROM EventCal AS EV 
		INNER JOIN Sale AS S
			ON S.DateOfSale BETWEEN EV.EventStart AND EV.EventFin 
		GROUP BY EV.EventID, EV.EventName
			ORDER BY quant DESC
LIMIT 1;

-- check event with highest rate participation (61)
SELECT EV.EventID, EV.name, SUM(SP.Quantity) / EV.Capacity * 100 AS rate
	FROM EventCal as EV INNER JOIN SaleProduct as SP
		INNER JOIN Product AS P
			ON P.ProductID = SP.ProductID_sp and P.ProductName = EV.EventName
		GROUP BY EV.EventID, EV.EventName
			ORDER BY rate DESC
		LIMIT 1

-- check events in a given timespan (71)
DELIMITER &&
CREATE PROCEDURE EventsInTimespan(IN firstday DATETIME, IN lastday DATETIME)
 BEGIN
	SELECT EventID, EventName 
		FROM EventCal AS EV
			WHERE (EV.EventStart BETWEEN firstday AND lastday) AND (EV.EventEnd BETWEEN firstday AND lastday);
 END
 &&

-- check who sold the most tickets in Event (72)
DELIMITER &&
CREATE PROCEDURE GetSoldMostInEv (id INTEGER)
	BEGIN
		SELECT E.EmployeeID AS EmployeeID, E.EmployeeName AS EmployeeName
			FROM EventCal AS EV 
            INNER JOIN EventEmployee AS EE
				ON id = EV.EventID = EE.EventID_ee 
			INNER JOIN Employee AS E
				ON EE.EmployeeID_ee = E.EmployeeID
			INNER JOIN Sale AS S
				ON E.EventID = S.EmployeeID_s
			GROUP BY EmployeeID, EmployeeName
				ORDER BY SUM(S.Quantity)
			LIMIT 1;
	END
&&

-- events someone participated in (81)
DELIMITER &&
CREATE PROCEDURE check_events_participated(IN idP INTEGER)
BEGIN
	SELECT EV.EventID, EV.EventName
		FROM EventCal AS EV
        INNER JOIN Sale as S
			ON S.DateOfSale BETWEEN EV.EventStart AND EV.EventFin
		INNER JOIN SaleProduct as SP
			ON S.ReceiptNO = SP.ReceiptNO_sp
		INNER JOIN Product as PR
			ON SP.ProductID_sp = PR.ProductID AND PR.ProductName = EV.EventName
		INNER JOIN Participant as P
			ON S.ParticipantID_s = P.ParticipantID
		WHERE P.ParticipantID = idP;
END
&&

-- check the participant with the highest value in sales (93)
SELECT P.id, P.name, SUM(S.Val) AS totVal
	FROM sale AS S INNER JOIN participant AS P
			ON P.id = S.participant_id_s
	GROUP BY P.id, P.name
		ORDER BY totVal DESC;
LIMIT 1;

-- check the event with the most value in sales (94)
SELECT E.EmployeeID, E.name, SUM(S.Val) AS totVal
	FROM EventCal AS E INNER JOIN sale as S
		ON S.DateOfSale BETWEEN EV.EventStart AND EV.EventFin
	GROUP BY E.EmployeeID, E.name
		ORDER BY totVal DESC
LIMIT 1;

-- check on Employee sales (98)
DELIMITER &&
CREATE PROCEDURE check_Employee_sales (IN id VARCHAR(10))
 BEGIN 
    SELECT S.id
        FROM sale
			WHERE Employee_id_s = id;
END &&
