-- ========================================================
-- ######################## RDBMS #########################
-- ========================================================

-- FATHER OF DBMS
    -- EF CODD


-- SQL is Domain specific language - RDBMS
-- SQL is declarative language - What to do  /  Procedural - What to do and How to do


-- WHAT?
    -- RDBMS is a software that manages data stored in tables (rows n columns), 
    -- where data in different tables is related in using keys


-- DBMS VS RDBMS
    -- Files / Related Tables
    -- No Rules for Relations / Strcit Rules (Primary n Foreign keys)
    -- Less Secure / More Secure
    -- Single user / Multi User


-- DBMS ARCHITECTURE
    -- 1-Tier Architecture
    -- 2-Tier Architecture
    -- 3-Tier Architecture



-- TYPES of RDBMS
    -- MySql            - Open source, Oracle
    -- PostgreSQL       - Open source
    -- SQLite           - Lightweight, Embedded DB
    -- SQL Server       - Microsoft, MS SQL   
    -- Oracle Database  - Paid, Oracle, Enterprice Level
    

-- RDBMS TERMS
    -- Table - Collection of data
    -- Row - Single record - tuple
    -- Column - Attribute - feature
    -- Primary Key - Unique n Not Null
    -- Foreign Key - Referential Integrity
    -- Candidate Key - Next Primary key


-- NORMALIZATION - data redundancy and improve data integrity - insert, delete, and update anamolies
    -- 1NF
        -- All cells contain atomic (indivisible) values
        -- A table must have PRIMARY KEY
        -- All columns store values of single type

        -- Eg: Student_ID  Name  Subjects
        -- INSERT ANOMALY: 
            -- 100 subjects, No subject
        -- UPDATE ANOMALY:
            -- Change subject, add subject
        -- DELETE ANOMALY:
            -- Remove subject


    -- 2NF
        -- 1NF + No Partial Dependency
        --  All non-key attributes must depend on the whole primary key, not just a part of it. (Applies to composite keys).

        -- Eg: Student_ID  Course_ID  Student_Name  Course_Name
        -- INSERT ANOMALY: 
            -- New student need courses also
        -- UPDATE ANOMALY:
            -- Change in name should update every row
        -- DELETE ANOMALY:
            -- Remove all courses


    -- 3NF
        -- 2NF + No Transitive Dependency - non-trivial function dependency X –> Y.
        -- Non-key columns must only depend on the primary key, not on other non-key attributes. 

        -- Eg: Emp_ID  Emp_Name  Dept_ID  Dept_Name  Dept_Location
        -- INSERT ANOMALY: 
            -- Can't add new dept without emp
        -- UPDATE ANOMALY:
            -- Must update all emp location of HR for change in dept_location
        -- DELETE ANOMALY:
            -- If all HR leaves, you lose dept data too.



    -- BCNF - Boyce-Codd Normal Form
        -- 3NF + functional dependency (FD) X−>Y 
        -- Every determinant in the relation must be a candidate key.
        -- A determinant is any attribute or set of attributes that can uniquely identify another attribute

        -- Determinant: An attribute (or set of attributes) that uniquely identifies another attribute.
        -- Candidate Key: A minimal set of attributes that can uniquely identify a tuple (row) in a relation.
        -- Update Anomaly, Insertion Anomaly, Deletion Anomaly

        -- Eg: COURSE : Course_ID	Professor	Department
        -- INSERT ANOMALY: 
            -- 
        -- UPDATE ANOMALY:
            -- 
        -- DELETE ANOMALY:
            -- 


    -- 4NF
        -- 3NF + No multi-valued dependency ( A ->-> B)
        -- It has no multi-valued dependencies (MVDs) other than those that arise from a candidate key

        -- Eg: STUDENT_COURSE_HOBBY : Student_ID  Course  Hobby
        -- INSERT ANOMALY: 
            -- 
        -- UPDATE ANOMALY:
            -- 
        -- DELETE ANOMALY:
            -- 


    -- 5NF
        -- 4NF + No join dependency (Project-Join Normal Form or PJNF)
        -- It cannot be decomposed into smaller tables without losing information or introducing redundancy.

        -- Eg: SUPPLIER_PART_PROJECT : Supplier_ID	Part_ID	Project_ID
        -- INSERT ANOMALY: 
            -- 
        -- UPDATE ANOMALY:
            -- 
        -- DELETE ANOMALY:
            -- 


    -- ADVANTAGES
        -- Reduces Data Redundancy: Minimizes duplicate data across tables.
        -- Improves Data Integrity: Ensures data consistency through constraints.
        -- Efficient Storage: Optimizes database space by removing repeated information.
        -- Simplifies Updates: Avoids anomalies when inserting, updating, or deleting records.

    -- DISADVANTAGES:
        -- Complex Queries: Requires joining multiple tables, increasing query complexity.
        -- Performance Overhead: May slow down performance in read-heavy applications.
        -- Difficult Maintenance: Managing several related tables increases administrative work.

    -- Techniques for Normalization
        -- Identify Functional Dependencies:
            -- Determine which attributes depend on others (e.g., StudentID → StudentName).

        -- Decompose Tables:
            -- Split large tables into smaller ones based on normalization rules.

        -- Ensure Minimal Data Redundancy:
            -- Avoid storing the same information in multiple places.

        -- Use Candidate Keys and Primary Keys:
            -- Define unique identifiers for each table.

        -- Check for Anomalies:
            -- Ensure your structure prevents insertion, update, and **deletion anomalies.

        -- Balance Normalization and Performance:
            -- Normalize to at least 3NF for most cases, but consider denormalization if performance is critical.


-- DENORMALIZATION
    -- Opposite of Normalization 
    -- Combine tables to reduce joins for faster read speed


-- DATA INTIGRITY - accuracy, consistency, and reliability 

    -- Types of Data Integrity
        -- Entity Integrity
            -- Ensures each record is unique and identifiable.
            -- Enforced using PRIMARY KEY, NOT NULL, AUTO_INCREMENT
                CREATE TABLE students (
                    student_id INT PRIMARY KEY,
                    name VARCHAR(100) NOT NULL
                );

        -- Referential Integrity
            -- Ensures relationships between tables are valid and consistent.
            -- Enforced using FOREIGN KEY, ON DELETE CASCADE
                CREATE TABLE orders (
                    order_id INT PRIMARY KEY,
                    customer_id INT,
                    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
                );

        -- Domain Integrity
            -- Ensures that data within a column falls within a specific range, type, or set of values.
            -- Enforced using CHECK, UNIQUE, ENUM, DEFAULT, Data Types
                CREATE TABLE employees (
                    id INT PRIMARY KEY,
                    age INT CHECK (age >= 18 AND age <= 65),
                    gender ENUM('Male', 'Female', 'Other')
                );


-- ACID - Ensuring the reliability
    -- Atomicity
        -- Ensures that a transaction is treated as a single, indivisible unit. 
        -- Either all the operations within the transaction are completed, or none of them are applied.

        -- START TRANSACTION;
        -- UPDATE accounts SET balance = balance - 500 WHERE account_id = 1; -- Debit
        -- UPDATE accounts SET balance = balance + 500 WHERE account_id = 2; -- Credit
        -- COMMIT; -- Finalize the transaction

    -- Constistency
        -- Ensures that a transaction takes the database from one valid state to another, maintaining business rules and constraints.

        -- CREATE TABLE accounts (
        --     account_id INT PRIMARY KEY,
        --     balance DECIMAL(10,2) CHECK (balance >= 0)
        -- );
        -- UPDATE accounts SET balance = balance - 1000 WHERE account_id = 1;


    -- Isolation
        -- Ensures that concurrent transactions are executed independently without interfering with each other.
            -- Isolation Levels (ANSI SQL):
                -- Read Uncommitted – Least isolation (dirty reads allowed).
                -- Read Committed – Only sees committed changes (avoids dirty reads).
                -- Repeatable Read – Ensures rows read in a transaction remain unchanged (avoids dirty reads and non-repeatable reads).
                -- Serializable – Highest isolation, transactions are fully independent (avoids all concurrency issues).

                -- Level	            Dirty Reads	       Non-Repeatable Reads	  Phantom Reads
                -- READ UNCOMMITTED	    ✅ (Allowed)	      ✅ (Allowed)	        ✅ (Allowed)
                -- READ COMMITTED	    ❌ (Not Allowed)	  ✅ (Allowed)	        ✅ (Allowed)
                -- REPEATABLE READ	    ❌ (Not Allowed)	  ❌ (Not Allowed)	    ✅ (Allowed)
                -- SERIALIZABLE	        ❌ (Not Allowed)	  ❌ (Not Allowed)	    ❌ (Not Allowed)

        -- SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
        -- START TRANSACTION;
        -- UPDATE accounts SET balance = balance - 500 WHERE account_id = 1;
        -- COMMIT;

    -- Durability
        -- Ensures that once a transaction is committed, its changes are permanently saved to the database, even if the system crashes.

        -- START TRANSACTION;
        -- UPDATE orders SET status = 'completed' WHERE order_id = 1001;
        -- COMMIT;


    -- Importance of ACID Properties in Database Transactions
        -- Data Accuracy & Integrity:
            -- Ensures that database states are always valid and consistent.
        -- Fault Tolerance:
            -- Protects against system failures and ensures that data is not lost.
        -- Concurrent Access Management:
            -- Allows multiple users to work on the same database without conflicts.
        -- Reliability in Critical Applications:
            -- Essential for financial systems, medical records, and any environment where data correctness is crucial.


-- IMPEDANCE MISMATCH
    -- Impedance mismatch is the term used to refer to the problems that occurs due to 
    -- differences between the database model and the programming language model. 

        -- Attributes and their data types
            class Student:
                def __init__(self, name, subjects):
                    self.name = name
                    self.subjects = subjects  # List of subjects (complex type)

            -- Problem: The subjects attribute is a list, which relational databases do not support directly.
            -- Mismatch: SQL databases use atomic values (e.g., integers, strings), while programming languages allow complex structures (e.g., lists, dictionaries).
            -- Solution: Store subjects as a comma-separated string or use a separate table with a foreign key.


        -- Tuples
            student = ("Alice", ["Math", "Science"])
           
            -- Problem: Tuples in Python support nested structures (e.g., lists inside tuples), 
                -- while SQL does not support nested lists in a single field.
            -- Mismatch:
                -- Python tuple can store multiple data types, while SQL requires uniform data types.
                -- Python supports list inside tuples, but SQL requires separate tables for one-to-many relationships.
            -- Solution:
                -- Store lists as a separate table with foreign keys.
                -- Flatten the structure into atomic values.


        -- Tables
            class Person:
                def __init__(self, name):
                    self.name = name

            class Student(Person):
                def __init__(self, name, student_id):
                    super().__init__(name)
                    self.student_id = student_id

            -- Problem:
                -- In OOP, Student inherits from Person, but relational databases do not support inheritance directly.
                -- If we store both Person and Student in one table, some fields may be NULL for non-students.
            -- Mismatch: Relational databases use tables with foreign keys, while OOP uses inheritance.
            -- Solution: Use table-per-class, single-table, or table-per-hierarchy strategies.


-- =================================================================
-- ################  SQL - STRUCTURED QUERY LANGUAGE  ##############
-- =================================================================

    -- MYSQL INSTALLATION
        -- sudo apt update
        -- sudo apt install mysql-server

        -- sudo mysql_secure_installation

        -- sudo systemctl start mysql
        -- sudo systemctl enable mysql

        -- mysql --version


    -- START MYSQL
        -- sudo mysql 
        -- mysql -u root -p


    -- CHANGE ROOT PASSWORD
        -- SELECT user, host, plugin FROM mysql.user;

        -- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Ashoka';
        -- FLUSH PRIVILEGES;
        -- EXIT;

        -- sudo systemctl restart mysql


    -- RUN MYSQL DBMS 
        -- sudo systemctl status mysql
        -- sudo systemctl start mysql


    -- CREATE USER
        -- create user 'ashoka'@'localhost' identified by 'Ashoka@12';
        -- grant all privileges on *.* to 'ashoka'@'localhost';


    -- MYSQL WORKBENCH
        -- UBUNTU VERSION
            -- lsb_release -a

        -- MYSQL WORKBENCH
            -- sudo apt install ./mysql-workbench-community_8.0.41-1ubuntu24.04_amd64.deb

        -- MYSQL DEBUG WORKBENCH
            -- sudo apt install ./mysql-workbench-community-dbgsym_8.0.41-1ubuntu24.04_amd64.deb

        -- MYSQL WORKBENCH FROM TERMINAL
            -- sudo apt update
            -- sudo apt install wget
            -- wget https://dev.mysql.com/get/mysql-apt-config_0.8.29-1_all.deb
            -- sudo dpkg -i mysql-apt-config_0.8.29-1_all.deb

            -- sudo apt update
            -- sudo apt install mysql-workbench


