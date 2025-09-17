-- =================================================================


-- ################### --
-- ###  DATABASES  ### --
-- ################### --

    -- ✅ DISPLAY ALL DATABASE
        SHOW DATABASES;
        
        
	-- ✅ DISPLAY USER DATABASES ONLY
		SHOW DATABASES WHERE `Database` NOT IN ('information_schema', 'mysql', 'performance_schema', 'sys');


    -- ✅ SHOW USER PRIVILEGES
        SHOW GRANTS FOR 'your_username'@'localhost';    


    -- ✅ CREATE DATABASE
        CREATE DATABASE IF NOT EXISTS demo;
        CREATE DATABASE demo;
        CREATE SCHEMA demo;
        
	-- ✅ CREATE DATABASE FROM FILES
        -- mysql -u root -p employees < "/home/ashokkumar/Documents/3 NOTES/RDBMS/MySQL/test_db/employees.sql"
        

    -- ✅ USE DATABASE
        USE demo;


    -- ✅ DISPLAY CURRENT DATABASE
        SELECT DATABASE();


    -- ✅ DROP DATABASE
        DROP DATABASE IF EXISTS demo;

        DROP DATABASE demo;
        
        
-- =============================================================================


-- ################################ --
-- ### DATABASE SETTINGS & INFO ### --
-- ################################ --

    -- ✅ SHOW DATABASE CHARACTER SET
        SELECT SCHEMA_NAME, DEFAULT_CHARACTER_SET_NAME, DEFAULT_COLLATION_NAME 
        FROM information_schema.SCHEMATA 
        WHERE SCHEMA_NAME = 'demo';

    -- ✅ CREATE DATABASE WITH SPECIFIC CHARACTER SET AND COLLATION
        CREATE DATABASE demo CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

    -- ✅ ALTER DATABASE CHARACTER SET
        ALTER DATABASE demo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- ✅ SHOW DATABASE SIZE (IN MB)
        SELECT table_schema AS "Database", 
               ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Size (MB)" 
        FROM information_schema.TABLES 
        WHERE table_schema = 'demo'
        GROUP BY table_schema;

    -- ✅ RENAME DATABASE (Alternative: Create & Migrate Data)
        CREATE DATABASE new_demo;
        RENAME TABLE demo.old_table TO new_demo.old_table;
        DROP DATABASE demo;

    -- ✅ DATABASE ACCESS CONTROL
        -- Grant all privileges to a user on a database
        GRANT ALL PRIVILEGES ON demo.* TO 'your_username'@'localhost';

        -- Revoke privileges from a user
        REVOKE INSERT, UPDATE ON demo.* FROM 'your_username'@'localhost';

        -- Show specific user privileges on a database
        SHOW GRANTS FOR 'your_username'@'localhost'; 
        

-- =================================================================


