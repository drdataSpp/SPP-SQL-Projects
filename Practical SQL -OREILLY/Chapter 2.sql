-- CREATING DATABASE
CREATE DATABASE analysis;
USE analysis;

-- CREATING TABLE
DROP TABLE IF EXISTS teachers; 

CREATE TABLE teachers_t(
id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(25),
last_name VARCHAR(25),
school VARCHAR(50),
hire_date DATE,
salary MONEY,
);


--INSERTING VALUES INTO teachers_t TABLE
INSERT INTO teachers_t (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);


-- CREATING 1:1 VIEW OF THE teacher_t table
CREATE VIEW teachers_v AS
SELECT * FROM teachers_t;

--QUERYING THE DATA FROM VIEW
SELECT * FROM teachers_v;