-- =================================================================


-- ##################### --
-- ### 📊 DATA TYPES ### --
-- ##################### --

    -- 1️⃣ Numeric Data Types
    -- ---------------------
        -- 🔢 Integer Types:
            TINYINT[(M)] [UNSIGNED] [ZEROFILL]    -- 1 byte, range: -128 to 127 or 0 to 255 (unsigned)
            SMALLINT[(M)] [UNSIGNED] [ZEROFILL]   -- 2 bytes, range: -32,768 to 32,767 or 0 to 65,535 (unsigned)
            MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]  -- 3 bytes, range: -8,388,608 to 8,388,607 or 0 to 16,777,215 (unsigned)
            INT[(M)] [UNSIGNED] [ZEROFILL]        -- 4 bytes, range: -2,147,483,648 to 2,147,483,647 or 0 to 4,294,967,295 (unsigned)
            BIGINT[(M)] [UNSIGNED] [ZEROFILL]     -- 8 bytes, range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 or 0 to 18,446,744,073,709,551,615 (unsigned)

        -- 🎯 Fixed-Point Types:
            DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL] -- Exact numeric data type; M is precision, D is scale
            NUMERIC[(M[,D])] [UNSIGNED] [ZEROFILL] -- Synonym for DECIMAL

        -- 📚 Floating-Point Types:
            FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]    -- 4 bytes, approximate numeric data type
            DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]   -- 8 bytes, approximate numeric data type
            REAL[(M,D)] [UNSIGNED] [ZEROFILL]     -- Synonym for DOUBLE


    -- 🕒 Date and Time Data Types
    -- ---------------------------
            DATE                -- 'YYYY-MM-DD', range: '1000-01-01' to '9999-12-31'
            DATETIME[(fsp)]     -- 'YYYY-MM-DD HH:MM:SS[.fraction]', range: '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
            TIMESTAMP[(fsp)]    -- 'YYYY-MM-DD HH:MM:SS[.fraction]', range: '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC
            TIME[(fsp)]         -- 'HH:MM:SS[.fraction]', range: '-838:59:59' to '838:59:59'
            YEAR[(4)]           -- 'YYYY', range: 1901 to 2155


    -- 🔤 String Data Types
    -- --------------------
            CHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]                     -- Fixed-length, 0 to 255 characters
            VARCHAR(M) [CHARACTER SET charset_name] [COLLATE collation_name]                    -- Variable-length, 0 to 65,535 characters
            BINARY[(M)]                                                                         -- Fixed-length binary data
            VARBINARY(M)                                                                        -- Variable-length binary data
            TINYBLOB                                                                            -- Binary large object, maximum length of 255 bytes
            BLOB[(M)]                                                                           -- Binary large object, maximum length of 65,535 bytes
            MEDIUMBLOB                                                                          -- Binary large object, maximum length of 16,777,215 bytes
            LONGBLOB                                                                            -- Binary large object, maximum length of 4,294,967,295 bytes
            TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]                      -- Text column, maximum length of 255 characters
            TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]                     -- Text column, maximum length of 65,535 characters
            MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]                    -- Text column, maximum length of 16,777,215 characters
            LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]                      -- Text column, maximum length of 4,294,967,295 characters
            ENUM('value1', 'value2', ...) [CHARACTER SET charset_name] [COLLATE collation_name] -- Enumeration, chosen from a list of values
            SET('value1', 'value2', ...) [CHARACTER SET charset_name] [COLLATE collation_name]  -- A set of values, chosen from a list of values


    -- 🌍 Spatial Data Types
    -- ---------------------
            GEOMETRY                       -- A spatial value of any type
            POINT                          -- A point in 2D space
            LINESTRING                     -- A curve with linear interpolation between points
            POLYGON                        -- A polygon
            MULTIPOINT                     -- A collection of POINTs
            MULTILINESTRING                -- A collection of LINESTRINGs
            MULTIPOLYGON                   -- A collection of POLYGONs
            GEOMETRYCOLLECTION             -- A collection of GEOMETRY objects


    -- 🧰. JSON Data Type
    -- -----------------
            JSON                           -- Stores JSON (JavaScript Object Notation) documents


    -- For detailed information, refer to the MySQL documentation: https://dev.mysql.com/doc/en/data-types.html


-- =================================================================


-- ################### --
-- ###  DATABASES  ### --
-- ################### --

    -- DISPLAY ALL DATABASE
        SHOW DATABASES;


    -- DISPLAY USER DATABASES ONLY
        SHOW DATABASES WHERE `Database` NOT IN ('information_schema', 'mysql', 'performance_schema', 'sys');

    
    -- SHOW USER PRIVILEGES
        SHOW GRANTS FOR 'your_username'@'localhost';    


    -- CREATE DATABASE
        CREATE DATABASE IF NOT EXISTS test;
        CREATE DATABASE test;


    -- USE DATABASE
        USE test;


    -- DISPLAY CURRENT DATABASE
        SELECT DATABASE();

    
    -- DROP DATABASE
        DROP DATABASE IF EXISTS test;

        DROP DATABASE test;


-- =================================================================


-- ################### --
-- ###    TABLES   ### --
-- ################### --

    -- SHOW TABLES
        SHOW TABLES;
        SHOW TABLES FROM database_name;

    -- SHOW TABLE STRUCTURE
        DESCRIBE table_name;             -- Alias: DESC
        SHOW CREATE TABLE table_name;

    -- TABLE CONSTRAINTS 
        SELECT * 
        FROM information_schema.table_constraints
        WHERE table_schema = DATABASE();

    -- PERTICULAR TABLE CONSTRAINTS DETAILS
        SELECT * 
        FROM information_schema.table_constraints
        WHERE table_schema = DATABASE() 
        AND table_name = 'employees';

        SELECT constraint_name, column_name
        FROM information_schema.key_column_usage
        WHERE table_schema = DATABASE()
        AND table_name = 'employees'
        AND constraint_name != 'PRIMARY';

    
    -- SHOW PRIMARY KEY
        SELECT column_name
        FROM information_schema.key_column_usage
        WHERE table_schema = DATABASE()
        AND table_name = 'employees'
        AND constraint_name = 'PRIMARY';


    -- FOREIGN KEY COSTRAINTS DETAILS
        SELECT * 
        FROM information_schema.referential_constraints
        WHERE constraint_schema = DATABASE();


    -- CHECK CONSTRAINTS DETAILS
        SELECT constraint_name
        FROM information_schema.check_constraints
        WHERE table_name = 'employees';


    -- INDEX
        SHOW INDEX FROM emp WHERE Non_unique = 0;

        SHOW INDEX FROM employees WHERE column_name = 'phone_number';

        SHOW KEYS FROM employees; -- Alternative for indexes 


-- ==================================================================================


-- ################################--
-- ### DATA DEFINITION LANGUAGE ###--
-- ################################--

    -- Structure of the database
    -- DDL commands define and manage database structures like tables, indexes, and schemas. 
    -- These commands automatically commit changes, making them permanent.


    -- CREATE
        -- CREATE DATABASE    – Defines a new database.
        -- CREATE TABLE       – Creates a new table.
        -- CREATE VIEW        – Creates a virtual table from a query.
        -- CREATE INDEX       – Defines an index to optimize searches.
        -- CREATE USER        – Creates a new database user (MySQL-specific DDL).
        -- CREATE ROLE        – Defines a new role for managing privileges.
        -- CREATE TRIGGER     – Sets up actions that execute automatically on specific events.
        -- CREATE PROCEDURE   – Defines a reusable block of SQL code (stored procedure).
        -- CREATE FUNCTION    – Creates a custom function that returns a value.
        -- CREATE EVENT       – Schedules tasks to run automatically.
        -- CREATE TABLESPACE  – Manages physical storage (rarely used in MySQL).

    -- ALTER 
        -- ALTER DATABASE
        -- ALTER TABLE
        -- ALTER VIEW 
        -- ALTER USER
        -- ALTER TABLESPACE

        -- ADD - MODIFY - CHANGE - RENAME - DROP

    -- DROP 
        -- DROP DATABASE
        -- DROP TABLE
        -- DROP VIEW 
        -- DROP INDEX
        -- DROP USER
        -- DROP ROLE
        -- DROP TRIGGER 
        -- DROP PROCEDURE
        -- DROP FUNCTION
        -- DROP EVENT
        -- DROP TABLESPACE

    -- TRUNCATE 
        -- TRUNCATE TABLE

    -- RENAME
        -- RENAME TABLE
        -- RENAME USER


    -- 📌 CREATE 

        -- CREATE DATABASE
            CREATE DATABASE IF NOT EXISTS demo;

            CREATE DATABASE demo;


        -- CREATE TABLE
            CREATE TABLE emp (
                emp_id INT AUTO_INCREMENT PRIMARY KEY,     
                emp_name VARCHAR(100) NOT NULL,                
                age INT CHECK (age >= 18),                 
                salary DECIMAL(10,2) DEFAULT 50000.00,     
                dept_id INT,       
                phone_number VARCHAR(15),                  
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                -- dept_id INT,
                -- FOREIGN KEY (dept_id) REFERENCES dept(dept_id) ON DELETE CASCADE ON UPDATE CASCADE,
                -- PRIMARY KEY(emp_id), 
                -- UNIQUE(emp_name)                            
            );       

            CREATE TABLE dept (
                dept_id INT AUTO_INCREMENT PRIMARY KEY,           
                dept_name VARCHAR(100) UNIQUE NOT NULL            
            );

        
        -- DATA
            INSERT INTO emp (emp_name, age, salary, dept_id)
            VALUES
                ('Alice Johnson', 28, 60000.00, 1),
                ('Bob Smith', 35, 75000.00, 2),
                ('Charlie Brown', 40, 85000.50, 3),
                ('Diana Prince', 29, 72000.00, 4),
                ('Ethan Hunt', 32, 68000.75, 1),
                ('Fiona Gallagher', 26, 51000.00, 2),
                ('George Miller', 45, 92000.25, 3),
                ('Hannah Davis', 31, 65000.00, 4),
                ('Ian Curtis', 27, 57000.00, 1),
                ('Jessica Pearson', 38, 89000.50, 2),
                ('Kevin Malone', 50, 48000.00, 3),
                ('Laura Palmer', 24, 53000.00, 4),
                ('Mike Ross', 30, 70000.00, 1),
                ('Nancy Wheeler', 23, 52000.00, 2),
                ('Oscar Martinez', 37, 78000.00, 3);

            INSERT INTO dept (dept_id, dept_name)
            VALUES (1, 'HR'), (2, 'Engineering'), (3, 'Testing'), (4, 'Finance');

        -- INDEX

            -- PRIMARY KEY	Unique identifier for each row.	
                PRIMARY KEY(emp_id)

            -- UNIQUE	Ensures all values in a column are unique.	
                CREATE UNIQUE INDEX idx_email ON emp(email);

            -- INDEX (Normal)	Speeds up queries on non-unique columns.	
                CREATE INDEX idx_salary ON emp(salary);

                CREATE INDEX idx_name_age ON emp(emp_name, age); -- Multi-column index for combined search

            -- FULLTEXT	For fast searches on text columns.	
                CREATE FULLTEXT INDEX idx_bio ON emp(bio);

            -- SPATIAL	For geographical data types.	
                CREATE SPATIAL INDEX idx_loc ON locations(geom);

        
        -- VIEW
            -- Simple View / Direct mapping to one table.
                CREATE VIEW emp_view AS
                SELECT emp_id, emp_name FROM emp;

            -- Complex View / Has JOINs, aggregates, etc.
                CREATE VIEW emp_dept_view AS
                SELECT e.emp_id, e.emp_name, d.dept_name
                FROM employees e
                JOIN dept d ON e.dept_id = d.dept_id;

            -- Updatable View / Meets MySQL’s modification rules.
                CREATE VIEW editable_view AS
                SELECT emp_id, emp_name, salary
                FROM employees
                WHERE salary > 50000;

            -- Read-Only View / By definition, cannot be modified.
                CREATE VIEW salary_summary AS
                SELECT dept_id, AVG(salary) AS avg_salary
                FROM employees
                GROUP BY dept_id;

            -- Materialized View / persist the data physically

        
        -- CREATE USER


        -- CREATE ROLE


        -- CREATE TRIGGER


        -- CREATE PROCEDURE


        -- CREATE FUNCTION


        -- CREATE EVENT


        -- CREATE TABLESPACE


    -- 📌 ALTER

        -- ADD NEW COLUMN
            ALTER TABLE emp
            ADD COLUMN email VARCHAR(100) UNIQUE;        

            ALTER TABLE emp
            ADD email VARCHAR(100) UNIQUE;          


        -- ADD PRIMARY KEY
            ALTER TABLE emp
            ADD PRIMARY KEY (emp_id);


        -- ADD FOREIGN KEY
            ALTER TABLE emp
            ADD CONSTRAINT fk_department
            FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
            ON DELETE CASCADE 
            ON UPDATE CASCADE;

            ALTER TABLE emp
            ADD FOREIGN KEY (dept_id) REFERENCES dept(dept_id); 


        -- ADD UNIQUE CONSTRAINT
            ALTER TABLE emp
            ADD CONSTRAINT phone_number UNIQUE (phone_number);    

            ALTER TABLE emp
            ADD UNIQUE (phone_number);


        -- ADD CHECK CONSTRAINT
            ALTER TABLE emp
            ADD CONSTRAINT chk_age CHECK (age >= 18);

            ALTER TABLE emp
            ADD CHECK (age >= 18);


        -- MODIFY NEW DATATYPE / CHANGE DATATYPE
            ALTER TABLE emp
            MODIFY salary FLOAT;


        -- MODIFY NULL / NOT NULL CONSTRAINT / CHANGE CONSTRAINT
            ALTER TABLE emp
            MODIFY COLUMN age VARCHAR(100) NOT NULL;

            ALTER TABLE emp
            MODIFY age VARCHAR(100) NULL;


        -- CHANGE COLUMN_NAME / DATA TYPE
            ALTER TABLE emp
            CHANGE phone_number contact_number VARCHAR(20); 


    -- 📌 DROP

        -- DROP TABLE
            DROP TABLE emp;

            DROP TABLE IF EXISTS emp;                            


        -- DROP COLUMN
            ALTER TABLE emp
            DROP COLUMN email;      


        -- DROP PRIMARY KEY
            ALTER TABLE emp
            DROP PRIMARY KEY;


        -- DROP FOREIGN KEY
            ALTER TABLE emp
            DROP FOREIGN KEY fk_department;  

        
        -- DROP UNIQUE CONSTRAINT
            ALTER TABLE emp
            DROP INDEX uq_phone_number; 


        -- DROP CHECK CONSTRAINT
            ALTER TABLE emp
            DROP CHECK chk_age;


        -- RETRIEVE DELETED TABLE
            FLASHBACK TABLE TABLE_NAME
            TO BEFORE DROP;


        -- DELETE TABLE PERMANENTLY
            DROP TABLE TABLE_NAME
            PURGE TABLE TABLE_NAME


    -- 📌 TRUNCATE
            TRUNCATE TABLE emp;


    -- 📌 RENAME

        -- RENAME TABLE
            RENAME TABLE emp TO emp;

            ALTER TABLE emp
            RENAME TO emp;


        -- RENAME COLUMN
            ALTER TABLE emp
            CHANGE e_name emp_name CHAR(55);  
            
            ALTER TABLE emp
            RENAME COLUMN e_name TO emp_name;


    -- 📌 COMMENT

        -- THIS IS A COMMENT

        /* 
            THIS IS
            MULTI LINE
            COMMENT
        */


        -- TABLE COMMENT
            ALTER TABLE emp
            COMMENT = 'Stores employee records and related information';


        -- COLUMN COMMENT
            ALTER TABLE emp
            MODIFY emp_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique ID for each employee';




