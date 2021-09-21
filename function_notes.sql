/*
           *~*~*~*~*~ FUNCTION NOTES ~*~*~*~*~*

 Stored procedure = custom function; look this up later to learn more.
 Full list of MySQL functions can be found at: https://dev.mysql.com/doc/refman/5.7/en/functions.html
*/

-- ******************** STRING FUNCTIONS ********************

-- CONCAT():
-- concatenate: putting strings together

SELECT CONCAT('Hello', 'Codeup', '!');

USE employees;

SELECT CONCAT(first_name, ' ', last_name)
FROM employees
LIMIT 10;
-- To add space between elements, add space character in quotes: ' '

SELECT lower(CONCAT(first_name, last_name, '@codeup.com')) AS Email
FROM employees
WHERE first_name NOT LIKE '%georg%'
LIMIT 5;
-- can be used for things like creating emails based on table data
-- usually will be aliased for clarity
-- lower() function makes designated output all lowercase
-- function calls work from inside out (order of operations)
	-- concat is done first, then all output is made lowercase

-- SUBSTR()
-- substring, outputs chunks from a string
-- syntax: SUBSTR(string, start_index, length)
-- string = column or w/e is being analyzed, start_index = starting point, length = number of values

SELECT SUBSTR(first_name, 1, 1)
FROM employees;


SELECT CONCAT(SUBSTR(first_name, 1, 1), last_name, emp_no) AS Username
FROM employees;
-- can combine substr+concat

SELECT SUBSTRING(first_name, -5)
FROm employees;
-- negative index, gives last x values from data

-- CASE CONVERSION

-- LOWER() 
SELECT LOWER(first_name)
FROM employees;
-- makes output lowercase

-- UPPER() 
SELECT UPPER(last_name)
FROM employees;
-- makes output uppercase

-- REPLACE
-- can replace substrings
-- syntax: REPLACE(subject, search, replacement)
-- does not alter original data at all

SELECT REPLACE(dept_name, 'Resources', 'Solutions')
FROM departments;
-- Changes 'Resources' to 'Solutions' in /output/

SELECT *
FROM departments;
-- Note that 'Human Resources' has remained unchanged in the data source
-- 


-- ******************** DATE/TIME FUNCTIONS ********************

-- NOW()
SELECT NOW();
-- gives current date and time

-- CURDATE()
SELECT CURDATE();
-- gives current date only

-- CURTIME()
SELECT CURTIME();
-- gives current time only

-- DATEDIFF() 
SELECT DATEDIFF(CURDATE(), birth_date)
FROM employees;
-- gives difference between dates
-- default output is expressed in days


-- UNIX_TIMESTAMP()
SELECT UNIX_TIMESTAMP();
-- displays number of seconds since 00:00:00 01-01-1970

SELECT UNIX_TIMESTAMP('1971-01-01');
-- shows seconds elapsed since specified date (if after 00:00:00 01-01-1970)
--


-- ******************** NUMERICAL FUNCTIONS ********************

-- MAX()
-- gives maximum value
SELECT MAX(salary)
FROM salaries;

-- MIN()
-- gives minimum value
SELECT MAX(salary) - MIN(salary) AS range_from_min_max
FROM salaries;

-- AVG()
-- gives mean value
SELECT MAX(salary) - AVG(salary)
FROM salaries;
--


-- ******************** CASTING ********************
-- converts one type to another (ex: INT to CHAR)

-- Usually happens automatically in MySQL:
SELECT 1 + '4',
       '3' - 1,
       CONCAT('Here is a number: ', 123);

-- Explicit CAST function:
SELECT CAST(123 as CHAR);

-- More info on CAST: https://www.w3schools.com/mysql/func_mysql_cast.asp
-- 