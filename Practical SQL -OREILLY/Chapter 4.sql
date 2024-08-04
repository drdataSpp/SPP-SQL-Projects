USE analysis;

--CREATING DEPARTMENT & EMPLOYEE TABLES
CREATE TABLE departments (
    dept_id integer not null PRIMARY KEY,
    dept text,
    city text,
);

CREATE TABLE employees (
    emp_id integer not null PRIMARY KEY,
	dept_id integer not null FOREIGN KEY REFERENCES departments (dept_id),
    first_name text,
    last_name text,
    salary numeric(10,2),
);

--INSERTING VALUES INTO ABOVE TABLES
INSERT INTO departments
VALUES
    (1, 'Tax', 'Atlanta'),
    (2, 'IT', 'Boston');

INSERT INTO employees
VALUES
    (1, 1, 'Julia', 'Reyes', 115300),
    (2, 1, 'Janet', 'King', 98000),
    (3, 2, 'Arthur', 'Pappas', 72700),
    (4, 2, 'Michael', 'Taylor', 89500);

--CHECKING THE INSERTED DATA

SELECT * FROM departments;
SELECT * FROM employees;

-- USING A JOIN ON THE ABOVE TWO TABLES (JOIN IS AN ALTERNATIVE SYNTAX FOR INNER JOIN)

SELECT * FROM employees e
JOIN departments d ON
	d.dept_id = e.dept_id
ORDER BY e.emp_id;

