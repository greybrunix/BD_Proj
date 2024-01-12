USE mademoiselle_borges;

CREATE USER 'hen'@'localhost';
CREATE USER 'mii'@'localhost';
CREATE USER 'hom'@'localhost';

CREATE USER 'employee'@'localhost';
CREATE USER 'marketing'@'localhost';

CREATE USER 'guest'@'localhost';

DROP USER 'hen';
DROP USER 'mii';
DROP USER 'hom';
DROP USER 'employee';
DROP USER 'guest'@'localhost';

GRANT SELECT ON EventCal TO 'guest'@'localhost';
GRANT ALL ON * TO 'hen'@'localhost';
GRANT ALL ON * TO 'mii'@'localhost';
GRANT ALL ON * TO 'hom'@'localhost';



SHOW GRANTS;
FLUSH PRIVILEGES;
