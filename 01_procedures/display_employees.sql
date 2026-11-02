CREATE OR REPLACE PROCEDURE display_employees
IS
    CURSOR emp_cursor IS
        SELECT e.employee_id,
               e.employee_name,
               d.department_name,
               e.salary
        FROM employees e
        LEFT JOIN departments d
        ON e.department_id = d.department_id
        ORDER BY e.employee_id;

    v_count NUMBER := 0;

BEGIN
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE MANAGEMENT REPORT');

    FOR emp_record IN emp_cursor LOOP

        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || emp_record.employee_id ||
            ' | Name: ' || emp_record.employee_name ||
            ' | Department: ' || emp_record.department_name ||
            ' | Salary: ' || emp_record.salary
        );

    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employees found.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END display_employees;
/
