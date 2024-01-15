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


-- check events in a given timespan (71)
DELIMITER &&
CREATE PROCEDURE EventsInTimespan(IN firstday DATETIME, IN lastday DATETIME)
 BEGIN
	SELECT EventID, EventName 
		FROM EventCal AS EV
			WHERE (EV.EventStart BETWEEN firstday AND lastday) AND (EV.EventEnd BETWEEN firstday AND lastday);
 END
 &&