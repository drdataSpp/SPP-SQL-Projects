--SORTING DATA IN TEACHERS VIEW
SELECT first_name, last_name, salary 
FROM teachers_v
ORDER BY salary DESC;

--SORTING DATA IN TEACHERS VIEW USING NUMBER INSTEAD OF COLUMN NAME
SELECT first_name, last_name, salary 
FROM teachers_v
ORDER BY 3 DESC;

--SORTING BASED ON MULTIPLE COLUMNS
SELECT last_name, school, hire_date
FROM teachers_v
ORDER BY school ASC, hire_date DESC;

--FINDING UNIQUE VALUES OF SCHOOL
SELECT DISTINCT school
from teachers_v
ORDER BY 1;

--FINDING UNIQUE VALUES OF SCHOOLS & SALARY
SELECT DISTINCT school, salary
from teachers_v
ORDER BY 1, 2;

/* THE ABOVE QUERY CAN BE USED TO FIND FOR AN X VALUE, HOW MANY Y VALUES ARE PRESEMT*/

--USING WHERE CLAUSE
SELECT last_name, school, hire_date
FROM teachers_v
WHERE school = 'Myers Middle School';

--COMBINING AND OR OPERATORS
SELECT *
FROM teachers_v
WHERE school = 'F.D. Roosevelt HS'
      AND (salary < 38000 OR salary > 40000);

--USING LIKE OPERATOR
SELECT * FROM teachers_v
WHERE first_name LIKE '%sam%';

--USING NOT LIKE OPERATOR
SELECT * FROM teachers_v
WHERE first_name NOT LIKE '%sam%';