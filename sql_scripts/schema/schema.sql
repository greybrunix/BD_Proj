--DROP SCHEMA IF EXISTS mademoiselle_borges;
CREATE SCHEMA IF NOT EXISTS mademoiselle_borges;

USE mademoiselle_borges;

CREATE TABLE event (
	id INTEGER AUTO_INCREMENT,
	desc TEXT NOT NULL,
	begin DATETIME NOT NULL,
	end   DATETIME NOT NULL,
	capacity INTEGER NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE employee (
	id VARCHAR(10),
	name VARCHAR(75) NOT NULL,
	vat VARCHAR(9) NOT NULL,
	birth DATE NOT NULL,
	street VARCHAR(50) NOT NULL,
	locale VARCHAR(30) NOT NULL,
	postal VARCHAR(15) NOT NULL,
	employee_id VARCHAR(10),
	PRIMARY KEY (id),
	FOREIGN KEY (employee_id) REFERENCES employee (id)
);

CREATE TABLE employee_phone (
	employee_id VARCHAR(10) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employee (id)
);
CREATE TABLE employee_email (
	employee_id VARCHAR(10) NOT NULL,
	email VARCHAR(75) NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employee (id)
);

CREATE TABLE event_employee (
	event_id INTEGER,
	employee_id INTEGER,
	PRIMARY KEY (event_id, employee_id),
	FOREIGN KEY (event_id) REFERENCES event (id),
	FOREIGN KEY (employee_id) REFERENCES employee (id)
);

CREATE TABLE participant (
	id INTEGER AUTO INCREMENT,
	name VARCHAR(75) NOT NULL,
	vat VARCHAR(9) NULL,
	birth DATE NOT NULL,
	street VARCHAR(50) NULL,
	locale VARCHAR(30) NULL,
	postal VARCHAR(15) NULL,
	PRIMARY KEY (id)
);

CREATE TABLE participant_email (
	participant_id INTEGER NOT NULL,
	email VARCHAR(75) NULL,
	FOREIGN KEY (participant_id) REFERENCES participant (id)
);

CREATE TABLE participant_phone (
	participant_id INTEGER NOT NULL,
	phone VARCHAR(20) NOT NULL,
	FOREIGN KEY (participant_id) REFERENCES participant (id)
);

CREATE TABLE sale (
	id INTEGER AUTO_INCREMENT,
	value DECIMAL(5,2) NOT NULL,
	quantity INTEGER NOT NULL,
	date DATETIME NOT NULL,
	employee_id VARCHAR(10) NOT NULL,
	participant_id INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (employee_id) REFERENCES employee (id),
	FOREIGN KEY (participant_id) REFERENCES participant (id)
);

CREATE TABLE product (
	id INTEGER AUTO_INCREMENT,
	name VARCHAR(75) NOT NULL,
	desc TEXT NOT NULL,
	price DECIMAL(5,2) NOT NULL,
	stock INTEGER NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE sale_product (
	sale_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	value DECIMAL(5,2) NOT NULL,
	quantity INTEGER NOT NULL,
	PRIMARY KEY (sale_id, product_id),
	FOREIGN KEY (sale_id) REFERENCES sale (id),
	FOREIGN KEY (product_id) REFERENCES product (id)
);

CREATE TABLE supplier (
	id INTEGER AUTO_INCREMENT,
	name VARCHAR(75) NOT NULL,
	iban VARCHAR(50) NOT NULL,
	contact VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	locale VARCHAR(30) NOT NULL,
	postal VARCHAR(15) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE product_supplier_past (
	product_id INTEGER NOT NULL,
	supplier_id INTEGER NOT NULL,
	date DATE NOT NULL,
	quantity INTEGER NOT NULL
	PRIMARY KEY (product_id, supplier_id, date),
	FOREIGN KEY (product_id) REFERENCES product (id),
	FOREIGN KEY (supplier_id) REFERENCES supplier (id)
);

CREATE TABLE product_supplier_future (
	product_id INTEGER NOT NULL,
	supplier_id INTEGER NOT NULL,
	date DATE NOT NULL,
	quantity INTEGER NOT NULL
	PRIMARY KEY (product_id, supplier_id, date),
	FOREIGN KEY (product_id) REFERENCES product (id),
	FOREIGN KEY (supplier_id) REFERENCES supplier (id)
);
