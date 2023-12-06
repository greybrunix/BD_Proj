-- Calculate total value of a sale
CREATE FUNCTION TotValSale (IN id INTEGER)
  BEGIN 
	SELECT SUM(val * quantity)
		FROM sale_product
		WHERE sale_id_sp = id;
END
