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
    
CREATE VIEW product_supplier AS
	SELECT P.ProductID AS ProductID, PSP.SupplierID_psp AS PastSupplierID, PSF.SupplierID_psf AS FutureSupplierID
		FROM Product AS P INNER JOIN ProductSupplierPast AS PSP 
			ON P.ProductID = PSP.ProductID_psp
		INNER JOIN ProductSupplierFuture AS PSF
			ON P.ProductID = PSF.ProductID_psf
	GROUP BY P.ProductID, PSP.SupplierID_psp, PSF.SupplierID_psf;
    
CREATE VIEW purchase_history AS
	SELECT P.ParticipantID AS ParticipantID, S.ReceiptNO AS ReceiptNO, S.DateOfSale AS PurchaseDate
		FROM Sale AS S INNER JOIN Participant AS P
			ON S.ParticipantID_s = P.ParticipantID
	GROUP BY P.ParticipantID, S.ReceiptNO;
    
CREATE VIEW manager_employee AS
	SELECT E.EmployeeID As EmployeeID, E.EmployeeID_e AS ManagerID
		FROM Employee AS E
	GROUP BY E.EmployeeID, E.EmployeeID_e;

CREATE VIEW event_volume AS
	SELECT EC.EventID AS EventID, SUM(S.TotalValue) AS TotalSales
		FROM EventCal As EC INNER JOIN Sale AS S
			ON S.DateOfSale BETWEEN EC.EventStart AND EC.EventEnd
	GROUP BY EC.EventID;
    
CREATE VIEW participant_sales AS
	SELECT P.ParticipantID AS ParticipantID, SUM(S.TotalValue) AS TotalSales
		FROM Participant AS P INNER JOIN Sale AS S
			On P.ParticipantID = S.ParticipantID_s
	GROUP BY P.ParticipantID;

CREATE VIEW failed_reservations AS
	SELECT PSP.ProductID_psp AS ProductID
		FROM ProductSupplierPast AS PSP INNER JOIN ProductSupplierFuture AS PSF
			ON PSF.ProductID_psf NOT IN (PSF.ProductID_psf)
				WHERE PSF.DateOfSchedule < CURDATE();