-- ################### --
-- ###    TABLES   ### --
-- ################### --

    -- ✅ SHOW TABLES
        SHOW TABLES;
        SHOW TABLES FROM demo;


    -- ✅ SHOW TABLE STRUCTURE
        DESCRIBE employees;             -- Alias: DESC
        SHOW CREATE TABLE employees;
        
        
	-- ✅ DETAILED TABLE INFORMATION
        SHOW TABLE STATUS WHERE Name = 'employees';

        SELECT *
        FROM information_schema.tables
        WHERE table_schema = DATABASE() AND table_name = 'employees';-- 


    -- ✅ TABLE CONSTRAINTS 
        SELECT * 
        FROM information_schema.table_constraints
        WHERE table_schema = DATABASE();


    -- ✅ PERTICULAR TABLE CONSTRAINTS DETAILS
        SELECT * 
        FROM information_schema.table_constraints
        WHERE table_schema = DATABASE() 
        AND table_name = 'employees';

        SELECT constraint_name, column_name
        FROM information_schema.key_column_usage
        WHERE table_schema = DATABASE()
        AND table_name = 'employees'
        AND constraint_name != 'PRIMARY';

    
    -- ✅ SHOW PRIMARY KEY
        SELECT column_name
        FROM information_schema.key_column_usage
        WHERE table_schema = DATABASE()
        AND table_name = 'employees'
        AND constraint_name = 'PRIMARY';


    -- ✅ FOREIGN KEY COSTRAINTS DETAILS
        SELECT * 
        FROM information_schema.referential_constraints
        WHERE constraint_schema = DATABASE();
        
        -- Show foreign key relationships for a specific table
			SELECT rc.constraint_name, rc.table_name, kcu.column_name, 
				   rc.referenced_table_name, kcu.referenced_column_name
			FROM information_schema.referential_constraints rc
			JOIN information_schema.key_column_usage kcu
			ON rc.constraint_name = kcu.constraint_name
			WHERE rc.constraint_schema = DATABASE()
			AND rc.table_name = 'employees';


    -- ✅ CHECK CONSTRAINTS DETAILS
        SELECT constraint_name
        FROM information_schema.check_constraints
        WHERE table_name = 'employees';


    -- ✅ INDEX
        SHOW INDEX FROM emp WHERE Non_unique = 0;  -- Unique Indexes

        SHOW INDEX FROM emp WHERE column_name = 'phone_number';

        SHOW KEYS FROM emp; -- Alternative for indexes 
        
        -- Detailed index information
			SELECT table_name, index_name, column_name, seq_in_index, 
				   index_type, non_unique
			FROM information_schema.statistics
			WHERE table_schema = DATABASE() AND table_name = 'employees';
            

    -- ✅ ENUM AND SET COLUMNS
        SELECT column_name, column_type
        FROM information_schema.columns
        WHERE table_schema = DATABASE() 
        AND table_name = 'employees'
        AND data_type IN ('enum', 'set');


    -- ✅ AUTO_INCREMENT INFO
        SELECT table_name, auto_increment
        FROM information_schema.tables
        WHERE table_schema = DATABASE() 
        AND table_name = 'employees';


    -- ✅ STORAGE ENGINE INFO
        SELECT table_name, engine
        FROM information_schema.tables
        WHERE table_schema = DATABASE() 
        AND table_name = 'employees';


    -- ✅ TEMPORARY TABLES (Session-specific)
        SHOW TABLES WHERE Tables_in_demo LIKE '##%';


    -- ✅ PARTITION INFORMATION
        SELECT *
        FROM information_schema.partitions
        WHERE table_schema = DATABASE() 
        AND table_name = 'employees';


    -- ✅ VIEWS (Logical tables)
        SHOW FULL TABLES IN demo WHERE table_type LIKE 'VIEW';

        SHOW CREATE VIEW view_name;


-- ==================================================================================


