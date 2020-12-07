--Programmer: Sooorya Parthiban
--Reference: SQL GitHub Project 2
------------------------------------

-- Q1 – List all details of all departments.
USE sample;
SELECT dept_no, dept_name, location
 FROM department;

-- Q2 – List the department name and department number of all departments located in Dallas.
USE sample;
SELECT dept_name, dept_no
   FROM department
   WHERE location = 'Dallas';

--Q3 – List the last and first name of all employees with an employee number greater than or equal to 15000.
USE sample;
SELECT emp_lname, emp_fname 
   FROM employee
   WHERE emp_no >= 15000;

--Q4 – List the project names for all projects with a budget greater than or equal to $100,000.
USE sample;
SELECT project_name
   FROM project
  WHERE budget  >= 100000;

--Q5 – List the employee number and the project number they work for all employees that work on either project p1 or project p2 (or both).
USE sample;
SELECT project_no, emp_no
   FROM works_on
   WHERE project_no = 'p1'
   OR project_no = 'p2';

--Q6 – List the employee numbers and first names of all employees who do not belong to department d2.
USE sample
SELECT emp_no, emp_lname
   FROM employee
   WHERE NOT dept_no = 'd2';

-- Alternative answer
USE sample
SELECT emp_no, emp_lname
   FROM employee
   WHERE dept_no <> 'd2';

--Q7 – List all the columns for every employee whose employee number equals 29346, 28559 or 25348.
USE sample;
SELECT emp_no, emp_fname, emp_lname
   FROM employee
   WHERE emp_no IN (29346, 28559, 25348);

--Q8 - List all the columns for every employee whose employee number is neither 10102 nor 9031.
USE sample;
SELECT emp_no, emp_fname, emp_lname, dept_no
   FROM employee
   WHERE emp_no NOT IN (10102, 9031);

--Q9 – List the names and budgets for all projects with a budget between $95,000 and $120,000, inclusive.
USE sample;
SELECT project_name, budget
   FROM project
   WHERE budget BETWEEN 95000 AND 120000;
   
--Q10 - List the names and budgets for all projects with a budget less than $100,000 or greater than $150,000.
USE sample;
SELECT project_name
  FROM project
   WHERE budget NOT BETWEEN 100000 AND 150000;
   
--Q11 – List the first name and last name of employees who work in the Research department
--(the query must look-up the department number associated with Research).
USE sample;
SELECT emp_fname, emp_lname
   FROM employee
   WHERE dept_no =
    (SELECT dept_no
       FROM department
      WHERE dept_name = 'Research');

--Q12 – List the full details of all employees whose department is located in Dallas 
--(again, the query must retrieve the department number, not you).
USE sample;
SELECT *
   FROM employee
   WHERE dept_no IN
   (SELECT dept_no
        FROM department
        WHERE location = 'Dallas');

--Q13 – List the last names of all employees who work on project Apollo
USE sample;
SELECT emp_lname
   FROM employee
   WHERE emp_no IN
   (SELECT emp_no
      FROM works_on
      WHERE project_no IN
      (SELECT project_no
            FROM project
           WHERE project_name = 'Apollo'));

--Q14 – List all the jobs performed by employees (hint: use the GROUP BY clause).
USE sample;
SELECT job
   FROM works_on
   GROUP BY job;

--Q15 – Group and list all employees by project number and job.
USE sample;
SELECT project_no, job
   FROM works_on
   GROUP BY project_no, job;
   
--Q16 – List the lowest employee number (hint: Use the MIN function).
USE sample;
SELECT MIN(emp_no)  AS min_employee_no
   FROM employee;

--Q17 – List the number and the last name of the employee with the lowest employee number
USE sample;
SELECT emp_no, emp_lname
   FROM employee
   WHERE emp_no =
   (SELECT MIN(emp_no)
        FROM employee);

--Q18 – List the employee number of the manager who was entered last (recorded in the enter_date column) in the works_on table.
USE sample;
SELECT emp_no
   FROM works_on
   WHERE enter_date =
   (SELECT MAX(enter_date)
        FROM works_on
       WHERE job = 'Manager');

--Q19 – Calculate and list the average of all budgets for projects whose budget exceeds $100,000.
USE sample;
SELECT AVG(budget) avg_budget
   FROM project
   WHERE budget > 100000;

--Q20 – Count and list the number of jobs in each project.
USE sample;
SELECT job, COUNT(*) AS job_count
   FROM works_on
   GROUP BY job;

--Q21 – List the project numbers for all projects employing fewer than four persons.
USE sample;
SELECT project_no
   FROM works_on
   GROUP BY project_no
   HAVING COUNT(*) < 4;

--Q22 – List the department numbers and employee names for employees with employee numbers < 20000, in ascending order of last and first names..
USE sample;
SELECT emp_fname, emp_lname, dept_no
   FROM employee
   WHERE emp_no < 20000
   ORDER BY emp_lname, emp_fname;

--Q23 - List the employee number for employees who either belong to department d1 or entered their project before 1/1/2007, in ascending order of employee number.
USE sample;
SELECT emp_no
   FROM employee
   WHERE dept_no = 'd1'
UNION
SELECT emp_no
   FROM works_on
   WHERE enter_date < '01.01.2007'
ORDER BY emp_no;

--Q24 – List the department number for all employees who entered their projects October 15, 2007
USE sample;
SELECT dept_no
     FROM employee 
INNER JOIN works_on
     	ON employee.emp_no = works_on.emp_no
   	WHERE enter_date = '10.15.2007';
   	
--Q25 – List the first and last names of all analysts whose department is located in Seattle.
USE sample;
SELECT emp_fname, emp_lname
       FROM works_on 
       INNER JOIN employee 
			ON works_on.emp_no=employee.emp_no
       INNER JOIN department 
			ON employee.dept_no=department.dept_no
       AND location = 'Seattle'
       AND job = 'analyst';
       

--Q26 – Insert a new employee into the database. The employee is called Dave Davis and has employee number of 15201.
USE sample;
INSERT INTO employee (emp_no, emp_fname, emp_lname)
             VALUES (15201, 'Dave', 'Davis');

--Q27 – Update the job of employee number 18316, who works on project p2, to be ‘Manager’.
USE sample;
UPDATE works_on
   SET job = 'Manager'
   WHERE emp_no = 18316
   AND project_no = 'p2';

--Q28 – Update the budgets of all projects to 51% of the current value.
USE sample;
UPDATE project
    SET budget = budget*0.51;

--Q29 – Due to her illness, update all jobs on all projects to NULL for Mrs. Jones.
USE sample;
UPDATE works_on
      SET job = NULL
      WHERE emp_no IN
      (SELECT emp_no
          FROM employee
         WHERE emp_lname = 'Jones');

--Q30 – Delete all managers in the works_on table.
USE sample;
DELETE FROM works_on
   WHERE job = 'Manager';

--Q31 – Mrs. Moser is on maternity leave. Delete all rows in the works_in table concerning her.
USE sample;
DELETE FROM works_on
    WHERE emp_no IN
    (SELECT emp_no
         FROM employee
        WHERE emp_lname = 'Moser');

---------------------------------------------------------------------------
--THE END
---------------------------------------------------------------------------





