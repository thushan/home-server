# Initialise new database and setup a new user

CREATE USER 'test_user'@'%' identified BY 'super-secret-password';

CREATE DATABASE test_db;
GRANT ALL privileges ON test_db.* TO 'test_user'@'%';
FLUSH PRIVILEGES;