-- ============================================================


-- ################################## --
-- ### DATA MANIPULATION LANGUAGE ### --
-- ################################## --

    -- Manipulating data
    -- DML commands are used to retrieve, insert, update, and delete data.
    -- These commands can be rolled back or committed using TCL commands.

    -- INSERT - UPDATE - MERGE - DELETE - CALL - LOCK TABLE - EXPLAIN PLAN 
     

    -- 📌 INSERT: Add records into a table
        -- Insert a single row
            INSERT INTO emp (emp_name, age, salary, dept_id, phone_number)
            VALUES ('John Doe', 29, 60000.00, 1, '9876543210');

        -- Insert multiple rows
            INSERT INTO emp (emp_name, age, salary, dept_id, phone_number)
            VALUES ('Jane Smith', 32, 75000.00, 2, '9876543211'),
                ('Alice Brown', 25, 50000.00, 3, '9876543212'),
                ('Bob Johnson', 40, 90000.00, 1, '9876543213');

        -- Insert with selected columns only
            INSERT INTO emp (emp_name, age)
            VALUES ('Charlie Green', 30);

        -- Insert using SELECT (Insert data from another table)
            INSERT INTO emp (emp_name, age, salary, dept_id)
            SELECT emp_name, age, salary, dept_id
            FROM old_emp
            WHERE age > 30;


    -- 📌 UPDATE: Modify existing records

        -- Update specific records
            UPDATE emp
            SET salary = 70000.00
            WHERE name = 'John Doe';

        -- Update multiple columns
            UPDATE emp
            SET age = 31, salary = 72000.00
            WHERE emp_id = 2;

        -- Conditional update using CASE expression
            UPDATE emp
            SET salary = CASE
                WHEN age < 30 THEN salary * 1.10
                WHEN age BETWEEN 30 AND 40 THEN salary * 1.05
                ELSE salary
            END
            WHERE dept_id = 1;

        -- Update using JOIN (Update values based on another table)
            UPDATE emp e
            JOIN dept d ON e.dept_id = d.dept_id
            SET e.salary = e.salary * 1.10
            WHERE d.dept_name = 'Engineering';

        -- Use LIMIT with UPDATE (MySQL-specific feature)
            UPDATE emp
            SET salary = salary + 5000
            ORDER BY age DESC
            LIMIT 3;


    -- 📌 DELETE: Remove records from a table

        -- Delete specific rows
            DELETE FROM emp
            WHERE age < 25;

        -- Delete with JOIN (Remove records matching another table)
            DELETE e
            FROM emp e
            JOIN dept d ON e.dept_id = d.dept_id
            WHERE d.dept_name = 'Obsolete Department';

        -- Use LIMIT with DELETE (MySQL-specific feature)
            DELETE FROM emp
            ORDER BY created_at ASC
            LIMIT 1;

        -- Delete all records from a table (without deleting structure)
            DELETE FROM emp;

        -- Soft Delete (Mark record as inactive instead of physical deletion)
            UPDATE emp
            SET is_deleted = 1
            WHERE emp_id = 5;

    
    -- 📌 MERGE (UPSERT): Simulate UPSERT behavior in MySQL

        -- Use REPLACE to update if duplicate (Avoids duplicate errors)
            REPLACE INTO emp (emp_id, emp_name, age, salary)
            VALUES (101, 'Tom White', 45, 85000.00);

        -- Merge operation: Insert if not exists, update if exists
            INSERT INTO emp (emp_id, name, age, salary, dept_id)
            VALUES (101, 'Tom White', 45, 85000.00, 2)
            ON DUPLICATE KEY UPDATE
            name = VALUES(name),
            age = VALUES(age),
            salary = VALUES(salary),
            dept_id = VALUES(dept_id);


    -- 📌 CALL: Execute Stored Procedures

        -- Example Stored Procedure: Increment Salary
            DELIMITER $$
            CREATE PROCEDURE IncrementSalary(IN emp_id INT, IN increase DECIMAL(10,2))
            BEGIN
                UPDATE emp
                SET salary = salary + increase
                WHERE emp.emp_id = emp_id;
            END $$
            DELIMITER ;

        -- Call Stored Procedure
            CALL IncrementSalary(1, 5000);


    -- 📌 LOCK: Control concurrency with table locks

        -- Table-level - Row-level - Implicit Lock - Explicit Lock

        -- Explicitly lock tables for secure multi-user access
            LOCK TABLES emp WRITE; -- Prevent others from reading/writing

            UPDATE emp
            SET salary = salary * 1.05
            WHERE dept_id = 1;

            UNLOCK TABLES; -- Release the lock

        -- Using SELECT FOR UPDATE (Row-level locking)
            START TRANSACTION;
            SELECT * FROM emp WHERE emp_id = 1 FOR UPDATE;
            UPDATE emp SET salary = 75000 WHERE emp_id = 1;
            COMMIT; -- Release row lock after update


    -- 📌 EXPLAIN PLAN: Analyze Query Execution

        -- Understand how MySQL executes a query for performance tuning
            EXPLAIN SELECT * FROM emp WHERE age > 30;

            -- With JOIN
            EXPLAIN SELECT e.emp_name, d.dept_name
            FROM emp e
            JOIN dept d ON e.dept_id = d.dept_id
            WHERE e.salary > 70000;

        -- With UPDATE
            EXPLAIN UPDATE emp SET salary = salary * 1.10 WHERE age < 40;

    
    -- ✅ Best Practices for DML Operations

        -- 1. Use transactions (BEGIN, COMMIT, ROLLBACK) for critical updates.
        -- 2. Prefer batch inserts for large datasets to improve performance.
        -- 3. Always apply WHERE clause to limit scope in UPDATE/DELETE.
        -- 4. Use JOINs for cross-table modifications rather than nested queries.
        -- 5. Implement indexing to speed up search-based DML operations.
        -- 6. Use locking mechanisms for high-concurrency applications.


-- ===============================================================


-- ####################################### --
-- ### 🛡️ TRANSACTION CONTROL LANGUAGE ### --
-- ####################################### --

    -- Managing transactions
    -- TCL commands manage database transactions, ensuring data integrity during multiple operations. 
    -- These commands work alongside DML commands.


    -- COMMIT - SAVEPOINT - ROLLBACK - SET TRANSACTION - SET CONSTRAINT
    

    -- 📌 COMMIT
        SET autocommit = 0; -- Turns off auto-commit

        START TRANSACTION;
        INSERT INTO employees (emp_id, name, age) VALUES (102, 'Bob', 25);
        UPDATE employees SET salary = 60000 WHERE emp_id = 102;
        COMMIT; -- Makes the changes permanent


    -- 📌 ROLLBACK
        START TRANSACTION; -- Start a transaction
        DELETE FROM employees WHERE emp_id = 102;
        ROLLBACK; -- Undo the deletion

    -- 📌 SAVEPOINT
        -- Create savepoint 
            START TRANSACTION;

            UPDATE employees 
            SET salary = 80000 
            WHERE emp_id = 101;

            SAVEPOINT before_bonus; -- Create a savepoint

            UPDATE employees 
            SET salary = 90000 
            WHERE emp_id = 101;

            ROLLBACK TO before_bonus;

            COMMIT;

        -- Removes the savepoint
            RELEASE SAVEPOINT before_bonus; 


    -- 📌 ROLLBACK & SAVEPOINT
        ROLLBACK TO SAVEPOINT_NAME; -- Undo second update, keep first

        START TRANSACTION;
        UPDATE employees SET salary = 75000 WHERE emp_id = 101;
        SAVEPOINT before_bonus;
        UPDATE employees SET salary = 80000 WHERE emp_id = 101;
        ROLLBACK TO before_bonus; 
        COMMIT;

    -- 📌 SET TRANSACTION: Control isolation levels for concurrency
        START TRANSACTION; -- Start a transaction

        INSERT INTO employees (emp_id, name, age, salary) 
        VALUES (103, 'Alice', 29, 70000);

        UPDATE employees 
        SET salary = 75000 
        WHERE emp_id = 103;

        COMMIT; -- Make the changes permanent

        -- Set isolation level for the current session
            SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

            START TRANSACTION;

            SELECT * FROM employees WHERE emp_id = 101;

            COMMIT;

    -- 📌 SET CONSTRAINT: 	Enable/disable foreign key checks temporarily
        -- Disable foreign key checks
            SET FOREIGN_KEY_CHECKS = 0;

            DELETE FROM departments WHERE department_id = 10;

        -- Re-enable foreign key checks
            SET FOREIGN_KEY_CHECKS = 1;



-- ===============================================================


