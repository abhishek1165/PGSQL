-- CREATE TABLE DEPARTMENTS(
--     Department_Id SERIAL PRIMARY KEY,
--     Department_Name VARCHAR(100) NOT NULL 
-- );

-- INSERT INTO DEPARTMENTS(Department_Name) VALUES
-- ('Human Resources'),
-- ('Finance'),
-- ('Engineering'),
-- ('Sales'),
-- ('Marketing');

-- INSERT INTO DEPARTMENTS(Department_Id, Department_Name) VALUES
-- (6,'Tech');

-- -- This clears the table and resets the automatic counter back to 1
-- TRUNCATE TABLE DEPARTMENTS RESTART IDENTITY;



-- Select * from DEPARTMENTS;




CREATE TABLE EMPLOYEES(
    EmployeeId Serial primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Email varchar(100) not null unique,
    PhoneNumber varchar(20),
    Bio text,
    Job_Title varchar(50) not null,
    Salary int not null check (Salary >0),
    Is_Active boolean default true,
    Hire_Date date not null,
    Last_Login timestamp,
    Employees_Status varchar(20) not null default 'active'
      check (Employees_Status in ('active','on_leave','terminated')),
    Created_At timestamp not null default now(),
    Department_Id INT REFERENCES departments(Department_Id),
    Manager_Id INT REFERENCES employees(EmployeeId)
);

-- FIX 1: Robert Chen is inserted first so he gets EmployeeId = 1 and can
--         serve as the manager (manager_id = 1) for the other sales reps.
-- FIX 2: Corrected FirstName from 'Fake' to 'Robert', LastName from 'Robert'
--         to 'Chen', job_title from 'Rep' to 'Sales Manager', salary to a
--         realistic value, and manager_id to NULL (he is the top-level manager).
-- FIX 3: Sara Osei's department_id changed from 5 to 2 (Support/Ops) because
--         department 5 ('Marketing') does not exist when departments are
--         omitted, and 'Warehouse Lead' does not belong in Marketing.
INSERT INTO employees (FirstName, LastName, email, department_id, job_title, salary, manager_id, hire_date) VALUES
    ('Robert', 'Chen',      'robert.chen@techbazaar.com',     1, 'Sales Manager',        75000, NULL, '2018-03-01'),
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000, 1,    '2020-06-15'),
    ('Marcus', 'Webb',      'marcus.webb@techbazaar.com',     1, 'Sales Representative', 58000, 1,    '2021-09-01'),
    ('Elena',  'Garcia',    'elena.garcia@techbazaar.com',    1, 'Senior Sales Rep',     68000, 1,    '2019-11-20'),
    ('James',  'Okafor',    'james.okafor@techbazaar.com',    2, 'Support Lead',         72000, NULL, '2018-05-10'),
    ('Lily',   'Zhang',     'lily.zhang@techbazaar.com',      2, 'Support Agent',        48000, 5,    '2022-02-14'),
    ('Diego',  'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent',        46000, 5,    '2023-01-09'),
    ('Sara',   'Osei',      'sara.osei@techbazaar.com',       2, 'Warehouse Lead',       55000, NULL, '2020-08-23');

Select * FROM employees;
