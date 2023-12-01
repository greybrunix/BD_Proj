--DROP SCHEMA IF EXISTS mademoiselle_borges;
CREATE SCHEMA IF NOT EXISTS mademoiselle_borges;

USE mademoiselle_borges;

CREATE TABLE event (
	id INTEGER AUTO_INCREMENT,
	descr TEXT NOT NULL,
	beg DATETIME NOT NULL,
	fin   DATETIME NOT NULL,
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
	employee_id_phone VARCHAR(10) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	FOREIGN KEY (employee_id_employee_phone) REFERENCES employee (id)
);
CREATE TABLE employee_email (
	employee_id VARCHAR(10) NOT NULL,
	email VARCHAR(75) NOT NULL,
	FOREIGN KEY (employee_id_employee_email) REFERENCES employee (id)
);

CREATE TABLE event_employee (
	event_id_event_employee INTEGER,
	employee_id_event_employee INTEGER,
	PRIMARY KEY (event_id_event_employee, employee_id_event_employee),
	FOREIGN KEY (event_id_event_employee) REFERENCES event (id),
	FOREIGN KEY (employee_id_event_employee) REFERENCES employee (id)
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
	participant_id_participant_email INTEGER NOT NULL,
	email VARCHAR(75) NULL,
	FOREIGN KEY (participant_id_participant_email) REFERENCES participant (id)
);

CREATE TABLE participant_phone (
	participant_id_participant_phone INTEGER NOT NULL,
	phone VARCHAR(20) NOT NULL,
	FOREIGN KEY (participant_id_participant_phone) REFERENCES participant (id)
);

CREATE TABLE sale (
	id INTEGER AUTO_INCREMENT,
	val DECIMAL(5,2) NOT NULL,
	quantity INTEGER NOT NULL,
	dos DATETIME NOT NULL,
	employee_id_sale VARCHAR(10) NOT NULL,
	participant_id_sale INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (employee_id_sale) REFERENCES employee (id),
	FOREIGN KEY (participant_id_sale) REFERENCES participant (id)
);

CREATE TABLE product (
	id INTEGER AUTO_INCREMENT,
	name VARCHAR(75) NOT NULL,
	descr TEXT NOT NULL,
	price DECIMAL(5,2) NOT NULL,
	stock INTEGER NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE sale_product (
	sale_id_sale_product INTEGER NOT NULL,
	product_id_sale_product INTEGER NOT NULL,
	val DECIMAL(5,2) NOT NULL,
	quantity INTEGER NOT NULL,
	PRIMARY KEY (sale_id_sale_product, product_id_sale_product),
	FOREIGN KEY (sale_id_sale_product) REFERENCES sale (id),
	FOREIGN KEY (product_id_sale_product) REFERENCES product (id)
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
	product_id_product_supplier_past INTEGER NOT NULL,
	supplier_id_product_supplier_past INTEGER NOT NULL,
	dod DATE NOT NULL,
	quantity INTEGER NOT NULL
	PRIMARY KEY (product_id_product_supplier_past, supplier_id_product_supplier_past, dod),
	FOREIGN KEY (product_id_product_supplier_past) REFERENCES product (id),
	FOREIGN KEY (supplier_id_product_supplier_past) REFERENCES supplier (id)
);

CREATE TABLE product_supplier_future (
	product_id_product_supplier_future INTEGER NOT NULL,
	supplier_id_product_supplier_future INTEGER NOT NULL,
	dod DATE NOT NULL,
	quantity INTEGER NOT NULL
	PRIMARY KEY (product_id_product_supplier_future, supplier_id_product_supplier_future, dod),
	FOREIGN KEY (product_id_product_supplier_future) REFERENCES product (id),
	FOREIGN KEY (supplier_id_product_supplier_future) REFERENCES supplier (id)
);
