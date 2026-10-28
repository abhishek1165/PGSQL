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

INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date) VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, 1,    '2020-06-15'),
    ('Fake',   'Robert',    'robert.chen@techbazaar.com',     1, 'Rep',                  50000.00, 1,    '2024-01-01'),
    ('Marcus', 'Webb',      'marcus.webb@techbazaar.com',     1, 'Sales Representative', 58000.00, 1,    '2021-09-01'),
    ('Elena',  'Garcia',    'elena.garcia@techbazaar.com',    1, 'Senior Sales Rep',     68000.00, 1,    '2019-11-20'),
    ('James',  'Okafor',    'james.okafor@techbazaar.com',    2, 'Support Lead',         72000.00, NULL, '2018-05-10'),
    ('Lily',   'Zhang',     'lily.zhang@techbazaar.com',      2, 'Support Agent',        48000.00, 5,    '2022-02-14'),
    ('Diego',  'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent',        46000.00, 5,    '2023-01-09'),
    ('Sara',   'Osei',      'sara.osei@techbazaar.com',       5, 'Warehouse Lead',       55000.00, NULL, '2020-08-23');

    Select * FROM employees;
 
 