-- ############################# --
-- ### DATA CONTROL LANGUAGE ### --
-- ############################# --

    -- Controlling access permission
    -- user privileges and access control
    -- User Privilege Tables

    -- Types of Privileges:
        -- Privilege	           Purpose
        -- ALL PRIVILEGES	       Grants all available privileges
        -- SELECT	               Allows reading data
        -- INSERT	               Allows inserting new data
        -- UPDATE	               Allows modifying existing data
        -- DELETE	               Allows deleting records
        -- CREATE	               Allows creating new tables/databases
        -- DROP	                   Allows deleting tables/databases
        -- ALTER	               Allows changing table structure
        -- INDEX	               Allows creating/dropping indexes
        -- EXECUTE	               Allows executing stored procedures
        -- GRANT OPTION	           Allows granting privileges to others
        -- FILE	                   Allows access to external files
        -- SHOW DATABASES	       Allows viewing available databases 

    -- Privileges Scope:
        -- Global Level:           Affects all databases.
        -- Database Level:         Affects a specific database.
        -- Table Level:            Affects individual tables.
        -- Column Level:           Grants permission on specific columns.


    -- GRANT 
        -- Types of Privileges
    -- REVOKE
        -- Types of Privileges


    -- 🔒 GRANT
        -- ✅ Grant SELECT and INSERT on "test_db" to "user1"
            GRANT SELECT, INSERT ON test_db.* 
            TO 'user1'@'localhost' 
            IDENTIFIED BY 'password123';

        -- ✅ Grant UPDATE on "employees" table to "user2"
            GRANT UPDATE ON test_db.employees 
            TO 'user2'@'localhost';

        -- ✅ Grant SELECT on "name" column in "employees" to "user3"
            GRANT SELECT (name) ON test_db.employees 
            TO 'user3'@'localhost';

        -- ✅ Grant EXECUTE on a stored procedure to "user4"
            GRANT EXECUTE ON PROCEDURE test_db.CalculateBonus 
            TO 'user4'@'localhost';

        -- ✅ Grant all privileges on "test_db" to "admin"
            GRANT ALL PRIVILEGES ON test_db.* 
            TO 'admin'@'localhost' 
            WITH GRANT OPTION;


    -- 🔒 REVOKE
        -- ✅ Revoke INSERT on "employees" table from "user2"
            REVOKE INSERT ON test_db.employees 
            FROM 'user2'@'localhost';

        -- ✅ Revoke all privileges from "user1"
            REVOKE ALL PRIVILEGES ON test_db.* 
            FROM 'user1'@'localhost';

        -- ✅ Remove the ability to delegate privileges from "admin"
            REVOKE GRANT OPTION ON test_db.* 
            FROM 'admin'@'localhost';


    -- 🔒 Managing Users and Privileges
        -- ✅ Create a New User
            CREATE USER 'new_user'@'localhost' 
            IDENTIFIED BY 'secure_password';

        -- ✅ View Existing Privileges
            SHOW GRANTS FOR 'user1'@'localhost';

        -- ✅ Revoke User Access (Delete User)
            DROP USER 'user1'@'localhost';

        -- ✅ Flush Privileges After manual changes to MySQL privilege tables:
            FLUSH PRIVILEGES; -- Refreshes user and privilege caches


    -- 🔒 Dynamic Privileges (MySQL 8+)
        -- Dynamic privileges allow more fine-grained access control.
            GRANT BACKUP_ADMIN ON *.* TO 'backup_user'@'localhost';

        -- Proxy users allow one user to act on behalf of another.
            GRANT PROXY ON 'real_user'@'localhost' TO 'proxy_user'@'localhost';

        -- Limit a user’s resource consumption.
            GRANT USAGE ON *.* TO 'user1'@'localhost'
            WITH MAX_QUERIES_PER_HOUR 100
                MAX_UPDATES_PER_HOUR 50
                MAX_CONNECTIONS_PER_HOUR 20
                MAX_USER_CONNECTIONS 10;


-- ===============================================================


-- ########################### --
-- ### DATA QUERY LANGUAGE ### --
-- ########################### --


    -- 📊 Basic Query Structure

        SELECT * FROM emp;

        SELECT [DISTINCT] column1, column2 AS alias
        FROM table_name
        WHERE condition
        GROUP BY column
        HAVING condition
        ORDER BY column [ASC|DESC]
        LIMIT offset, count;

        SELECT DISTINCT dept_id, name AS emp_name, salary
        FROM emp
        WHERE age > 30
        GROUP BY dept_id, name, salary
        HAVING AVG(salary) > 60000
        ORDER BY salary DESC
        LIMIT 0, 2;
        

    -- 📊 Projection (Column Selection)

        SELECT */[DISTINCT] COLUMN_NAME/EXPRESSION [ALIAS] 
        FROM TABLE_NAME;

        -- ✅ Basic Projection (All Columns)
            SELECT * FROM emp;

        -- ✅ Selective Projection (Specific Columns)
            SELECT emp_id, name, salary FROM emp;

        -- ✅ Using Expressions in Projection
            SELECT emp_id, salary * 12 AS annual_salary FROM emp;

        -- ✅ Function-Based Projection
            SELECT UPPER(emp_name) AS upper_name FROM emp;
        

    -- 📊 SELECTION (Row Filtering)

        SELECT */[DISTINCT] COLUMN_NAME/EXPRESSION [ALIAS] 
        FROM TABLE_NAME
        WHERE [FILTER CONDITION];

        -- ✅ Basic Filtering using WHERE
            SELECT * FROM emp
            WHERE age > 30;

        -- ✅ Complex Conditions with Logical Operators
            SELECT * FROM emp
            WHERE age > 30 AND salary > 60000
            OR dept_id = 2;

        -- ✅ Range Filtering with BETWEEN
            SELECT * FROM emp
            WHERE salary BETWEEN 50000 AND 80000;

        -- ✅ Pattern Matching with LIKE
            SELECT * FROM emp
            WHERE name LIKE 'A%'; -- Names starting with 'A'

        -- ✅ Null Checking
            SELECT * FROM emp
            WHERE phone_number IS NULL;

        -- ✅ Advanced Filtering with Regular Expressions (REGEXP)
            SELECT * FROM emp
            WHERE emp_name REGEXP '^A|Z$'; -- Names starting with 'A' or ending with 'Z'


    -- 📊 ALIAS (Column and Table Aliases)

        -- ✅ Column Alias
            SELECT salary * 12 AS annual_salary
            FROM emp;

            SELECT salary * 12 AS "annual salary" -- Multi word string
            FROM emp;

        -- ✅ Alias Without AS
            SELECT salary * 12 annual_salary
            FROM emp;

        -- ✅ Alias with *
            SELECT emp.*, salary*12 AS annual_salary FROM emp;

        -- ✅ Table Alias
            SELECT e.emp_name, d.dept_name
            FROM emp e
            JOIN dept d ON e.dept_id = d.dept_id;

        -- ✅ Alias with Calculations
            SELECT emp_id, CONCAT(emp_name, ' (Age: ', age, ')') AS emp_details
            FROM emp;


    -- 📊 DISTINCT (Removing Duplicates)

        -- ✅ Simple DISTINCT Usage
            SELECT DISTINCT dept_id
            FROM emp;

        -- ✅ Multiple Columns in DISTINCT
            SELECT DISTINCT dept_id, age
            FROM emp;

        -- ✅ COUNT with DISTINCT
            SELECT COUNT(DISTINCT dept_id) AS unique_departments
            FROM emp;


    -- 📊 ADVANCED METADATA QUERIES

        -- ✅ View Table Structure
            DESCRIBE emp; -- Basic structure
            SHOW COLUMNS FROM emp; -- Similar output

        -- ✅ Detailed Table Schema (DDL Statement)
            SHOW CREATE TABLE emp;

        -- ✅ View Indexes
            SHOW INDEX FROM emp;

        -- ✅ Check Database and Table Sizes
            SELECT table_name, ROUND((data_length + index_length) / 1024 / 1024, 2) AS size_mb
            FROM information_schema.tables
            WHERE table_schema = 'your_database';


    -- 📊 EXPERT-LEVEL QUERY TECHNIQUES

        -- ✅ Derived Columns with CASE
            SELECT emp_name, salary,
                CASE 
                    WHEN salary > 80000 THEN 'High'
                    WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
                    ELSE 'Low'
                END AS salary_bracket
            FROM emp;

        -- ✅ Window Functions (MySQL 8+)
            -- ➤ Ranking and Partitioning
                SELECT emp_name, dept_id, salary,
                    RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rank
                FROM emp;

            -- ➤ Running Total Calculation
                SELECT emp_id, emp_name, salary,
                    SUM(salary) OVER (PARTITION BY dept_id ORDER BY emp_id) AS running_total
                FROM emp;

        -- ✅ JSON Data Handling
            CREATE TABLE orders (
                id INT PRIMARY KEY AUTO_INCREMENT,
                customer JSON
            );

            INSERT INTO orders (customer) VALUES ('{"name": "John", "email": "john@example.com"}');

            SELECT customer->>'$.name' AS customer_name
            FROM orders;

        -- ✅ Recursive Common Table Expressions (CTEs) - Hierarchy Query (MySQL 8+)
            WITH RECURSIVE employee_hierarchy AS (
                SELECT emp_id, name, manager_id
                FROM emp
                WHERE manager_id IS NULL
                UNION ALL
                SELECT e.emp_id, e.name, e.manager_id
                FROM emp e
                JOIN employee_hierarchy eh ON e.manager_id = eh.emp_id
            )
            SELECT * FROM employee_hierarchy;


    -- 📊 PERFORMANCE OPTIMIZATION TECHNIQUES

        -- ✅ Use EXPLAIN to Analyze Queries
            EXPLAIN SELECT * FROM emp WHERE age > 30;

        -- ✅ Use EXPLAIN FORMAT=JSON for Detailed Insights
            EXPLAIN FORMAT=JSON -- ANALYZE FORMAT=JSON
            SELECT * FROM emp WHERE age > 30;

        -- ✅ 3. Index Best Practices
            -- Index columns used in JOINs, WHERE, and ORDER BY.
            -- Avoid indexing low-cardinality columns (e.g., gender).

        -- ✅ 4. Optimize Large Data Queries
            -- Use LIMIT for pagination.
            -- Partition large tables for better performance.

        -- ✅ 5. Query Cache (if enabled)
            -- Use SQL_CACHE keyword for frequently executed queries.


    -- 📊 ADVANCED PAGINATION

        -- ✅ Efficient Pagination with LIMIT and OFFSET
            SELECT * FROM emp
            ORDER BY emp_id
            LIMIT 10 OFFSET 20; -- Fetches records 21 to 30

        -- ✅ Using Cursor-Based Pagination
            SELECT * FROM emp
            WHERE emp_id > 100
            ORDER BY emp_id
            LIMIT 10;


-- ===============================================================


-- ##################### --
--   🎯 CONSTRAINTS 🎯   --
-- ##################### --

    -- 📌 PRIMARY KEY

        -- ✅ Creating a Table with PRIMARY KEY
            CREATE TABLE students (
                student_id INT PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                age INT
            );

        -- ✅ Adding a PRIMARY KEY to an Existing Table
            ALTER TABLE students
            ADD PRIMARY KEY (student_id);

        -- ✅ Composite PRIMARY KEY (Multiple Columns)
            CREATE TABLE enrollments (
                student_id INT,
                course_id INT,
                enrollment_date DATE,
                PRIMARY KEY (student_id, course_id)
            );

        -- ❌ DROP PRIMARY KEY
            ALTER TABLE students DROP PRIMARY KEY;


    -- 🔗 FOREIGN KEY

        -- ✅ Creating a Table with FOREIGN KEY
            CREATE TABLE orders (
                order_id INT PRIMARY KEY,
                customer_id INT,
                FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
            );

        -- ✅ Adding a FOREIGN KEY to an Existing Table
            ALTER TABLE orders
            ADD CONSTRAINT fk_customer
            FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

            -- 🔍 ON DELETE / ON UPDATE Actions:
                -- CASCADE: Automatically propagates changes.
                -- SET NULL: Sets the value to NULL if the referenced row is deleted.
                -- RESTRICT/NO ACTION: Prevents deletion or update if there are dependencies.

            CREATE TABLE orders (
                order_id INT PRIMARY KEY,
                customer_id INT,
                FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
                ON DELETE CASCADE 
                ON UPDATE CASCADE
            );

        -- ❌ DROP FOREIGN KEY
            ALTER TABLE orders DROP FOREIGN KEY fk_customer;


    -- 🔐 UNIQUE

        -- ✅ Creating a UNIQUE Constraint
            CREATE TABLE emp (
                emp_id INT PRIMARY KEY,
                email VARCHAR(100) UNIQUE,
                phone VARCHAR(15) UNIQUE
            );

        -- ✅ Adding a UNIQUE Constraint
            ALTER TABLE emp
            ADD CONSTRAINT unique_email
            UNIQUE (email);

        -- ✅ Composite UNIQUE Constraint (Multiple Columns)
            CREATE TABLE inventory (
                product_id INT,
                warehouse_id INT,
                quantity INT,
                UNIQUE (product_id, warehouse_id)
            );

        -- ❌ DROP UNIQUE Constraint
            ALTER TABLE emp DROP INDEX unique_email;


    -- 📏 NOT NULL

        -- ✅ Creating a NOT NULL Constraint
            CREATE TABLE products (
                product_id INT PRIMARY KEY,
                product_name VARCHAR(100) NOT NULL,
                price DECIMAL(10, 2) NOT NULL
            );

        -- ✅ Adding a NOT NULL Constraint
            ALTER TABLE products
            MODIFY price DECIMAL(10, 2) NOT NULL;

        -- ❌ Remove NOT NULL Constraint
            ALTER TABLE products
            MODIFY price DECIMAL(10, 2) NULL;


    -- ✅ CHECK

        -- ✅ Creating a CHECK Constraint
            CREATE TABLE emp (
                emp_id INT PRIMARY KEY,
                age INT CHECK (age >= 18),
                salary DECIMAL(10, 2) CHECK (salary >= 30000)
            );

        -- ✅ Adding a CHECK Constraint
            ALTER TABLE emp
            ADD CONSTRAINT check_age
            CHECK (age >= 18);

        -- ✅ CHECK with Multiple Conditions
            CREATE TABLE orders (
                order_id INT PRIMARY KEY,
                quantity INT CHECK (quantity > 0 AND quantity <= 100)
            );

        -- ❌ DROP CHECK Constraint
            ALTER TABLE emp DROP CHECK check_age;


    -- 📊 DEFAULT

        -- ✅ Creating a DEFAULT Constraint
            CREATE TABLE orders (
                order_id INT PRIMARY KEY,
                order_date DATE DEFAULT (CURDATE()),
                status VARCHAR(20) DEFAULT 'Pending'
            );

        -- ✅ Adding a DEFAULT Constraint
            ALTER TABLE orders
            MODIFY status VARCHAR(20) DEFAULT 'Pending';

            ALTER TABLE orders
            ALTER status SET DEFAULT 'Pending';

        -- ❌ DROP DEFAULT Constraint
            ALTER TABLE orders
            ALTER status DROP DEFAULT;


    -- 📚 ENUM (MySQL-specific for fixed sets of values)

        -- ✅ Creating a Table with ENUM
            CREATE TABLE payment_status (
                payment_id INT PRIMARY KEY,
                status ENUM('Pending', 'Completed', 'Failed') NOT NULL
            );


    -- 🔢 AUTO_INCREMENT (Auto-generating primary key values)

        -- ✅ Creating a Table with AUTO_INCREMENT
            CREATE TABLE users (
                user_id INT AUTO_INCREMENT PRIMARY KEY,
                username VARCHAR(50) UNIQUE
            );

        -- 🔄 Resetting AUTO_INCREMENT
            ALTER TABLE users AUTO_INCREMENT = 1000;


    -- 📐 GENERATED COLUMN (Virtual Columns)

        -- ✅ Creating a Virtual Column
            CREATE TABLE sales (
                price DECIMAL(10, 2),
                quantity INT,
                total DECIMAL(10, 2) GENERATED ALWAYS AS (price * quantity) STORED
            );



