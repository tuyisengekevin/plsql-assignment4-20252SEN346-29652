-- Assignment IV: Employee Management System
-- File: 01_create_tables.sql

CREATE TABLE departments (
    department_id NUMBER NOT NULL PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100) NOT NULL,
    department_id NUMBER,
    salary NUMBER(10,2) NOT NULL,
    hire_date DATE DEFAULT SYSDATE,

    CONSTRAINT fk_employee_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id),

    CONSTRAINT chk_employee_salary
    CHECK (salary > 0)
);
