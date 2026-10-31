
-- Assignment IV: Employee Management System
-- Demonstration: User-defined PL/SQL Record

CREATE OR REPLACE PROCEDURE display_employee_record (
    p_employee_id IN NUMBER
)
IS
    -- Define a user-defined record
    TYPE employee_record_type IS RECORD (
        emp_id NUMBER,
        emp_name VARCHAR2(100),
        emp_salary NUMBER(10,2),
        dept_id NUMBER
    );

    -- Declare a record variable
    v_employee employee_record_type;

BEGIN
    -- Retrieve employee information
    SELECT employee_id,
           employee_name,
           salary,
           department_id
    INTO v_employee
    FROM employees
    WHERE employee_id = p_employee_id;

    -- Display record information
    DBMS_OUTPUT.PUT_LINE('USER-DEFINED RECORD');
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee.emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee.emp_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_employee.emp_salary);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_employee.dept_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Employee does not exist.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END display_employee_record;
/
