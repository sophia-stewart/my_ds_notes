-- GROUP BY Notes
-- (GROUP BY no longer works like ORDER BY, disregard in curriculum)

USE employees;

-- Group By produces distinct records, like SELECT DISTINCT
SELECT DISTINCT first_name
FROM employees;
-- produces same result:
SELECT first_name
FROM employees
GROUP BY first_name;

-- Can also group by multiple columns:
SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name;

SELECT *
FROM employees
WHERE first_name = 'Georgi';
-- 253 values, 253 employees named Georgi

SELECT first_name
FROM employees
GROUP BY first_name;
-- 1257 values, 1257 distinct first names

SELECT COUNT(*)
FROM employees
WHERE first_name = 'Georgi';
-- returns 253, 253 individuals named Georgi

SELECT first_name, count(first_name)
FROM employees
GROUP BY first_name;
-- each row represents how many employees have same first name
-- grouping by specific column creates group(s) for each column
-- can use aggregate functions on those groups

SELECT *
FROM titles
GROUP BY title;
-- produces error

SELECT title
FROM titles
GROUP BY title;
-- if you see "group by", think "for each" title make a row.

-- for each title, show the count:
SELECT title, COUNT(*)
FROM titles
GROUP BY title;
-- produces same result:
SELECT title, COUNT(title)
FROM titles
GROUP BY title;

-- limit results based on aggregate results:

-- show number of duplicate first names, but only show duplicate numbers < 200
SELECT first_name, COUNT(first_name) AS count_first_names
FROM employees
GROUP BY first_name
HAVING count_first_names < 200;
-- returns 12 rows; only 12 names are duplicated fewer than 200 times

SELECT first_name, COUNT(first_name) AS count_first_names
FROM employees
WHERE birth_date LIKE '%12-25'
AND gender = 'F'
GROUP BY first_name
HAVING count_first_names < 200;
-- can still use where clauses (before the GROUP BY)

SELECT first_name, COUNT(first_name) AS count_first_names
FROM employees
GROUP BY first_name
HAVING count_first_names BETWEEN 247 AND 275;

SELECT emp_no, max(salary), avg(salary)
FROM salaries
GROUP BY emp_no;
-- can show each individual employee's aggregate salary info bc the group by puts each employee into a single row and aggregate functions only output a single value

SELECT emp_no, salary
FROM salaries
GROUP BY emp_no;
-- gives error bc there is more than one salary entry for each employee, cannot show multiple salary entries in single emp_no row

SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       COUNT(*)
FROM employees
GROUP BY full_name
ORDER BY COUNT(*) DESC;
-- shows how many peple have same full name

SELECT *
FROM employees
WHERE first_name = 'Rosalyn'
AND last_name = 'Baalen';
-- have to create new query to get more info from GROUP BY query.
-- GROUP BY query shows less data but allows for aggregation