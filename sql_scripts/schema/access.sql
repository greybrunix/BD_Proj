USE mademoiselle_borges;

CREATE USER 'hen'@'localhost';
CREATE USER 'mii'@'localhost';
CREATE USER 'hom'@'localhost';
CREATE USER 'employee'@'localhost';
CREATE USER 'marketing'@'localhost';
CREATE USER 'guest'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'guest'@'localhost';
GRANT  ALL PRIVILEGES ON mademoiselle_borges.* TO 'hen'@'localhost';
GRANT  GRANT OPTION ON mademoiselle_borges.* TO 'hen'@'localhost';
GRANT ALL PRIVILEGES ON mademoiselle_borges.* TO 'mii'@'localhost';
GRANT  GRANT OPTION ON mademoiselle_borges.* TO 'mii'@'localhost';
GRANT ALL PRIVILEGES  ON mademoiselle_borges.* TO 'hom'@'localhost';
GRANT GRANT OPTION ON mademoiselle_borges.* TO 'hom'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.EventCal TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Sale TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Participant TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.ParticipantPhone TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.ParticipantEmail TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.SaleProduct TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Product TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.ProductSupplierPast TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Supplier TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.SupplierEmail TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.SupplierPhone TO 'employee'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'marketing'@'localhost';
GRANT INSERT ON mademoiselle_borges.EventCal TO 'marketing'@'localhost';

SHOW GRANTS FOR 'guest'@'localhost';
FLUSH PRIVILEGES;