-- ===============================================================


-- ########################### --
-- ### 🔮 SQL OPERATORS 🔮 ###--
-- ########################### --

    -- 🌟 ARITHMETIC OPERATORS

        -- ✅ Perform mathematical calculations
            SELECT salary + bonus AS total_income FROM employees;   -- Addition +
            SELECT salary - deduction AS net_salary FROM employees; -- Subtraction -
            SELECT salary * 12 AS annual_salary FROM employees;     -- Multiplication *
            SELECT salary / 2 AS half_salary FROM employees;        -- Division /


    -- 🔗 CONCATENATION OPERATOR

        -- ✅ Combines two or more strings
            SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

        -- ✅ || - In Oracle


    -- 🔄 COMPARISON OPERATORS

        -- ✅ Compare values and return boolean (TRUE/FALSE)
            SELECT * FROM employees WHERE age = 30;        -- Equal to =
            SELECT * FROM employees WHERE age != 25;       -- Not equal to !=, <>


    -- RELATIONAL OPERATORS
        -- <, >, <=, >= 

        -- 
            SELECT * FROM employees WHERE salary > 50000;  -- Greater than <, >
            SELECT * FROM employees WHERE salary <= 70000; -- Less than or equal <=, >=

    -- ⚡ LOGICAL OPERATORS
        -- Combine multiple conditions

        -- ✅ AND: All conditions must be TRUE
            SELECT * FROM employees
            WHERE department = 'Sales' AND salary > 50000;

        -- ✅ OR: At least one condition must be TRUE
            SELECT * FROM employees
            WHERE department = 'IT' OR department = 'HR';

        -- ✅ NOT: Inverts the condition
            SELECT * FROM employees
            WHERE NOT salary < 40000;


    -- 🔐 SPECIAL OPERATORS

        -- IN: Match any value in a list
            SELECT * FROM employees
            WHERE department IN ('Sales', 'HR', 'IT');

        -- NOT IN: Exclude values from a list
            SELECT * FROM employees
            WHERE department NOT IN ('Marketing', 'Finance');

        -- BETWEEN: Match within a range (inclusive)
            SELECT * FROM employees
            WHERE salary BETWEEN 50000 AND 80000;

        -- NOT BETWEEN: Exclude a range
            SELECT * FROM employees
            WHERE salary NOT BETWEEN 30000 AND 60000;

        -- IS NULL: Check for NULL values
            SELECT * FROM employees
            WHERE commission IS NULL;

        -- IS NOT NULL: Check for non-NULL values
            SELECT * FROM employees
            WHERE commission IS NOT NULL;

    -- 🌍 PATTERN MATCHING OPERATORS

        -- LIKE: Match patterns using wildcards
        -- % : Matches any number of characters
        -- _ : Matches a single character
        -- [ ]: Matches any single character inside brackets (SQL Server only)
        -- [^ ]: Matches any character NOT inside brackets (SQL Server only)

        -- Find employees whose names start with 'A'
            SELECT * FROM employees
            WHERE name LIKE 'A%';

        -- Find employees with a three-letter name starting with 'J'
            SELECT * FROM employees
            WHERE name LIKE 'J__';

        -- Find phone numbers ending with '99'
            SELECT * FROM employees
            WHERE phone_number LIKE '%99';

        -- NOT LIKE: Exclude matching patterns
            SELECT * FROM employees
            WHERE name NOT LIKE 'A%';

    -- 📊 ADVANCED CONCEPTS

        -- REGEXP: Advanced pattern matching (MySQL-specific)
        -- Find names containing 'son' (case-insensitive)
            SELECT * FROM employees
            WHERE name REGEXP 'son';

        -- Find names starting with 'A' or 'B'
            SELECT * FROM employees
            WHERE name REGEXP '^(A|B)';

        -- CASE Operator: Conditional expressions
            SELECT name,
                CASE 
                    WHEN salary >= 80000 THEN 'High'
                    WHEN salary >= 50000 THEN 'Medium'
                    ELSE 'Low'
                END AS salary_bracket
            FROM employees;

        -- COALESCE: Return the first non-NULL value
            SELECT name, COALESCE(phone_number, 'N/A') AS contact_info
            FROM employees;

        -- IFNULL: Similar to COALESCE (MySQL-specific)
            SELECT name, IFNULL(commission, 0) AS commission
            FROM employees;

        -- INTERVAL: Date-based comparisons
            SELECT * FROM orders
            WHERE order_date >= NOW() - INTERVAL 30 DAY;

        -- XOR: Exclusive OR condition
            SELECT * FROM employees
            WHERE (department = 'IT') XOR (salary > 80000);


-- ===============================================================


-- ################### --
-- ### SQL CLAUSES ### --
-- ################### --

    -- 1. FROM       -- ✅ Identify tables
    -- 2. JOIN       -- ✅ Apply joins (if any)
    -- 3. WHERE      -- ✅ Filter rows
    -- 4. GROUP BY   -- ✅ Group data
    -- 5. HAVING     -- ✅ Filter grouped data
    -- 6. SELECT     -- ✅ Choose columns
    -- 7. DISTINCT   -- 
    -- 7. ORDER BY   -- ✅ Sort results
    -- 8. LIMIT      -- ✅ Restrict number of rows


    -- ✅ Correct Flow
        FROM table_name  
        JOIN another_table ON condition   -- (if applicable)
        WHERE condition  
        GROUP BY column_names  
        HAVING condition                  -- (if using aggregation)  
        ORDER BY column_names  
        LIMIT number;


    -- ✅ WHERE         --   FILTER RECORDS
        SELECT * FROM EMP
        WHERE < CONDITION > ;
 
    -- ✅ GROUP BY      --   COLUMN NAME / EXPRESSION  
        SELECT * FROM TABLE_NAME
        WHERE < CONDITION >
        GROUP BY <COLUMN_NAME>

    -- ✅ HAVING        --   FILTER GROUPS
        SELECT * FROM TABLE_NAME
        WHERE < CONDITION >
        GROUP BY <COLUMN_NAME>
        HAVING <>

    -- ✅ ORDER BY      --   ASCENDING / DESCENDING ORDER
        SELECT * FROM TABLE_NAME
        WHERE < CONDITION >
        GROUP BY <COLUMN_NAME>
        HAVING <>
        ORDER BY ASC / DESC

    -- ✅ WRITING FORMAT
        SELECT * FROM TABLE_NAME
        WHERE < CONDITION >
        GROUP BY <COLUMN_NAME>
        HAVING <>
        ORDER BY ASC / DESC

    -- ✅ EXECUTION FLOW
        --> FROM --> WHERE --> GROUP BY --> ORDER BY --> SELECT
            

-- ===============================================================


-- ##################### --
-- ### SQL FUNCTIONS ### --
-- ##################### --

    -- SINGLE ROW FUNCTIONS
        -- LENGTH('STRING')
            SELECT LENGTH('BUTTERFLY') FROM DUAL;
            SELECT LENGTH(ENAME) FROM EMP;

        -- CONCAT('STRING 1', 'STRING 2')
            SELECT CONCAT('MR.', ENAME) FROM EMP;

        -- UPPER('STRING')
            SELECT UPPER(ENAME) FROM EMP;

        -- LOWER('STRING')
            SELECT LOWER(ENAME) FROM EMP;

        -- INITCAP('STRING')
            SELECT INITCAP(ENAME) FROM EMP;

        -- REVERSE('STRING')
            SELECT REVERSE(ENAME) FROM EMP;

        -- SUBSTR('ORIG STRING', POSITION [, COUNT])
            SELECT SUBSTR(ENAME, 2, 2) FROM EMP;
            SELECT SUBSTR('BUTTERFLY', 1, 1) FROM DUAL;
            SELECT * FROM EMP
            WHERE INSTR(ENAME, 'L', 1)>0;

        -- INSTR('ORIG STRING', 'STRING', POSITION [, OCCURENCE])
            SELECT INSTR('MALAYALAM', 'A', 1) FROM DUAL;
            SELECT INSTR('MALAYALAM', 'L', 4, 2) FROM DUAL;

        -- REPLACE('ORIG STRING', 'REPLACE STR', 'NEW STR')
            SELECT REPLACE('BUTTERFLY', 'B', 'D') FROM DUAL;

        -- MOD(DIVIDEND, DIVISOR)
            SELECT MOD(12, 5) FROM DUAL; -- 2
            SELECT MOD(-12, 5) FROM DUAL; -- -2
            SELECT MOD(-12, -5) FROM DUAL; -- -2 

        -- TRUNC(NUMBER [, SCALE])
            SELECT TRUNC(4.8) FROM DUAL;

        -- ROUND(NUMBER [, SCALE])
            SELECT ROUND(1234.5432) FROM DUAL;      -- 1234.6
            SELECT ROUND(1234.5432, 0) FROM DUAL;   -- 1235

            SELECT ROUND(1234.5432, 1) FROM DUAL;   -- 1234.5
            SELECT ROUND(1234.5432, 2) FROM DUAL;   -- 1234.54
            SELECT ROUND(1234.5432, 4) FROM DUAL;   -- 1234.5432

            SELECT ROUND(1234.5432, -1) FROM DUAL;  -- 1230
            SELECT ROUND(1234.5432, -2) FROM DUAL;  -- 1200
            SELECT ROUND(1234.5432, -4) FROM DUAL;  -- 0
            
        -- MONTHS_BETWEEN(DATE1, DATE2)
            SELECT MONTHS_BETWEEN('21-MAR-2024', '21-MAR-2025') FROM DUAL; -- -12
            SELECT MONTHS_BETWEEN('21-MAR-2026', '21-MAR-2025') FROM DUAL; -- 12

        -- ABS(NUMBER)
            SELECT ABS(MONTHS_BETWEEN('21-MAR-2024', '21-MAR-2025')) FROM DUAL;

        -- LAST_DAY(DATE)
            SELECT LAST_DAY('21-MAR-2024') FROM DUAL;

        -- TO_CHAR(DATE, FORMAT)
            -- YEAR | YYYY | YY
            -- MONTH | MON | MM
            -- DAY | DY 
            -- DD | D
            -- HH24 | HH12 | MI | SS | HH12:MI:SS
            -- DD-MM-YY | MM-DD-YYYY
            SELECT TO_CHAR(TO_DATE('05-NOV-2003', 'DD-MM-YY'), 'DAY') FROM DUAL;
            SELECT TO_CHAR(HIREDATE, 'DAY') FROM EMP;
            SELECT TO_CHAR(, 'DAY') FROM DUAL;

        -- NVL(VALUE/NULL, 0) - NULL VALUE LOGIC
            SELECT SAL, COMM, SAL + NVL(COMM, 0) FROM EMP;

        -- LTRIM()
            SELECT LENGTH('  BUTTERFLY  '), LTRIM('  BUTTERFLY  '), LENGTH(LTRIM('  BUTTERFLY  ')) 
            FROM DUAL;

        -- RTRIM()
            SELECT LENGTH('  BUTTERFLY  '), RTRIM('  BUTTERFLY  '), LENGTH(RTRIM('  BUTTERFLY  ')) 
            FROM DUAL;

        -- LPAD()
            SELECT LPAD('BUTTERFLY', 12, '}') FROM DUAL;

        -- RPAD()
            SELECT RPAD('BUTTERFLY', 12, '}') FROM DUAL;
            

    -- MULTI ROW FUNCTIONS
        -- SUM()
            SELECT SUM(SAL) FROM EMP;

        -- MIN()
            SELECT MIN(SAL) FROM EMP;

        -- MAX()
            SELECT MAX(SAL) FROM EMP;

        -- AVG()
            SELECT AVG(SAL) FROM EMP;

        -- COUNT()
            SELECT COUNT(*) FROM EMP;
            SELECT COUNT(COMM) FROM EMP;


