USE mademoiselle_borges;

SELECT * FROM supplier;
SELECT * FROM supplier_phone;
SELECT * FROM supplier_email;

DROP TABLE product_supplier_future;
DROP TABLE product_supplier_past;
DROP TABLE supplier_phone;
DROP TABLE supplier_email;
DROP TABLE supplier;

SELECT * FROM product;


SELECT * FROM sale;
ALTER TABLE sale AUTO_INCREMENT = 0;
DELETE FROM sale;

SELECT * FROM event;
DELETE FROM event;
DROP TABLE event;
ALTER TABLE event AUTO_INCREMENT = 0;
SELECT * FROM event;


DROP TABLE event_employee;

DELETE FROM sale_product;

DELETE FROM sale_product;

SELECT * FROM employee;





