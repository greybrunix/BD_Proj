-- Sales report + Affluence Report
CREATE EVENT EOD_sales_reports
	ON SCHEDULE
		EVERY 1 DAY
        STARTS '2023-12-05 02:00:00'
	DO SELECT SUM(S.TotalValue) AS Value, SUM(S.TotalQuantity) AS Volume
FROM Sale AS S
WHERE YEAR(S.DateOfSale) = YEAR(dos) AND MONTH(S.DateOfSale) = MONTH(dos) 
AND DAY(S.DateOfSale) = DAY(dos)
				INTO OUTFILE 'daily_sale_report.csv'
				FIELDS TERMINATED BY ','
				ENCLOSED BY '"'
				LINES TERMINATED BY '\n';
