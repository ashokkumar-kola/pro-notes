
-- MYSQL

-- Turn off autocommit for the session
SET autocommit = 0; -- 1 - Restore autocommit

-- Disable Safe Mode
SET SQL_SAFE_UPDATES = 0; -- 1 - ON
 

-- Foreign Key Constraints
SET FOREIGN_KEY_CHECKS = 0;





-- DATABASES

SHOW databases;

USE information_shema;
USE performance_schema;

USE sys;
USE mysql;

USE test;
USE demo;

USE company_db;
USE employees;

SELECT DATABASE();


-- SHOW TABLES
 
SHOW tables;

SHOW TABLES FROM employees;

SELECT * FROM employees;

-- DROP TABLES
DROP TABLE employees; 