-- ===============================================================


-- ###################### --
-- ### SQL SUBQUERIES ### --
-- ###################### --

    -- ✅ A QUERY INSIDE ANOTHER QUERY

        -- CASE - 1
            -- WHENEVER DATA IS UNKNOWN 

        -- CASE - 2
            -- WHENEVER DATA TO BE SELECTED AND CONDITION IS PRESENT IN ANOTHER TABLE

    -- ✅ TYPES OF SUBQUERIES

        -- SINGLE ROW SUBQUERY    -  USING  '='
        SELECT * FROM EMP 
        WHERE SAL = (SELECT MAX(SAL) FROM EMP);

        -- MULTI ROW SUBQUERY     -  USING  'IN'
        SELECT * FROM EMP 
        WHERE SAL IN (SELECT MAX(SAL), MIN(SAL) FROM EMP); 

        -- CORRELATED SUBQUERY
            -- SUBQUERY DEPENDS ON THE OUTER QUERY
            SELECT E1.*
            FROM EMP E1
            WHERE SAL > (SELECT AVG(SAL) FROM EMP E2 WHERE E1.DEPTNO = E2.DEPTNO);

        -- SCALAR SUBQUERY
            -- RETURNS A SINGLE VALUE
            SELECT ENAME, (SELECT DNAME FROM DEPT D WHERE D.DEPTNO = E.DEPTNO) AS DEPARTMENT
            FROM EMP E;

    -- ✅ SUBQUERY OPERATORS  

        -- ALL: COMPARE VALUE AGAINST ALL VALUES RETURNED BY THE SUBQUERY
        SELECT * FROM EMP
        WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

        -- ANY: COMPARE VALUE AGAINST ANY VALUE RETURNED BY THE SUBQUERY
        SELECT * FROM EMP
        WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

        -- EXISTS: CHECK IF THE SUBQUERY RETURNS ANY ROWS
        SELECT * FROM EMP
        WHERE EXISTS (SELECT 1 FROM DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO);

        -- NOT EXISTS: CHECK IF THE SUBQUERY RETURNS NO ROWS
        SELECT * FROM EMP
        WHERE NOT EXISTS (SELECT 1 FROM DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO);

    -- ✅ NESTED SUBQUERY
        -- A SUBQUERY INSIDE ANOTHER SUBQUERY
        SELECT * FROM EMP 
        WHERE SAL = (SELECT MAX(SAL) FROM EMP 
                    WHERE SAL < (SELECT MAX(SAL) FROM EMP
                                WHERE SAL < (SELECT MAX(SAL) FROM EMP)));

    -- ✅ RELATION BETWEEN TWO COLUMNS

        -- FIND EMPLOYEE'S MANAGER
        SELECT * FROM EMP
        WHERE EMPNO = (SELECT MGR FROM EMP WHERE ENAME = 'MILLER');

        -- FIND EMPLOYEES WHO REPORT TO A PRESIDENT
        SELECT * FROM EMP
        WHERE MGR IN (SELECT EMPNO FROM EMP WHERE JOB = 'PRESIDENT');

        -- CHAINED RELATIONSHIPS
        SELECT * FROM EMP
        WHERE MGR IN (SELECT EMPNO FROM EMP
                        WHERE MGR IN (SELECT EMPNO FROM EMP
                                        WHERE JOB = 'PRESIDENT'));

    -- ✅ SUBQUERY IN FROM CLAUSE (DERIVED TABLE)
        -- TEMPORARY TABLE CREATED FROM A SUBQUERY
        SELECT E.ENAME, TEMP.MAX_SAL
        FROM EMP E
        JOIN (SELECT MAX(SAL) AS MAX_SAL FROM EMP) TEMP
        ON E.SAL = TEMP.MAX_SAL;

    -- ✅ COMMON TABLE EXPRESSIONS (CTE)
        -- IMPROVES READABILITY AND ORGANIZATION
        WITH HIGH_SAL AS (
            SELECT * FROM EMP WHERE SAL > 3000
        )
        SELECT * FROM HIGH_SAL;

    -- ✅ SUBQUERY WITH UPDATE
        -- UPDATE USING DATA FROM ANOTHER TABLE
        UPDATE EMP
        SET SAL = SAL * 1.10
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

    -- ✅ SUBQUERY WITH DELETE
        -- DELETE RECORDS BASED ON A SUBQUERY
        DELETE FROM EMP
        WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK');


-- ===============================================================


-- ################################## --
-- ### SQL CORRELATED SUB-QUERIES ### --
-- ################################## --

    -- ✅ What is a Correlated Subquery?
    -- A correlated subquery is a subquery that uses values from the outer query.
    -- It is executed repeatedly for each row processed by the outer query.

    -- ✅ Basic Example:
    -- Find employees whose salary is above the average salary in their department.

        SELECT e1.*
        FROM employees e1
        WHERE salary > (
            SELECT AVG(e2.salary)
            FROM employees e2
            WHERE e1.department_id = e2.department_id
        );

    -- ✅ How Correlated Subqueries Work:
    -- 1. The outer query processes a row.
    -- 2. For each row, the inner subquery runs using values from that row.
    -- 3. The results of the subquery are used to filter the outer query.

    -- ✅ Finding the 2nd and Last Highest Salary Using Correlated Subqueries:

    -- 2nd Highest Salary:
        SELECT e1.*
        FROM employees e1
        WHERE 1 = (
            SELECT COUNT(DISTINCT e2.salary)
            FROM employees e2
            WHERE e2.salary > e1.salary
        );

    -- Last (Minimum) Salary:
        SELECT e1.*
        FROM employees e1
        WHERE (SELECT COUNT(*)
            FROM employees e2
            WHERE e2.salary < e1.salary) = 0;

    -- ✅ Using Correlated Subqueries with EXISTS:
    -- Find employees who have at least one subordinate.

        SELECT e1.*
        FROM employees e1
        WHERE EXISTS (
            SELECT 1
            FROM employees e2
            WHERE e1.employee_id = e2.manager_id
        );

    -- ✅ NOT EXISTS Usage:
    -- Find employees who do not manage any other employees.

        SELECT e1.*
        FROM employees e1
        WHERE NOT EXISTS (
            SELECT 1
            FROM employees e2
            WHERE e1.employee_id = e2.manager_id
        );

    -- ✅ Correlated Subqueries in UPDATE Statements:
    -- Update employee salaries to 10% more than the average salary of their department.

        UPDATE employees e1
        SET salary = salary * 1.10
        WHERE salary < (
            SELECT AVG(e2.salary)
            FROM employees e2
            WHERE e1.department_id = e2.department_id
        );

    -- ✅ Correlated Subqueries in DELETE Statements:
    -- Delete employees who have the lowest salary in their department.

        DELETE FROM employees e1
        WHERE salary = (
            SELECT MIN(e2.salary)
            FROM employees e2
            WHERE e1.department_id = e2.department_id
        );

    -- ✅ Advanced Correlated Subquery Example:
    -- Find the top 3 salaries in each department.

        SELECT e1.*
        FROM employees e1
        WHERE 3 > (
            SELECT COUNT(DISTINCT e2.salary)
            FROM employees e2
            WHERE e2.salary > e1.salary
            AND e1.department_id = e2.department_id
        );

    -- ✅ Performance Considerations:
    -- 1. Correlated subqueries are less efficient than JOINs due to repeated execution.
    -- 2. Consider using derived tables (subqueries in the FROM clause) for optimization.
    -- 3. Use indexes on columns referenced in the subquery to improve performance.

    -- ✅ Comparing Correlated vs. Non-Correlated Subqueries:
    -- Non-Correlated: Executes once and passes the result to the outer query.
    -- Correlated: Executes repeatedly for each row in the outer query.

    -- Example Non-Correlated Subquery:
        SELECT *
        FROM employees
        WHERE salary > (
            SELECT AVG(salary)
            FROM employees
        );


-- ===============================================================


-- ################# --
-- ### SQL JOINS ### --
-- ################# --

    -- ✅ CARTESIAN JOIN  / CROSS JOIN: combining each row from the first table with every row from the second table
        SELECT e.LastName, d.DeptName
        FROM Emp e
        CROSS JOIN Dept d;


    -- ✅ INNER JOIN / EQUI JOIN: Retrieves records with matching values in both tables.
        SELECT e.LastName, e.DeptID, d.DeptName
        FROM Emp e
        INNER JOIN Dept d ON e.DeptID = d.DeptID;


    -- ✅ OUTER JOIN
        -- LEFT OUTER JOIN: Retrieves all records from the left table and matched records from the right table.
            SELECT e.LastName, e.DeptID, d.DeptName
            FROM Emp e
            LEFT JOIN Dept d ON e.DeptID = d.DeptID;


        -- RIGHT OUTER JOIN: Retrieves all records from the right table and matched records from the left table.
            SELECT e.LastName, e.DeptID, d.DeptName
            FROM Emp e
            RIGHT JOIN Dept d ON e.DeptID = d.DeptID;


        -- FULL OUTER JOIN: Retrieves records when there is a match in either left or right table.
            SELECT e.LastName, e.DeptID, d.DeptName
            FROM Emp e
            LEFT JOIN Dept d ON e.DeptID = d.DeptID
            UNION
            SELECT e.LastName, e.DeptID, d.DeptName
            FROM Emp e
            RIGHT JOIN Dept d ON e.DeptID = d.DeptID;


    -- ✅ SELF JOIN: Joins a table to itself to compare rows within the same table.
        SELECT e1.LastName AS Emp1, e2.LastName AS Emp2, e1.DeptID
        FROM Emp e1
        INNER JOIN Emp e2 ON e1.DeptID = e2.DeptID
        WHERE e1.LastName < e2.LastName;


    -- ✅ NATURAL JOIN: Automatically joins tables based on columns with the same name and data type in both tables.
        SELECT *
        FROM table_name_1
        NATURAL JOIN table_name_2;


    -- ✅ NON EQUI JOIN : Joins tables without using the equality operator (=)—commonly using <, >, <=, >=, or BETWEEN.
        SELECT e.emp_id, e.emp_name, s.salary_range
        FROM employees e
        JOIN salary_brackets s
        ON e.salary BETWEEN s.min_salary AND s.max_salary;


-- ===============================================================


-- #################### --
-- ### PSEUDOCOLUMN ### --
-- #################### --

    -- COLUMN_VALUE

    -- OBJECT_ID

    -- OBJECT_VALUE

    -- ORA_ROWSCN

    -- ROWID

    -- ROWNUM

    -- XMLDATA


-- ========================================================================


