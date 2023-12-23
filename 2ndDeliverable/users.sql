CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'supersecret';
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'supersecret';
GRANT ALL PRIVILEGES ON mydb.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER IF NOT EXISTS 'customer'@'%' IDENTIFIED BY 'customer_password';
GRANT SELECT ON mydb.store TO 'customer'@'%';
GRANT SELECT ON mydb.table TO 'customer'@'%';
GRANT SELECT ON mydb.menu TO 'customer'@'%';
GRANT SELECT ON mydb.menu_item TO 'customer'@'%';
GRANT SELECT ON mydb.notification TO 'customer'@'%';
GRANT SELECT, INSERT, UPDATE ON mydb.customer TO 'customer'@'%';
GRANT SELECT, INSERT, UPDATE ON mydb.favourite_list TO 'customer'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.reservation TO 'customer'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.evaluates TO 'customer'@'%';

CREATE USER IF NOT EXISTS 'store_manager'@'%' IDENTIFIED BY 'manager_password';
GRANT SELECT, INSERT, UPDATE ON mydb.store TO 'store_manager'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.table TO 'store_manager'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.menu TO 'store_manager'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.menu_item TO 'store_manager'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.waits TO 'store_manager'@'%';
GRANT SELECT ON mydb.notification TO 'store_manager'@'%';
GRANT SELECT ON mydb.customer TO 'store_manager'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.reservation TO 'store_manager'@'%';
GRANT SELECT ON mydb.evaluates TO 'store_manager'@'%';

FLUSH PRIVILEGES;
SELECT * FROM mysql.user;