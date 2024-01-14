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
    
-- DROP VIEW IF EXISTS manager_employees;
CREATE VIEW manager_employees AS
    SELECT E.EmployeeID AS ManagerEmployeeID,
		   GROUP_CONCAT(Ei.EmployeeID) AS ManagedEmployeeIDs
    FROM Employee AS E LEFT OUTER JOIN Employee AS Ei
    ON Ei.EmployeeID_e = E.EmployeeID
    WHERE Ei.EmployeeID IS NOT NULL
    GROUP BY E.EmployeeID;
-- SELECT * FROM manager_employees;

CREATE VIEW event_volume AS
	SELECT EC.EventID AS EventID, SUM(S.TotalQuantity) AS TotalQuantity
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
                
-- view para tabelas com tabelas dependentes
CREATE VIEW employee_full AS
	SELECT E.*, GROUP_CONCAT(Email.Email, Phone.Phone) AS Contacts
    FROM Employee AS E LEFT OUTER JOIN EmployeeEmail AS Email
		ON E.EmployeeID = Email.EmployeeID_eem
        LEFT OUTER JOIN EmployeePhone AS Phone
        ON E.EmployeeID = Phone.EmployeeID_ep
        GROUP BY E.EmployeeID;
        
CREATE VIEW ParticipantFull AS
	SELECT P.*, GROUP_CONCAT(Email.Email, Phone.Phone) AS Contacts
		FROM Participant AS P LEFT OUTER JOIN ParticipantPhone AS Phone
		ON P.ParticipantID = Phone.ParticipantID_pp
		LEFT OUTER JOIN ParticipantEmail AS Email
		ON P.ParticipantID = Email.ParticipantID_pem
		GROUP BY P.ParticipantID;

CREATE VIEW SupplierFull AS
	SELECT S.*, GROUP_CONCAT(Email.Email, Phone.Phone) AS Contacts
		FROM Supplier AS S LEFT OUTER JOIN SupplierEmail AS Email
		ON S.SupplierID = Email.SupplierID_sem
		LEFT OUTER JOIN SupplierPhone AS Phone
		ON S.SupplierID = Phone.SupplierID_sp
		GROUP BY S.SupplierID;

CREATE VIEW SaleNoValue AS
	SELECT S.ReceiptNO AS ReceiptNO, S.TotalQuantity AS TotalQuantity, S.DateOfSale AS DateOfSale, S.EmployeeID_s AS EmployeeID, S.ParticipantID_s AS ParticipantID
		FROM Sale AS S;
