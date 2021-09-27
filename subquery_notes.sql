-- SUBQUERY NOTES

-- SELECT query inside of another query
-- inner query evaluated first, used to determine result of outer query
USE employees;
-- WHICH empoyees have higher than average salary?

SELECT avg(salary)
FROM salaries;
-- scalar output (single value)

SELECT emp_no from salaries
WHERE salary > x;

SELECT emp_no from salaries
WHERE salary > (SELECT avg(salary) from salaries);

-- Get names of all current managers

SELECT emp_no
FROM dept_manager
WHERE dept_manager.to_date > NOW();

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
SELECT emp_no
FROM dept_manager
WHERE dept_manager.to_date > NOW()
);

SELECT *
FROM salaries
WHERE to_date > NOW();

SELECT current_salary.emp_no, current_salary.salary
FROM (SELECT *
FROM salaries
WHERE to_date > NOW()) AS current_salary
JOIN employees USING(emp_no);



SELECT *
FROM employees
WHERE first_name LIKE 'geor%';

SELECT first_name, last_name, salary
FROM (
SELECT *
FROM employees
WHERE first_name LIKE 'geor%'
) AS g
JOIN salaries
USING(emp_no);