-- ===============================================
-- ##################  INDEX  ####################
-- ===============================================

    -- Significantly enhance query performance by allowing rapid data retrieval.
    -- They function as lookup tables, enabling the database engine to locate data without scanning the entire table.


    -- ✅ Types of Indexes in MySQL:
		-- Indexing Techniques
		-- ├── Based on Attribute Type
		-- │   ├── Primary Index
		-- │   ├── Secondary Index
		-- │   ├── Unique Index
		-- │   └── Composite Index
		-- │
		-- ├── Based on Storage Method
		-- │   ├── Clustered Index
		-- │   └── Non-Clustered Index
		-- │
		-- ├── Based on Data Structure
		-- │   ├── B-Tree
		-- │   ├── B+ Tree
		-- │   ├── Hash Index
		-- │   ├── Bitmap Index
		-- │   ├── R-Tree (Spatial Indexing)
		-- │   ├── GiST (Generalized Search Tree)
		-- │   └── Full-Text Index
		-- │
		-- └── Based on Levels
        --     	├── Single-Level Index - Dense Index
        --  	└── Multi-Level Index - Sparse Index


    -- 📋 Based on Attribute Type
        -- ✅ Primary Index
            -- Definition: 
                -- Automatically created on the primary key of a table.
                -- This is a clustered index in MySQL's InnoDB storage engine.
            -- Properties:
                -- Unique for each row.
                -- Used to identify rows.
            -- Mechanics:
                -- MySQL organizes InnoDB tables as a B+ Tree.
                -- Leaf nodes contain actual data.
                -- Data is physically stored in order of the primary key.
            -- Performance Tips:
                -- Use for frequently queried columns.
                -- Avoid using large, complex data types (e.g., TEXT or BLOB).
                -- Use AUTO_INCREMENT for optimized inserts.
            -- Example:
                CREATE TABLE employees (
                    emp_id INT PRIMARY KEY,
                    name VARCHAR(50)
                );

        -- ✅ Secondary Index
            -- Definition: 
                -- Created on non-primary attributes for faster lookups.
            -- Properties:
                -- Does not enforce uniqueness.
                -- Used for faster search on columns that are not part of the primary key.
            -- Mechanics:
                -- Secondary indexes store a copy of the indexed column.
                -- They point to the primary key value (for row lookup).
            -- Performance Tips:
                -- Create secondary indexes on frequently searched columns.
                -- Avoid indexing columns with low selectivity (e.g., gender with only two values).
            -- Example:
                CREATE INDEX idx_name ON employees(name);

        -- ✅ Unique Index
            -- Definition: 
                -- Enforces the uniqueness of the indexed column.
            -- Properties:
                -- Ensures no duplicate values in the indexed column.
            -- Mechanics:
                -- Works similarly to other indexes but enforces uniqueness.
            -- Performance Tips:
                -- Use for columns requiring unique values (e.g., email, username).
                -- Ensure you only index unique columns to avoid duplicate key errors.
            -- Example:
                CREATE UNIQUE INDEX idx_email ON employees(email);

        -- ✅ Composite Index
            -- Definition: 
                -- Index created on multiple columns (also called a multi-column index).
            -- Properties:
                -- Useful when queries involve multiple columns.
                -- Search follows left-to-right order.
            -- Mechanics:
                -- Stores column values in left-to-right order.
                -- Can be used by queries referencing the leftmost columns.
            -- Performance Tips:
                -- Order columns based on query patterns (most restrictive first).
                -- Use composite indexes instead of multiple single indexes to reduce overhead.
            -- Example:
               CREATE INDEX idx_name_age ON employees(name, age);


    -- 📦 Based on Storage Method
        -- ✅ Clustered Index
            -- Definition: 
                -- Physically sorts rows in the database according to the index.
                -- The primary key automatically becomes a clustered index.
            -- Properties:
                -- Only one clustered index per table.
                -- Faster for range queries due to physical ordering.
                -- InnoDB (MySQL) uses B+ Trees for clustered indexes.
            -- Mechanics:
                -- Leaf nodes of the index store actual row data.
            -- Performance Tips:
                -- Ideal for range queries.
            -- Example:
               ALTER TABLE employees ADD PRIMARY KEY (emp_id);

        -- ✅ Non-Clustered Index
            -- Definition: 
                -- A separate structure pointing to actual rows (secondary index).
                -- Logical ordering of rows. Points to actual records.
            -- Properties:
                -- Can have multiple non-clustered indexes.
                -- Requires extra lookup to fetch rows. 
            -- Mechanics:
                -- Stores a copy of the indexed data and a pointer to the actual row.
                -- Allows multiple non-clustered indexes.
            -- Performance Tips:
                -- Use for frequent lookups but infrequent updates.
                -- Avoid over-indexing to prevent write performance degradation.
            -- Example:
               CREATE INDEX idx_name ON employees(name);


    -- 📊 Based on Attribute Type
        -- ✅ B-Tree Index
            -- Definition: 
                -- A B-Tree (Balanced Tree) index is a self-balancing tree data structure 
                -- that maintains sorted data and allows searches, sequential access,
                -- insertions, and deletions in logarithmic time.
            -- Properties:
                -- An m-way tree that self-balances itself is called a "B-tree." 
                -- Each node can have a maximum of m child nodes. 
                -- B-tree is an example of multilevel indexing.
                -- Ideal for equality and range queries.
                -- Data Location - Stored in internal & leaf nodes
                -- Range Query - Slow (depth traversal)	
                -- Used in MyISAM storage engine in MySQL.
                -- Usage - File systems	
            -- Order: Keeps data in sorted order, making it ideal for range queries.
            -- Good for: 
                -- Equality (=) 
                -- Range queries (>, <, BETWEEN)
                -- Prefix matches (LIKE 'abc%') 
            -- Not ideal for:
                -- Values with low cardinality (few distinct values). 
                -- Queries using %abc (wildcard at the beginning).
            -- Supported By	InnoDB, MyISAM
            -- Mechanics:
                -- Balanced tree structure: Each node points to others.
                -- Maintains logarithmic search times (O(log n)).
                -- MySQL traverses from the root to the leaf node, reducing search time to O(log n)
            -- Performance Tips:
                -- Best for sorted or range queries.
                -- Avoid indexing columns with low cardinality (e.g., gender).
            -- Example: Names, Dates, Ranges
                CREATE INDEX idx_salary ON employees(salary); 

        -- ✅ B-Tree Index
            -- 
        

        -- ✅ B+ Tree Index
            -- Definition: 
                -- A modified B-Tree where leaf nodes are linked for faster range queries.
            -- Properties:
                -- Stores keys in internal nodes and data in leaf nodes.
                -- Data Location - Stored only in leaf nodes
                -- Range Query - Fast (linked leaf nodes)
                -- Used in InnoDB storage engine in MySQL.
                -- Usage - Database indexing
            -- Order: Keeps data in sorted order, making it ideal for range queries.
            -- Good for: 
                -- Equality (=) 
                -- Range queries (>, <, BETWEEN)
                -- Prefix matches (LIKE 'abc%')
            -- Not ideal for:
                -- Values with low cardinality (few distinct values). 
                -- Queries using %abc (wildcard at the beginning).
            -- Supported By	InnoDB, MyISAM
            -- Mechanics:
                -- Leaf nodes contain pointers to next and previous nodes.
                -- Faster for range and sorting operations.
            -- Example:
                CREATE INDEX idx_hire_date ON employees(hire_date); 

        -- ✅ Hash Index
            -- Definition: 
                -- Uses a hash function to map keys to buckets.
            -- Properties:
                -- Fast for exact matches.
                -- Inefficient for range queries.
                -- Used in MEMORY storage engine in MySQL.
            -- Good for:
                -- Exact equality checks (=).

            -- Not ideal for:
                -- Range queries (<, >, BETWEEN).
                -- Sorting (since hash tables don’t maintain order).

            -- Supported By MEMORY Engine Only
            -- Mechanics:
                -- Maps data via a hash function.
                -- Provides constant-time lookups.
            -- Performance Tips:
                -- Do not store data in a sorted order, limiting their use cases.
                -- Best for exact matches (no range queries).
                -- Use for read-heavy workloads in MEMORY tables.
            -- Example: Unique IDs, Caches
                CREATE TABLE employees (
                    emp_id INT,
                    name VARCHAR(50),
                    UNIQUE HASH (emp_id)
                );

                CREATE INDEX idx_employee_id ON employees (id) USING HASH;

        -- ✅ Bitmap Index
            -- Definition: 
                -- Stores bitmap vectors for categorical data.
            -- Properties:
                -- Efficient for low-cardinality data (few unique values).
                -- Used in data warehouses and OLAP systems.
                -- Eg: Male: 1 0 1, Female: 0 1 0
            -- Utilize bit arrays to represent the existence of a value, allowing for efficient logical operations.

            -- Note:
                -- MySQL does not natively support bitmap indexes.
                -- Found in Oracle or PostgreSQL.

            -- Good for:
                -- Low-cardinality values (few unique values).

            -- Not ideal for:
                -- Range queries (<, >, BETWEEN).
            -- Mechanics:
                -- 
            -- Performance Tips:
                -- 
            -- Example: Gender, Status Flags
               CREATE INDEX idx_name_age ON employees(name, age);

        -- ✅ R-Tree (Spatial Index)
            -- Definition: 
                -- Specialized index for multidimensional data (e.g., geospatial).
            -- Properties:
                -- Usage - Geographic databases (PostGIS in PostgreSQL).
            -- Mechanics:
                -- 
            -- Performance Tips:
                -- 
            -- Example:
               CREATE SPATIAL INDEX idx_location ON maps(location);

        -- ✅ GiST (Generalized Search Tree)
            -- Definition: 
                -- Flexible tree structure for custom data types.
            -- Usage: 
                -- PostgreSQL supports this for complex objects (e.g., text search).
            -- Mechanics:
                -- 
            -- Performance Tips:
                -- 

        -- ✅ Full-Text Index
            -- Definition: Index for text-based searches (e.g., finding words in paragraphs).
            -- Properties:
            --     Supports natural language queries.
            --     Useful for blog or article searching.
            -- Mechanics:
                -- Uses an inverted index for fast word matching.
                -- Supports BOOLEAN and NATURAL LANGUAGE search modes.
            -- Performance Tips:
                -- Use for text search (e.g., blogs, product descriptions).
                -- Regularly rebuild indexes for optimal performance.
            -- Example:
                CREATE TABLE articles (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(255),
                    body TEXT,
                    FULLTEXT (title, body)
                );
                CREATE FULLTEXT INDEX idx_text ON articles(content);


    -- 📦 Based on Storage Method
        -- ✅ Single-Level Index
            -- Definition: 
                -- Basic index where a single layer maps records.
            -- Usage: Suitable for small datasets.
            -- Mechanics:
                -- 
            -- Performance Tips:
                -- 
            -- Example:
               ALTER TABLE employees ADD PRIMARY KEY (emp_id);

        -- ✅ Multi-Level Index
            -- Definition: 
                -- Hierarchical index with multiple levels for faster lookups.
            -- Usage: Handles large datasets efficiently.
            -- Mechanics:
                -- Organizes data in hierarchical levels (like multi-level B+ trees).
            -- Performance Tips:
                -- Automatically applied in MySQL for large tables.
                -- Ensure proper buffer pool configuration for performance.
            -- Example:
               CREATE INDEX idx_name ON employees(name);


    -- Creating and Managing Indexes in MySQL:

        -- Example during table creation
            CREATE TABLE employees (
                id INT PRIMARY KEY,
                name VARCHAR(100),
                department_id INT,
                INDEX idx_department_id (department_id)
            );

        -- Adding an index to an existing table:
            CREATE INDEX idx_name ON employees (name);
        
        -- Dropping Indexes
            DROP INDEX idx_name ON employees;

    -- Index Optimization and Best Practices:

        -- Avoid Over-Indexing:
            -- While indexes speed up read operations, they can slow down write operations 
            -- (e.g., INSERT, UPDATE, DELETE) due to the overhead of maintaining the index.


        -- Use Composite Indexes Wisely:
            -- Composite indexes (indexes on multiple columns) can optimize queries that filter on those columns.
            -- The order of columns in a composite index matters; it should match the order of columns in the query's WHERE clause.


-- ========================================================================


-- #################### --
-- ###### PL SQL ###### --
-- #################### --

    -- TRIGGERS
    -- FUNCTIONS
    -- CURSOR
    -- PROCEDURES


-- ========================================================================


