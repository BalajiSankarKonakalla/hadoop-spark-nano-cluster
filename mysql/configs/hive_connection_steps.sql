CREATE DATABASE metastore;
USE metastore;
SOURCE /hive_schema.sql;
CREATE USER 'datadroits'@'%' IDENTIFIED BY 'datadroitsmysql';
GRANT ALL ON *.* to datadroits@'%' IDENTIFIED BY 'datadroitsmysql';
flush privileges;
