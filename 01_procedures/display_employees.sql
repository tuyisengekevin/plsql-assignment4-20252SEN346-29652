
-- Assignment IV: Employee Management System
-- Procedure: Display All Employees

CREATE OR REPLACE PROCEDURE display_employees
IS
    CURSOR emp_cursor IS
        SELECT e.employee_id,
               e.employee_name,
               d.department_name,
               e.salary
        FROM employees e
        JOIN departments d
        ON e.department_id = d.department_id
        ORDER BY e.employee_id;

BEGIN
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE MANAGEMENT REPORT');
    DBMS_OUTPUT.PUT_LINE('--------------------------');

    FOR emp_record IN emp_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || emp_record.employee_id ||
            ' | Name: ' || emp_record.employee_name ||
            ' | Department: ' || emp_record.department_name ||
            ' | Salary: ' || emp_record.salary
        );

    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END display_employees;
/