-- ################################--
-- ### DATA DEFINITION LANGUAGE ###--
-- ################################--

    -- Structure of the database
    -- DDL commands define and manage database structures like tables, indexes, and schemas. 
    -- These commands automatically commit changes, making them permanent.
    
    
    -- CREATE
        -- 📁 CREATE DATABASE    – Defines a new database.
        -- 📊 CREATE TABLE       – Creates a new table.
        -- 👓 CREATE VIEW        – Creates a virtual table from a query.
        -- 📚 CREATE INDEX       – Defines an index to optimize searches.
        -- 👤 CREATE USER        – Creates a new database user (MySQL-specific DDL).
        -- 🛡️ CREATE ROLE        – Defines a new role for managing privileges.
        -- 🔔 CREATE TRIGGER     – Sets up actions that execute automatically on specific events.
        -- 🔄 CREATE PROCEDURE   – Defines a reusable block of SQL code (stored procedure).
        -- 📐 CREATE FUNCTION    – Creates a custom function that returns a value.
        -- ⏳ CREATE EVENT       – Schedules tasks to run automatically.
        -- 📦 CREATE TABLESPACE  – Manages physical storage (rarely used in MySQL).
        
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
    
        -- 🔠 RENAME TABLE
            RENAME TABLE employees TO emp;

            ALTER TABLE emp
            RENAME TO employees;

        -- 🔠 RENAME COLUMN
            ALTER TABLE emp
            CHANGE name emp_name CHAR(55);  


    -- 📌 COMMENT

        -- 💬 THIS IS A COMMENT

        /* 
            💬 THIS IS
            MULTI LINE
            COMMENT
        */


        -- 💬 TABLE COMMENT
            ALTER TABLE emp
            COMMENT = 'Stores employee records and related information';


        -- 💬 COLUMN COMMENT
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

        SELECT * FROM employees;

        SELECT [COUNT][DISTINCT] column1, column2 AS alias
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

        -- ✅ ||


    -- 🔄 COMPARISON OPERATORS

        -- ✅ Compare values and return boolean (TRUE/FALSE)
            SELECT * FROM employees WHERE age = 30;        -- Equal to =
            SELECT * FROM employees WHERE age != 25;       -- Not equal to !=


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

    -- Types of Indexes in MySQL:
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
		-- 	├── Single-Level Index
		-- 	└── Multi-Level Index

        -- B / B+ Tree Indexes
        -- Hash Indexes
        -- Bitmap Indexes

    -- ✅ B-Tree Indexes:
        -- The default and most commonly used index type in MySQL.

        -- Search Mechanism: 
            -- MySQL traverses from the root to the leaf node, reducing search time to O(log n)
        
        -- Order: Keeps data in sorted order, making it ideal for range queries.

        -- Good for: 
            -- Equality (=) 
            -- Range queries (>, <, BETWEEN)
            -- Prefix matches (LIKE 'abc%')
        -- Not ideal for:
            -- Values with low cardinality (few distinct values). 
            -- Queries using %abc (wildcard at the beginning).

        -- Supported By	InnoDB, MyISAM

        -- Example: 
            -- Names, Dates, Ranges
        
        CREATE INDEX idx_employee_name ON employees (name);


    -- ✅ Hash Indexes:
        -- Used exclusively by the MEMORY storage engine in MySQL.

        -- Do not store data in a sorted order, limiting their use cases.

        -- Good for:
            -- Exact equality checks (=).

        -- Not ideal for:
            -- Range queries (<, >, BETWEEN).
            -- Sorting (since hash tables don’t maintain order).

        -- Supported By MEMORY Engine Only

        -- Example: 
            -- Unique IDs, Caches

        CREATE INDEX idx_employee_id ON employees (id) USING HASH;

    
    -- ✅ Bitmap Indexes:

        -- Concept: Maps data using bit arrays for each possible value.
        
        -- Utilize bit arrays to represent the existence of a value, allowing for efficient logical operations.

        -- Note:
            -- MySQL does not natively support bitmap indexes.
            -- Found in Oracle or PostgreSQL.

        -- Good for:
            -- Low-cardinality values (few unique values).

        -- Not ideal for:
            -- Range queries (<, >, BETWEEN).

        -- Example:
            -- Gender, Status Flags
            
	-- 📊 MULTI LEVEL INDEXING
		-- 🧱 Mechanics of Multi-Level Indexing
			-- Data Layer (Level 0): Contains the actual table records stored in the database.
			-- First-Level Index (Level 1): Points to blocks/pages of data records.
			-- Second-Level Index (Level 2): Points to first-level index entries.
			-- Higher Levels (Level 3 and beyond): As the dataset grows, additional index levels can be added.
            
            -- Example:
				-- 1001 1002 1003 1004 1005 
                -- Level 2 (Root Level):
					-- [1001 → P1]  [1003 → P2]  [1005 → P3]
                -- Level 1 (Intermediate):
					-- P1: [1001, 1002]
					-- P2: [1003, 1004]
					-- P3: [1005]
				-- Level 0 (Data): Actual table records.
					-- [1001 → Alice]  [1002 → Bob]  [1003 → Charlie] ...
                    
			-- 🧮 Types of Multi-Level Indexing
				-- Primary Index – Based on the primary key (unique for each row).
				-- Secondary Index – Indexes on non-primary attributes (e.g., name).
				-- Clustered Index – Sorts rows by the index (one per table).
				-- Non-Clustered Index – Points to actual rows (can have multiple). 
                
	-- ✅ Popular Balanced Trees for Indexing
			-- AVL Tree – Strict balancing (height difference ≤ 1).
			-- Red-Black Tree – Less strict but faster rebalancing.
			-- B-Tree – Ideal for database indexing.
				-- B-Trees store multiple keys in each node, reducing disk I/O.
			-- B+ Tree – Used in RDBMS for fast range queries. 
				
    
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
        
        Dropping Indexes
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