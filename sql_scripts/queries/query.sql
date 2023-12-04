-- Consultar qual funcionário gere qual
DELIMITER &&
CREATE PROCEDURE GetFuncGere (IN employee_id_e VARCHAR(10))
 BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
		FROM employee AS E
			WHERE E.employee_id_e = employee_id_e;
END &&

-- Consultar as vendas efetuadas por um funcionário
DELIMITER &&
CREATE PROCEDURE GetVendasFunc (IN employee_id_e VARCHAR(10))
 BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
		FROM employee AS E INNER JOIN sale as S
			ON E.employee_id_e = S.employee_id_s
		WHERE E.employee_id_e = employee_id_e;
END &&

-- Consultar todas as vendas efetuadas
DELIMITER &&
CREATE PROCEDURE GetVendas ()
 BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQL EXCEPTION ENCOUNTERED' Message;
    SELECT *
		FROM sale;
END &&

