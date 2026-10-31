
-- Assignment IV: Employee Management System
-- Procedure: Update Employee Salary

CREATE OR REPLACE PROCEDURE update_employee_salary (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
)
IS
    v_rows_updated NUMBER;
BEGIN
    -- Validate percentage
    IF p_percentage IS NULL OR p_percentage <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary increase percentage must be greater than zero.'
        );
    END IF;

    -- Update employee salary
    UPDATE employees
    SET salary = salary + (salary * p_percentage / 100)
    WHERE employee_id = p_employee_id;

    -- Check affected rows
    v_rows_updated := SQL%ROWCOUNT;

    IF v_rows_updated = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Employee ID not found.'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Salary updated successfully. Rows affected: '
        || v_rows_updated
    );

END update_employee_salary;
/
