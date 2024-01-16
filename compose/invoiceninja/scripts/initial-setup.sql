CREATE USER 'invoiceninja'@'%' identified BY 'super-secret-password';
CREATE DATABASE invoiceninja;
GRANT ALL privileges ON invoiceninja.* TO 'invoiceninja'@'%';
FLUSH PRIVILEGES;
