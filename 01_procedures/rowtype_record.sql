
-- Assignment IV: Employee Management System
-- Demonstration: %ROWTYPE Record

CREATE OR REPLACE PROCEDURE display_employee_rowtype (
    p_employee_id IN NUMBER
)
IS
    -- Automatically inherits employees table structure
    v_employee employees%ROWTYPE;

BEGIN
    -- Retrieve complete employee row
    SELECT *
    INTO v_employee
    FROM employees
    WHERE employee_id = p_employee_id;

    -- Display employee information
    DBMS_OUTPUT.PUT_LINE('%ROWTYPE RECORD');
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee.employee_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee.employee_name);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_employee.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_employee.salary);
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || v_employee.hire_date);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'Employee not found.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END display_employee_rowtype;
/
