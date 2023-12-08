DROP SCHEMA IF EXISTS mademoiselle_borges;
CREATE SCHEMA IF NOT EXISTS mademoiselle_borges;

USE mademoiselle_borges;

CREATE TABLE event (
        id INTEGER AUTO_INCREMENT,
        name VARCHAR(75) NOT NULL UNIQUE,
        descr TEXT NOT NULL,
        beg DATETIME NOT NULL,
        fin   DATETIME NOT NULL,
        capacity INTEGER NOT NULL,
        is_del   BOOLEAN DEFAULT FALSE,
        PRIMARY KEY (id)
);

CREATE TABLE employee (
        id VARCHAR(10),
        name VARCHAR(75) NOT NULL,
        vat VARCHAR(9) NOT NULL UNIQUE,
        birth DATE NOT NULL,
        street VARCHAR(50) NULL,
        locale VARCHAR(30) NULL,
        postal VARCHAR(15) NULL,
        employee_id_e VARCHAR(10),
        is_del   BOOLEAN DEFAULT FALSE,
        PRIMARY KEY (id),
        FOREIGN KEY (employee_id_e)
            REFERENCES employee (id)
);

CREATE TABLE employee_phone (
        employee_id_ep VARCHAR(10) NOT NULL,
        phone VARCHAR(20) NOT NULL UNIQUE,
        FOREIGN KEY (employee_id_ep)
            REFERENCES employee (id)
);
CREATE TABLE employee_email (
        employee_id_eem VARCHAR(10) NOT NULL,
        email VARCHAR(75) NOT NULL UNIQUE,
        is_del  BOOLEAN DEFAULT FALSE,
        FOREIGN KEY (employee_id_eem)
            REFERENCES employee (id)
);

CREATE TABLE event_employee (
        event_id_ee INTEGER,
        employee_id_ee VARCHAR(10),
        is_del BOOLEAN DEFAULT FALSE,
        CONSTRAINT comp_key PRIMARY KEY (event_id_ee , employee_id_ee),
        FOREIGN KEY (event_id_ee)
            REFERENCES event (id),
        FOREIGN KEY (employee_id_ee)
            REFERENCES employee (id)
);

CREATE TABLE participant (
        id INTEGER AUTO_INCREMENT,
        name VARCHAR(75) NOT NULL,
        vat VARCHAR(9) NULL UNIQUE,
        birth DATE NOT NULL,
        street VARCHAR(50) NULL,
        locale VARCHAR(30) NULL,
        postal VARCHAR(15) NULL,
        is_del BOOLEAN DEFAULT FALSE,
        PRIMARY KEY (id)
);

CREATE TABLE participant_email (
        participant_id_pem INTEGER NOT NULL,
        email VARCHAR(75) NULL UNIQUE,
        is_del BOOLEAN DEFAULT FALSE,
        FOREIGN KEY (participant_id_pem)
            REFERENCES participant (id)
);

CREATE TABLE participant_phone (
        participant_id_pp INTEGER NOT NULL,
        phone VARCHAR(20) NOT NULL UNIQUE,
        is_del BOOLEAN DEFAULT FALSE,
        FOREIGN KEY (participant_id_pp)
            REFERENCES participant (id)
);

CREATE TABLE sale (
        id INTEGER AUTO_INCREMENT,
        val DECIMAL(5,2) NOT NULL,
        quantity INTEGER NOT NULL,
        dos DATETIME NOT NULL,
        employee_id_s VARCHAR(10) NOT NULL,
        participant_id_s INTEGER NOT NULL,
        is_del BOOLEAN DEFAULT FALSE,
        PRIMARY KEY (id),
        FOREIGN KEY (employee_id_s)
            REFERENCES employee (id),
        FOREIGN KEY (participant_id_s)
            REFERENCES participant (id)
);

CREATE TABLE product (
        id INTEGER AUTO_INCREMENT,
        name VARCHAR(75) NOT NULL UNIQUE,
        descr TEXT NOT NULL,
        price DECIMAL(5,2) NOT NULL,
        stock INTEGER NOT NULL,
        is_del BOOLEAN DEFAULT FALSE,
        PRIMARY KEY (id)
);

CREATE TABLE sale_product (
        sale_id_sp INTEGER NOT NULL,
        product_id_sp INTEGER NOT NULL,
        val DECIMAL(5,2) NOT NULL,
        quantity INTEGER NOT NULL,
        is_del BOOLEAN DEFAULT FALSE,
        CONSTRAINT comp_key PRIMARY KEY (sale_id_sp, product_id_sp),
        FOREIGN KEY (sale_id_sp)
            REFERENCES sale (id),
        FOREIGN KEY (product_id_sp) REFERENCES product (id)
);

CREATE TABLE supplier (
        id INTEGER AUTO_INCREMENT,
        name VARCHAR(75) NOT NULL UNIQUE,
        iban VARCHAR(50) NOT NULL UNIQUE,
        street VARCHAR(50) NOT NULL,
        locale VARCHAR(30) NOT NULL,
        postal VARCHAR(15) NOT NULL,
        is_del BOOLEAN DEFAULT FALSE,
        PRIMARY KEY (id)
);

CREATE TABLE product_supplier_past (
        product_id_psp INTEGER NOT NULL,
        supplier_id_psp INTEGER NOT NULL,
        dod DATE NOT NULL, -- date of delivery
        quantity INTEGER NOT NULL,
        is_del BOOLEAN DEFAULT FALSE,
        CONSTRAINT comp_key PRIMARY KEY (product_id_psp, supplier_id_psp, dod),
        FOREIGN KEY (product_id_psp)
            REFERENCES product (id),
        FOREIGN KEY (supplier_id_psp)
            REFERENCES supplier (id)
);

CREATE TABLE product_supplier_future (
        product_id_psf INTEGER NOT NULL,
        supplier_id_psf INTEGER NOT NULL,
        dor DATE NOT NULL, -- date of reservation
        quantity INTEGER NOT NULL,
        is_del BOOLEAN DEFAULT FALSE,
        CONSTRAINT comp_key PRIMARY KEY (product_id_psf, supplier_id_psf, dor),
        FOREIGN KEY (product_id_psf)
            REFERENCES product (id),
        FOREIGN KEY (supplier_id_psf)
            REFERENCES supplier (id)
);

CREATE TABLE supplier_email (
        supplier_id_sem INTEGER NOT NULL,
        email VARCHAR(75) NOT NULL UNIQUE,
        is_del BOOLEAN DEFAULT FALSE,
        FOREIGN KEY (supplier_id_sem)
            REFERENCES supplier (id)    
);

CREATE TABLE supplier_phone (
        supplier_id_sp INTEGER NOT NULL,
        phone VARCHAR(20) NOT NULL UNIQUE,
        is_del BOOLEAN DEFAULT FALSE,
        FOREIGN KEY (supplier_id_sp)
            REFERENCES supplier (id)    
);
