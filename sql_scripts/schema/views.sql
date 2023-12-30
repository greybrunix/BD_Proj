-- (65)
CREATE VIEW total_event_sale_value AS
	SELECT EV.id AS event_id, SUM(S.val) AS total_value
		FROM event AS EV INNER JOIN sale AS S
			ON S.dos BETWEEN EV.beg AND EV.fin
	GROUP BY EV.id;

-- (78)
CREATE VIEW past_events AS
	SELECT * FROM event AS EV
		WHERE EV.fin < CURDATE();

-- (79)
CREATE VIEW ongoing_events AS
	SELECT * FROM event AS EV
		WHERE CURDATE() BETWEEN EV.beg AND EV.fin;
       
-- (80)
CREATE VIEW future_events AS
	SELECT * FROM event AS EV
		WHERE CURDATE() < EV.beg;
        
-- (89)
CREATE VIEW total_sale_value AS
	SELECT SUM(S.val) AS total_value
		FROM sale AS S;