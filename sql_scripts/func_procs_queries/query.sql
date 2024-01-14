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

-- check all suppliers (54)
SELECT SupplierID, SupplierName
 FROM Supplier;

-- check all Employees (55)
SELECT EmployeeID, EmployeeName
	FROM Employee;

-- check all events (56)
SELECT EventID, EventName
	FROM EventCal;

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

-- check the participant with the highest value in sales (93)
SELECT P.ParticipantID, P.ParticipantName, SUM(S.TotalValue) AS totVal
	FROM Sale AS S INNER JOIN Participant AS P
			ON P.ParticipantID = S.ParticipantID_s
	GROUP BY P.ParticipantID, P.ParticipantName
		ORDER BY totVal DESC
LIMIT 1;

-- check the event with the most value in sales (94)
SELECT EV.EventID, EV.EventName, SUM(S.TotalValue) AS totVal
	FROM EventCal AS EV INNER JOIN Sale as S
		ON S.DateOfSale BETWEEN EV.EventStart AND EV.EventEnd
	GROUP BY EV.EventID, EV.EventName
		ORDER BY totVal DESC
LIMIT 1;