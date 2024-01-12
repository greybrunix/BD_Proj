USE mademoiselle_borges;

CREATE USER hen;
CREATE USER mii;
CREATE USER hom;

CREATE USER employee;

CREATE USER guest;


GRANT DENY ALL ON * TO guest;
GRANT SELECT ON EventCal TO guest;
GRANT ALL ON * TO hen;
