

-- DATA CREATION
 
CREATE DATABASE IF NOT EXISTS demo;

USE demo;

SELECT DATABASE();


SHOW TABLES;


CREATE TABLE emp(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept VARCHAR(20),
    salary DECIMAL(10,2),
    join_date DATE,
    age INT
);

DESC emp;

ALTER TABLE emp
ADD COLUMN email VARCHAR(100);



ALTER TABLE emp
RENAME COLUMN emp_name TO full_name;

-- ALTER TABLE emp
-- RENAME emp_name TO full_name;

ALTER TABLE emp
CHANGE emp_name full_name VARCHAR(100);



ALTER TABLE emp
DROP COLUMN email;

TRUNCATE TABLE emp;

DROP TABLE emp;

DROP TABLE dept;





-- DATA MANIPULATION 

INSERT INTO emp VALUES (101, 'Alice', 'HR', 50000, '2020-01-15', 30),
							(102, 'Bob', 'IT', 60000, '2021-03-22', 28),
							(103, 'Charlie', 'IT', 75000, '2022-05-10', 35),
							(104, 'Dave', 'HR', 55000, '2019-07-05', 40),
                            (105, 'Eve', 'Marketing', 45000, '2021-11-23', 25);

SELECT * FROM emp;

UPDATE emp
SET salary = salary * 1.10
WHERE emp_name = 'Alice';

UPDATE emp
SET salary = salary * 1.10
WHERE emp_id = 101;

UPDATE emp
JOIN (SELECT emp_id FROM emp WHERE emp_name = 'Alice') AS e
ON emp.emp_id = e.emp_id
SET emp.salary = emp.salary * 1.10;

DELETE FROM emp
WHERE emp_name = 'Bob';



SAVEPOINT before_update;	

INSERT INTO emp VALUES (106, 'Aaron', 'IT', 40000, '2020-01-15', 28),
							(107, 'Finch', 'HR', 80000, '2021-03-22', 48);
                            
UPDATE emp
SET salary = salary * 2
WHERE emp_name = 'Aaron';

ROLLBACK TO before_update;



INSERT INTO emp (emp_id, emp_name, dept, salary, join_date, age)  
VALUES  
(101, 'Alice', 'HR', 50000, '2020-01-15', 30),  
(102, 'Bob', 'IT', 60000, '2021-03-22', 28),  
(103, 'Charlie', 'IT', 75000, '2022-05-10', 35),  
(104, 'Dave', 'HR', 55000, '2019-07-05', 40),  
(105, 'Eve', 'Marketing', 45000, '2021-11-23', 25),  
(106, 'Frank', 'IT', 70000, '2020-12-01', 32),  
(107, 'Grace', 'Marketing', 46000, '2022-03-18', 27);  

SELECT * FROM emp;

COMMIT;

SELECT * FROM emp
WHERE salary > 55000;

SELECT * FROM emp
WHERE join_date < '2021-01-01';

SELECT * FROM emp  
WHERE YEAR(Join_Date) < 2021;

SELECT * FROM emp
WHERE salary < 50000 AND age < 30;

SELECT * FROM emp
WHERE dept <> 'HR' AND age > 30; -- !=, NOT IN

SELECT AVG(salary) FROM emp
WHERE dept = 'IT';

SELECT COUNT(*) AS count FROM emp
WHERE age > 30;

SELECT emp_name FROM emp
WHERE salary = (SELECT MAX(salary) FROM emp);

-- SELECT MAX(salary) FROM emp
-- WHERE dept = 'Marketing'
-- GROUP BY dept;

SELECT * FROM emp
WHERE dept = 'HR' OR dept = 'IT' -- IN
	AND salary BETWEEN 45000 AND 70000;
   
   
SELECT dept FROM emp
WHERE dept = ;

SELECT AVG(salary) FROM emp
GROUP BY dept;

SELECT dept, AVG(salary) AS avg_sal FROM emp
GROUP BY dept
ORDER BY avg_sal DESC
LIMIT 1;

SELECT salary FROM emp
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT * FROM emp
ORDER BY join_date DESC
LIMIT 1;

SELECT emp.*, MAX(join_date) FROM emp;

-- SELECT Employee.*, MAX(join_date) FROM Employee; 


	












CREATE TABLE emp2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id VARCHAR(10),
    salary DECIMAL(10,2),
    -- CONSTRAINT fk_department
    CONSTRAINT FOREIGN KEY (dept_id) 
    REFERENCES dept(dept_id) 
    -- ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO emp2 (emp_id, emp_name, dept_id, salary) VALUES
(101, 'Alice', 'D1', 50000),
(102, 'Bob', 'D2', 60000),
(103, 'Charlie', 'D1', 75000),
(104, 'Dave', 'D3', 55000),
(105, 'Eve', 'D2', 45000);

INSERT INTO emp2 (emp_id, emp_name, dept_id, salary) VALUES
(106, 'Al', 'D1', 50000),
(107, 'Bo', 'D2', 90000),
(108, 'Ch', 'D1', 75000),
(109, 'Da', 'D3', 35000),
(110, 'Ev', 'D2', 45000);

CREATE TABLE dept (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

INSERT INTO dept (dept_id, dept_name) VALUES
('D1', 'HR'),
('D2', 'IT'),
('D3', 'Marketing'),
('D4', 'Sales');

COMMIT; 

SELECT * FROM emp;
SELECT * FROM dept;


ALTER TABLE emp
ADD COLUMN dept_id VARCHAR(10),
ADD CONSTRAINT fk_department
FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
ON DELETE SET NULL ON UPDATE CASCADE;


SELECT * FROM emp2;
SELECT * FROM dept;



SELECT emp2.emp_name, dept.dept_name, emp2.salary 
FROM emp2 INNER JOIN dept 
ON emp2.dept_id = dept.dept_id;

SELECT emp2.emp_name, dept.dept_name
FROM emp2 LEFT JOIN dept
ON emp2.dept_id = dept.dept_id;

SELECT emp2.emp_name, dept.dept_name
FROM emp2 RIGHT JOIN dept
ON emp2.dept_id = dept.dept_id;













select dept_id, avg(salary) as avgg from emp2 
group by dept_id 
order by avgg desc limit 1 offset 1;











SELECT * FROM emp;

    -- 2nd Highest Salary:
        SELECT *
        FROM emp e1
        WHERE 0 = (
            SELECT COUNT(DISTINCT e2.salary)
            FROM emp e2
            WHERE e2.salary > e1.salary
        );

    -- Last (Minimum) Salary:
        SELECT e1.*
        FROM emp e1
        WHERE (SELECT COUNT(*)
            FROM emp e2
            WHERE e2.salary < e1.salary) = 0;



SELECT LENGTH('BUTTERFLY') FROM DUAL;

SELECT CONCAT('MR.', 'ASHOKA') FROM DUAL;

SELECT SUBSTR('BUTTERFLY', 3, 3) FROM DUAL;


SELECT DISTINCT(salary) FROM emp2;

SELECT COUNT(salary) FROM emp2
GROUP BY salary
HAVING COUNT(salary) > 1; 



