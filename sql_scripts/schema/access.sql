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

SHOW GRANTS FOR 'guest'@'localhost';
FLUSH PRIVILEGES;
