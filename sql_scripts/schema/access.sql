CREATE USER IF NOT EXISTS 'hen'@'localhost';
CREATE USER IF NOT EXISTS 'mii'@'localhost';
CREATE USER IF NOT EXISTS 'hom'@'localhost';
CREATE USER IF NOT EXISTS 'employee'@'localhost';
CREATE USER IF NOT EXISTS 'marketing'@'localhost';
CREATE USER IF NOT EXISTS 'guest'@'localhost';

GRANT  ALL PRIVILEGES ON mademoiselle_borges.* TO 'hen'@'localhost';
GRANT  GRANT OPTION ON mademoiselle_borges.* TO 'hen'@'localhost';
GRANT ALL PRIVILEGES ON mademoiselle_borges.* TO 'mii'@'localhost';
GRANT  GRANT OPTION ON mademoiselle_borges.* TO 'mii'@'localhost';
GRANT ALL PRIVILEGES  ON mademoiselle_borges.* TO 'hom'@'localhost';
GRANT GRANT OPTION ON mademoiselle_borges.* TO 'hom'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'guest'@'localhost';
GRANT SELECT ON mademoiselle_borges.Product TO 'guest'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'employee'@'localhost';
GRANT SELECT ON mademoiselle_borges.SaleNoValue TO 'employee'@'localhost';
GRANT EXECUTE ON PROCEDURE register_sale TO 'employee'@'localhost';
GRANT INSERT ON mademoiselle_borges.Participant TO 'employee'@'localhost';
GRANT EXECUTE ON PROCEDURE add_prod_new_shop_new_part TO 'employee'@'localhost';
GRANT SELECT ON mademoiselle_borges.Product TO 'employee'@'localhost';
GRANT EXECUTE ON PROCEDURE register_reservation_new_product TO 'employee'@'localhost';
GRANT EXECUTE ON PROCEDURE register_reservation_exis_product TO 'employee'@'localhost';
GRANT EXECUTE ON PROCEDURE register_delivery_product TO 'employee'@'localhost';
GRANT EXECUTE ON PROCEDURE add_prod_to_new_shopping_cart TO 'employee'@'localhost';
GRANT EXECUTE ON PROCEDURE cancel_ongoing_sale TO 'employee'@'localhost';
# GRANT EXECUTE ON PROCEDURE register_new_supplier TO 'employee'@'localhost';

GRANT SELECT ON mademoiselle_borges.EventCal TO 'marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE register_new_event TO 'marketing'@'localhost';

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
	END IF;
END &&

SHOW GRANTS FOR 'guest'@'localhost';
FLUSH PRIVILEGES;