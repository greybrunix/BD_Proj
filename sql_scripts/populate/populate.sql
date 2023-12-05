LOAD DATA LOCAL INFILE 'events.csv' INTO TABLE event
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'employees.csv' INTO TABLE employee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'employees_phone.csv' INTO TABLE employee_phone
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'employee_email.csv' INTO TABLE employee_email
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'event_employee.csv' INTO TABLE event_employee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'participant.csv' INTO TABLE participant
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'participant_email.csv' INTO TABLE participant_email
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'participant_phone.csv' INTO TABLE participant_phone
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'sale.csv' INTO TABLE sale
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'product.csv' INTO TABLE product
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'sale_product.csv' INTO TABLE sale_product
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'supplier.csv' INTO TABLE supplier
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'product_supplier_past.csv' INTO TABLE product_supplier_past
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES


LOAD DATA LOCAL INFILE 'product_supplier_future.csv' INTO TABLE product_supplier_future
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES