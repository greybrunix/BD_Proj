CREATE USER 'hen'@'localhost';
CREATE USER 'mii'@'localhost';
CREATE USER 'hom'@'localhost';
CREATE USER 'employee'@'localhost';
CREATE USER 'marketing'@'localhost';
CREATE USER 'guest'@'localhost';

GRANT  ALL PRIVILEGES ON mademoiselle_borges.* TO 'hen'@'localhost';
GRANT  GRANT OPTION ON mademoiselle_borges.* TO 'hen'@'localhost';
GRANT ALL PRIVILEGES ON mademoiselle_borges.* TO 'mii'@'localhost';
GRANT  GRANT OPTION ON mademoiselle_borges.* TO 'mii'@'localhost';
GRANT ALL PRIVILEGES  ON mademoiselle_borges.* TO 'hom'@'localhost';
GRANT GRANT OPTION ON mademoiselle_borges.* TO 'hom'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'guest'@'localhost';
GRANT SELECT ON mademoiselle_borges.Product TO 'guest'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.EventCal TO 'employee'@'localhost';
GRANT SELECT ON mademoiselle_borges.SaleNoValue TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Sale TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Participant TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.ParticipantPhone TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.ParticipantEmail TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.SaleProduct TO 'employee'@'localhost';
GRANT SELECT ON mademoiselle_borges.Product TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Product TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.ProductSupplierPast TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Supplier TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.SupplierEmail TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.SupplierPhone TO 'employee'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'marketing'@'localhost';
GRANT INSERT ON mademoiselle_borges.EventCal TO 'marketing'@'localhost';

DELIMITER &&
CREATE PROCEDURE grantRevokePermissions()
BEGIN
    IF (CURTIME() BETWEEN '07:00:00' AND '23:59:59') OR (CURTIME() BETWEEN '00:00:00' AND '02:00:00') THEN
        GRANT USAGE ON mademoiselle_borges.* TO 'guest'@'localhost';
        GRANT USAGE ON mademoiselle_borges.* TO 'marketing'@'localhost';
        GRANT USAGE ON mademoiselle_borges.* TO 'employee'@'localhost';
        GRANT USAGE ON mademoiselle_borges.* TO 'hom'@'localhost';
        GRANT USAGE ON mademoiselle_borges.* TO 'mii'@'localhost';
        GRANT USAGE ON mademoiselle_borges.* TO 'hen'@'localhost';
    ELSE 
        REVOKE USAGE ON mademoiselle_borges.* FROM 'guest'@'localhost';
        REVOKE USAGE ON mademoiselle_borges.* FROM 'marketing'@'localhost';
        REVOKE USAGE ON mademoiselle_borges.* FROM 'employee'@'localhost';
END &&

SHOW GRANTS FOR 'guest'@'localhost';
FLUSH PRIVILEGES;
