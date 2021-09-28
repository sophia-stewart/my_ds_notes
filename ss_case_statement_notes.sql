-- CASE STATEMENTS NOTES

-- deal with conditional output
-- evaluated from top to bottom
-- first condition that's met determines output

-- Simple Case Statement
-- syntax:
/*
SELECT
CASE column_a
	WHEN condition_a THEN value_1
	WHEN condition_b THEN value_2
	ELSE value_3
	END AS alias
FROM table_a;
*/
USE employees;

SELECT dept_name,
	CASE dept_name
	WHEN 'research' THEN 'Development'
	WHEN 'marketing' THEN 'Sales'
	ELSE dept_name
	END AS dept_group
FROM departments;
-- if column name is declared after CASE, not necessary to specify in each WHERE statement
   -- MySQL assumes all WHERE statements are in regard to declared column
-- quick swap of values; one for another
-- only checks for exact match (not case-sensitive)

-- Flexible Case Statement
-- syntax:
/* 
SELECT
	CASE
		WHEN column_a > condition_1 THEN value_1
		WHEN column_b <= condition_2 THEN value_2
		ELSE value_3
		END AS alias
FROM table_a;
*/
SELECT dept_name,
	CASE
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
		WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
		WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
		ELSE dept_name
		END AS dept_group
FROM departments;

-- IF Function
-- use for T/F, Y/N queries
/*
SELECT IF(column_a = condition_1, value_1, value_2) AS alias
FROM table_a
*/
SELECT dept_name,
	IF(dept_name = 'Research', 'True', 'False') AS is_research
FROM employees.departments;

-- Nested CASE Statements
-- syntax:
/*
SELECT
	CASE
		WHEN column_a > condition_1 THEN 
			CASE
				WHEN column_c > column_3 THEN value_1
				ELSE value_2
			END
		ELSE value_3
	END AS alias
FROM table_a;
*/

SELECT dept_name,
	CASE
		WHEN dept_name IN ('research', 'development')
		THEN
			CASE
				WHEN dept_name = 'research' THEN 'BigBrains'
				ELSE 'BigSpend'
			END
		ELSE 'Sales & Marketing'
	END AS dept_group
FROM departments;

		