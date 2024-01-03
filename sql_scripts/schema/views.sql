-- (65)
CREATE VIEW total_event_sale_value AS
	SELECT EV.EventID AS EventID, SUM(S.TotalValue) AS TotalValue
		FROM EventCal AS EV INNER JOIN Sale AS S
			ON S.DateOfSale BETWEEN EV.EventStart AND EV.EventEnd
	GROUP BY EV.EventID;

CREATE VIEW employee_sales AS
	SELECT E.EmployeeID AS EmployeeID, E.EmployeeName AS EmployeeName, SUM(S.TotalValue) AS TotalValue
		FROM Employee AS E INNER JOIN Sale AS S
			ON E.EmployeeID = S.EmployeeID_s
	GROUP BY E.EmployeeID;