-- =================================================================
-- ##################  📦BACKUP AND ⏳RECOVERY  ####################
-- =================================================================

    -- Essential for maintaining data integrity and availability in database management.
    -- They safeguard against data loss, corruption, and system failures, ensuring business continuity.


    -- 📦 BACKUP

        -- ✅ Full Backup

            -- Definition: A complete copy of the entire database at a specific point in time.
            -- A complete copy of the entire database, including all tables, indexes, triggers, and other database objects.

            -- 📘 How it Works
                -- Snapshot Creation: MySQL locks tables (if required) and captures a consistent snapshot.
                -- Data Extraction: All rows from every table are read and stored in a dump or binary file.
                -- Index Backup: Any secondary indexes (e.g., B-Tree, Hash) are backed up along with data.
                -- Transaction Logs: If using InnoDB, the redo logs and binary logs ensure consistency across transactions.
                -- Storage: Backup is stored on the file system or external storage.

            -- Advantages: Simplifies restoration since all data is in a single backup set.
            -- Disadvantages: Time-consuming and requires substantial storage space.

            mysqldump -u [username] -p[password] --all-databases > full_backup.sql
            mysqlbackup --user=root --password --backup-dir=/backups/full_backup --backup

            -- Example:
                -- Creating a Full Backup Using mysqldump
                    mysqldump -u root -p company_db > /backups/full_backup.sql 

                -- Restoring the Full Backup
                    mysql -u root -p company_db < /backups/full_backup.sql 


        -- ✅ Incremental Backup

            -- Definition: Captures only the data that has changed since the last backup (full or incremental).

            -- 📘 How it Works:
                -- Baseline Backup: First, a full backup is created as a baseline.
                -- Change Tracking: MySQL uses binary logs or changed pages to track modified records.
                -- Incremental Capture: Each incremental backup records changes since the last backup.
                -- Chained Backups: Restoring requires the last full backup + all incremental backups in sequence.

            -- Advantages: Faster and requires less storage compared to full backups.
            -- Disadvantages: Restoration can be complex, needing the last full backup and all subsequent incremental backups.

            mysqlbackup --user=root --password --incremental --incremental-base=history:last_backup --backup-dir=/backups/inc_backup --backup
            mysqldump --single-transaction --flush-logs --master-data=2 --all-databases > full_backup.sql

            mysqladmin -u [username] -p[password] flush-logs
            cp /var/log/mysql/mysql-bin.[number] /backup-directory/

            -- Example:
                -- Enable Binary Logging
                    -- Check if binary logging is enabled
                        SHOW VARIABLES LIKE 'log_bin'; 
                    -- If it's not enabled, edit your my.cnf or my.ini
                        [mysqld]
                        log-bin=mysql-bin
                        server-id=1
                    -- Restart MySQL
                        sudo systemctl restart mysql

                -- Take a Full Backup and Note Log Position
                    mysqldump -u root -p --flush-logs --all-databases --master-data=2 > /backups/full_backup.sql

                -- Create Incremental Backups Using Binary Logs
                    -- Find the current binary log
                        SHOW BINARY LOGS;
                    -- Back up only recent changes
                        mysqlbinlog /var/lib/mysql/mysql-bin.000002 > /backups/incremental_backup.sql

                -- Restoring from Full + Incremental Backup
                    -- Restore the Full Backup
                        mysql -u root -p < /backups/full_backup.sql
                    -- Apply each Incremental Backup in sequence
                        mysql -u root -p < /backups/incremental_backup.sql


        -- ✅ Differential Backup

            -- Definition: A Differential Backup saves all changes since the last full backup. 
            -- Each differential backup grows in size over time but accelerates the recovery process compared to incremental backups.

            -- 📘 How it Works:
                -- Baseline Backup: Perform a full backup as the base.
                -- Change Capture: MySQL tracks modified rows/pages since the last full backup.
                -- Partial Dump: Each differential backup stores cumulative changes since the full backup.
                -- Recovery: Restoring requires the last full backup + the latest differential backup.

            -- Advantages: Simpler restoration than incremental backups, requiring only the last full backup and the latest differential backup.
            -- Disadvantages: Over time, differential backups can become large, approaching the size of a full backup.

            -- Note: MySQL doesn't natively support differential backups, but similar functionality can be achieved using third-party tools or custom scripts.

            mysqlbackup --user=root --password --incremental --incremental-base=history:full_backup --backup-dir=/backups/diff_backup --backup
            mysqldump -u root -p --databases mydb --where="last_updated > '2024-03-01'" > differential_backup.sql

            -- Example:
                -- Take a Full Backup
                    mysqldump -u root -p company_db > /backups/full_backup.sql

                -- Track Changes Using Binary Logs or Timestamps
                    mysqldump -u root -p company_db --where="last_update > '2024-03-01'" > /backups/differential_backup.sql
                
                -- Restoring from Full + Differential Backup
                    -- Restore the Full Backup
                        mysql -u root -p < /backups/full_backup.sql

                    -- Apply the Latest Differential Backup
                        mysql -u root -p < /backups/differential_backup.sql


    -- ⏳ RECOVERY

        -- ✅ Point-in-Time Recovery (PITR)

            -- Description: Restores the database to a specific moment before the data loss or corruption occurred.
            -- Method: Utilizes full backups in conjunction with binary logs to replay transactions up to the desired point.

            mysqlbinlog --stop-datetime="2025-03-10 12:00:00" /var/log/mysql/mysql-bin.[number] | mysql -u [username] -p[password]


        -- ✅ Transaction Log Recovery

            -- Description: Recovers committed transactions from transaction logs after a crash or corruption.
            -- Method: Applies redo logs to ensure all committed transactions are reflected in the database.

            -- Note: MySQL's InnoDB storage engine automatically handles transaction log recovery during the startup process.


        -- ✅ Tablespace Recovery

            -- Description: Restores specific tablespaces or individual tables without affecting the entire database.
            -- Method: Employs backups of individual tablespaces and applies relevant logs to synchronize them.

            ALTER TABLE [table_name] DISCARD TABLESPACE;
            -- Restore the tablespace file from backup
            ALTER TABLE [table_name] IMPORT TABLESPACE;

        
        -- SHADOW TABLE


        -- 🔧 Backup and Recovery Tools and Utilities
            -- MySQL Enterprise Backup
                -- Features: Provides hot backups for InnoDB tables, incremental backups, and point-in-time recovery.
                mysqlbackup --backup-dir=/backup-directory/ --user=[username] --password=[password] backup

            -- mysqldump
                -- Features: Logical backup tool that exports databases into SQL format. 
                -- Suitable for smaller databases or specific tables.
                mysqldump -u [username] -p[password] [database_name] > backup.sql

            -- Percona XtraBackup
                -- Features: Open-source tool offering hot backups for InnoDB and XtraDB databases without locking. 
                -- Supports full and incremental backups.
                xtrabackup --backup --target-dir=/backup-directory/

            -- mysqlbinlog
                -- Features: Utility to process binary log files, useful for point-in-time recovery and auditing.
                mysqlbinlog /var/log/mysql/mysql-bin.[number] > backup.sql

            -- Third-Party Backup Solutions
                --  Features: Tools like Veeam, Acronis, and NetBackup offer comprehensive backup solutions with support for 
                -- MySQL databases, providing features like scheduling, compression, encryption, and centralized management.

    
    -- 📌 Advanced MySQL Backup Strategies

        -- Automated Backup Scheduling: Use cron jobs for regular backups:

            # Schedule a daily full backup at 2 AM
            0 2 * * * mysqldump -u root -p company_db > /backups/full_backup.sql

            -- Point-in-Time Recovery: Use binary logs for fine-grained data recovery:
            mysqlbinlog --start-datetime="2024-03-05 00:00:00" --stop-datetime="2024-03-05 23:59:59" /var/lib/mysql/mysql-bin.000003 > /backups/point_in_time.sql

            -- Compression and Encryption: Secure backups using gzip and OpenSSL:
            mysqldump -u root -p company_db | gzip | openssl enc -aes-256-cbc -out /backups/secure_backup.sql.gz


    -- Log based shadow paging check point

    -- Best Practices for Backup and Recovery
        -- Regular Testing: Periodically test backups to ensure data integrity and successful restoration processes.
        -- Offsite Storage: Maintain copies of backups in offsite or cloud storage to protect against local disasters.
        -- Automation: Utilize automated backup solutions to reduce human error and ensure consistency.
        -- Monitoring: Implement monitoring and alerting for backup processes to promptly address failures or issues.
        -- Documentation: Keep detailed records of backup configurations, schedules, and recovery procedures to facilitate quick response during emergencies.


-- ========================================================================


-- =======================================================================
-- ##################  🛢️STORAGE ENGINE CAPABILITIES  ####################
-- =======================================================================

    -- 🔍 1. InnoDB (Default Storage Engine)
        -- Designed for OLTP workloads, supports ACID


















-- ===============================================
-- ##################  EXPERT  ###################
-- ===============================================

    -- AUTO_INCREMENT with Custom Start Value
        ALTER TABLE staff AUTO_INCREMENT = 1000; -- Start at 1000


    -- Virtual (Generated) Columns
        ALTER TABLE staff
        ADD full_name_virtual VARCHAR(255) AS (CONCAT(first_name, ' ', last_name)) VIRTUAL;

    -- Handling Foreign Key Constraints
        ALTER TABLE staff
        ADD CONSTRAINT fk_department
        FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

    -- Using IF EXISTS and IF NOT EXISTS for Safety
        DROP TABLE IF EXISTS staff; -- Drops only if the table exists

        CREATE TABLE IF NOT EXISTS staff (...); -- Creates only if missing

    -- Partitioning Large Tables
        CREATE TABLE sales (
            id INT NOT NULL,
            sale_date DATE NOT NULL,
            amount DECIMAL(10, 2),
            PRIMARY KEY (id, sale_date)
        )
        PARTITION BY RANGE (YEAR(sale_date)) (
            PARTITION p0 VALUES LESS THAN (2022),
            PARTITION p1 VALUES LESS THAN (2023),
            PARTITION p2 VALUES LESS THAN MAXVALUE
        );

    -- Check Table Structure and Metadata
        DESCRIBE staff;           -- Shows table structure
        SHOW CREATE TABLE staff;  -- Displays full DDL for the table
        SHOW INDEX FROM staff;    -- View indexes on a table


    --  Transaction:

        START TRANSACTION;

        UPDATE emp
        SET salary = salary * 1.10
        WHERE dept_id = 2;

        SAVEPOINT after_raise;

        DELETE FROM emp WHERE emp_id = 4;

        ROLLBACK TO after_raise;

        COMMIT;


    -- Access Control (DCL Commands)
        -- Create a New User:
            CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'password123';

        -- Grant Permissions:
            GRANT SELECT, INSERT, UPDATE ON company_db.* TO 'manager_user'@'localhost';
            FLUSH PRIVILEGES;

        -- Revoke Permissions:
            REVOKE UPDATE ON company_db.* FROM 'manager_user'@'localhost';


    -- Views (Read-Only Virtual Tables):

        CREATE VIEW employee_overview AS
        SELECT e.name, e.salary, d.dept_name
        FROM emp e
        JOIN dept d ON e.dept_id = d.dept_id;


    -- Stored Procedure:

        DELIMITER $$

        CREATE PROCEDURE GetEmployeeSalary(IN empName VARCHAR(100))
        BEGIN
            SELECT name, salary FROM emp WHERE name = empName;
        END $$

        DELIMITER ;

        CALL GetEmployeeSalary('Alice Johnson');



-- 📊 Importance of Backups
-- 📦 Full Backup
-- 📈 Incremental Backup
-- 📉 Differential Backup
-- ⏳ Point-in-Time Recovery (PITR)
-- 🔁 Transaction Log Recovery
-- 📚 Tablespace Recovery
-- 🔧 Backup and Recovery Tools
-- 🗄️ MySQL Enterprise Backup
-- 📤 mysqldump
-- 🔍 Percona XtraBackup
-- 📋 mysqlbinlog
-- ☁️ Third-Party Backup Solutions
-- ✅ Best Practices
-- 📅 Regular Testing
-- 🌐 Offsite Storage
-- ⚙️ Automation
-- 🔔 Monitoring
-- 📝 Documentation























-- Categories of End Users in DBMS
    -- Casual End users
    -- Naive or Parametric End Users
    -- Application Programmers
    -- Sophisticated End Users
    -- Standalone Users
    -- Specialised Users


-- Interfaces in DBMS
    -- Menu-Based Interfaces
    -- Forms-Based Interfaces
    -- Graphical User Interface
    -- Natural Language Interfaces
    -- Speech Input and Output Interfaces
    -- Interface for Parametric Users
    -- Interfaces for Database Administrators (DBA)


-- Data Abstraction and Data Independence
    -- Database systems comprise complex data structures. 
    -- In order to make the system efficient in terms of retrieval of data, and reduce complexity in terms of usability of users, 
    -- developers use abstraction i.e. hide irrelevant details from the users. 

    -- Level of Abstraction in a DBMS
        -- Physical or Internal Level
            -- how the data is actually stored in memory.
            -- it will contains block of storages (bytes,GB,TB,etc)
        -- Logical or Conceptual Level
            -- the information that is actually stored in the database in the form of tables.
            -- it will contain the fields and the attributes of data.
        -- View or External Level
            -- Only a part of the actual database is viewed by the users. 
            -- it works with CLI or GUI access of database


-- Data Independence
    -- Data Independence is mainly defined as a property of DBMS that helps you to change the database schema 
    -- at one level of a system without requiring to change the schema at the next level.

    -- Physical level data independence
        -- Utilizing new storage devices.
        -- Modifying data structures used for storage.
        -- Altering indexes or using alternative file organization techniques etc.

    -- Logical level data independence
        -- The user view of the data would not be affected by any changes to the conceptual view of the data.


