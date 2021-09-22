/*
 INDEXES (Indices) NOTES
-- unique identifiers, optimized for speed

-- PRIMARY KEY can be any non-null type
-- use AUTO_INCREMENT rather than manually incrementing to keep track of primary key
-- limited to one per table, but can be composite

-- UNIQUE constraint prevents duplicate creation, good for usernames/emails
-- not limited to one per table

-- Foreign Keys 

-- COMPOSITE KEY is a primary key composed of multiple columns

*/

/*
JOIN NOTES

3 types of JOINs:
-- JOIN (INNER JOIN): middle of Venn diagram
-- LEFT JOIN: left and middle of Venn diagram
-- RIGHT JOIN: right and middle of Venn diagram
-- there are more types of JOINs outside of the scope of this course

Relationship Types:
-- 1:1 relationship
-- ex: username/password
-- usually means those columns are on the same table

-- 1:many
-- two table relationship
-- one table with primary key, one with foreign key
-- many rows on one table are associated with single row on other table

-- many:many 
-- one dept has many employees and many employees can belong to one dept
-- two joins
-- three tables if no foreign keys directly pointing to each other
-- many different rows on one table are related to many different rows on other table


JOIN Syntax:

SELECT columns
FROM table_a
JOIN table_b
ON A.id = B.fk_id; <-- primary key on a is equal to foreign key on table b
*/

-- JOIN:
USE employees;
SELECT *
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no;
-- primary key on employees matches foreign key on salaries
-- note emp_no is shown twice, once from each table

-- primary key on one table can have different column name from foreign key on second table
USE employees;
SELECT *
FROM employees
JOIN salaries USING(emp_no);
-- only if primary key is exact same as foreign key on second table
-- gets rid of that duplicate


-- some tables have foreign keys that allow NULL values

USE join_example_db;

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;
-- no NULLs with inner join; doesn't show up in results
-- USING command does not change type of join
-- users.name, roles.name = table.column

/*
don't need to preface with USE db command if put db.table in FROM command:
FROM join_example_db.users (database.table)
*/

-- LEFT JOIN:
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- all records from users, will tolerate nulls from table being selected from (but not table being joined)
-- everything from table a, even if no corresponding record on table b

-- RIGHT JOIN:
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
-- all records from roles, will tolerate nulls from table being joined (but not table being selected from)
-- everything from table b, even if no corresponding record on table a

-- ASSOCIATIVE/JOINER TABLES

USE employees;
SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM dept_emp;
-- associative table for departments and employees table
-- does not show all data from departments and employees, just by this particular table's design

-- to join 3 tables:
SELECT *
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;

-- same result with USING function:
-- dept_emp and departments both use 'dept_no'
-- employees and dept_emp both use 'emp_no'
SELECT *
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no);

-- can combine joins with other functions as well:
SELECT first_name, COUNT(*)
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date > CURDATE()
AND dept_name = 'Customer Service'
AND birth_date LIKE '%09-22'
GROUP BY first_name
ORDER BY first_name;