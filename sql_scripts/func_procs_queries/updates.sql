-- USE mademoiselle_borges;


DELIMITER &&
CREATE PROCEDURE InsertSales (IN part INTEGER,
       	totVal DECIMAL(5,2),
	quanti INTEGER,
       	saleDat DATETIME,
	employ VARCHAR(10))
  BEGIN 
  INSERT INTO sale(val, quantity, dos, employee_id_s, participant_id_s)
	VALUES (totVal, quanti, saleDat, employ, part);
END &&

DELIMITER &&
CREATE PROCEDURE Employ (IN i VARCHAR(10),n VARCHAR(75),
       	vat VARCHAR(9),
	b   DATE,
       	s   VARCHAR(50),
       	l   VARCHAR(30),
       	p   VARCHAR(15),
       	e   VARCHAR(10))
  BEGIN
	INSERT INTO employee (id, name, vat, birth, street, locale, postal, employee_id_e)
	VALUES (i, n,vat,b,s,l,p,e);
END &&
