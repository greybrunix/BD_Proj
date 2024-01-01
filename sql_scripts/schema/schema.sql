DROP SCHEMA IF EXISTS mademoiselle_borges;
CREATE SCHEMA IF NOT EXISTS mademoiselle_borges;

USE mademoiselle_borges;

CREATE TABLE EventCal (
        EventID INTEGER AUTO_INCREMENT,
        EventName VARCHAR(75) NOT NULL UNIQUE,
        EventDescription TEXT NOT NULL,
        EventStart DATETIME NOT NULL,
        EventEnd   DATETIME NOT NULL,
        Capacity INTEGER NOT NULL,
        PRIMARY KEY (EventID)
);

CREATE TABLE Employee (
        EmployeeID VARCHAR(10),
        EmployeeName VARCHAR(75) NOT NULL,
        EmployeeVAT VARCHAR(9) NOT NULL UNIQUE,
        EmployeeBirthDate DATE NOT NULL,
        Street VARCHAR(50) NOT NULL,
        Locale VARCHAR(30) NOT NULL,
        PostalCode VARCHAR(15) NOT NULL,
        EmployeeID_e VARCHAR(10),
        PRIMARY KEY (EmployeeID),
        FOREIGN KEY (EmployeeID_e)
            REFERENCES Employee (EmployeeID)
);

CREATE TABLE EmployeePhone (
        EmployeeID_ep VARCHAR(10) NOT NULL,
        Phone VARCHAR(20) NOT NULL UNIQUE,
        FOREIGN KEY (EmployeeID_ep)
            REFERENCES Employee (EmployeeID)
);
CREATE TABLE EmployeeEmail (
        EmployeeID_eem VARCHAR(10) NOT NULL,
        Email VARCHAR(75) NOT NULL UNIQUE,
        FOREIGN KEY (EmployeeID_eem)
            REFERENCES Employee (EmployeeID)
);

CREATE TABLE EventEmployee(
        EventID_ee INTEGER,
        EmployeeID_ee VARCHAR(10),
        CONSTRAINT comp_key PRIMARY KEY (EventID_ee, EmployeeID_ee),
        FOREIGN KEY (EventID_ee)
            REFERENCES EventCal (EventID),
        FOREIGN KEY (EmployeeID_ee)
            REFERENCES Employee (EmployeeID)
);

CREATE TABLE Participant (
        ParticipantID INTEGER AUTO_INCREMENT,
        ParticipantName VARCHAR(75) NOT NULL,
        ParticipantVAT VARCHAR(9) NULL,
        ParticipantBirthDate DATE NOT NULL,
        Street VARCHAR(50) NULL,
        Locale VARCHAR(30) NULL,
        Postal VARCHAR(15) NULL,
        PRIMARY KEY (ParticipantID)
);

CREATE TABLE ParticipantEmail (
        ParticipantID_pem INTEGER NOT NULL,
        Email VARCHAR(75) NULL UNIQUE,
        FOREIGN KEY (ParticipantID_pem)
            REFERENCES Participant (ParticipantID)
);

CREATE TABLE ParticipantPhone (
        ParticipantID_pp INTEGER NOT NULL,
        Phone VARCHAR(20) NOT NULL UNIQUE,
        FOREIGN KEY (ParticipantID_pp)
            REFERENCES Participant (ParticipantID)
);

CREATE TABLE Sale (
        ReceiptNO INTEGER AUTO_INCREMENT,
        TotalValue DECIMAL(5,2) NOT NULL,
        TotalQuantity INTEGER NOT NULL,
        DateOfSale DATETIME NULL,
        EmployeeID_s VARCHAR(10) NOT NULL,
        ParticipantID_s INTEGER NOT NULL,
        PRIMARY KEY (ReceiptNO),
        FOREIGN KEY (EmployeeId_s)
            REFERENCES Employee (EmployeeID),
        FOREIGN KEY (ParticipantID_s)
            REFERENCES Participant (ParticipantID)
);

CREATE TABLE Product (
        ProductID INTEGER AUTO_INCREMENT,
        ProductName VARCHAR(75) NOT NULL UNIQUE,
        ProductDescription TEXT NOT NULL,
        BasePrice DECIMAL(5,2) NOT NULL,
        QuantityInStock INTEGER NOT NULL,
        PRIMARY KEY (ProductID)
);

CREATE TABLE SaleProduct (
        ReceiptNO_sp INTEGER NOT NULL,
        ProductID_sp INTEGER NOT NULL,
        CurrentValue DECIMAL(5,2) NOT NULL,
        Quantity INTEGER NOT NULL,
        CONSTRAINT comp_key PRIMARY KEY (ReceiptNO_sp, ProductID_sp),
        FOREIGN KEY (ReceiptNO_sp)
		REFERENCES Sale (ReceiptNO),
        FOREIGN KEY (ProductID_sp)
		REFERENCES Product (ProductID)
);

CREATE TABLE Supplier (
        SupplierID INTEGER AUTO_INCREMENT,
        SupplierName VARCHAR(75) NOT NULL UNIQUE,
        IBAN VARCHAR(50) NOT NULL UNIQUE,
        Street VARCHAR(50) NOT NULL,
        Locale VARCHAR(30) NOT NULL,
        Postal VARCHAR(15) NOT NULL,
        PRIMARY KEY (SupplierID)
);

CREATE TABLE ProductSupplierPast(
        ProductID_psp INTEGER NOT NULL,
        SupplierID_psp INTEGER NOT NULL,
        DateOfDelivery DATE NOT NULL, -- date of delivery
	Quantity INTEGER NOT NULL,
        CONSTRAINT comp_key PRIMARY KEY (ProductID_psp,
		SupplierID_psp,
		DateOfDelivery),
        FOREIGN KEY (ProductID_psp)
            REFERENCES Product (ProductID),
        FOREIGN KEY (SupplierID_psp)
            REFERENCES Supplier (SupplierID)
);

CREATE TABLE ProductSupplierFuture (
        ProductID_psf INTEGER NOT NULL,
        SupplierID_psf INTEGER NOT NULL,
        DateOfReservation DATE NOT NULL, -- date of reservation
	DateOfSchedule DATE NOT NULL, -- expected date
        Quantity INTEGER NOT NULL,
        CONSTRAINT comp_key PRIMARY KEY (ProductID_psf,
		SupplierID_psf,
		DateOfReservation,
		DateOfSchedule),
        FOREIGN KEY (ProductID_psf)
            REFERENCES Product (ProductID),
        FOREIGN KEY (SupplierID_psf)
            REFERENCES Supplier (SupplierID)
);

CREATE TABLE SupplierEmail (
        SupplierID_sem INTEGER NOT NULL,
        Email VARCHAR(75) NOT NULL UNIQUE,
        FOREIGN KEY (SupplierID_sem)
            REFERENCES Supplier (SupplierID)
);

CREATE TABLE SupplierPhone(
        SupplierID_sp INTEGER NOT NULL,
        Phone VARCHAR(20) NOT NULL UNIQUE,
        FOREIGN KEY (SupplierID_sp)
            REFERENCES Supplier (SupplierID)
);
