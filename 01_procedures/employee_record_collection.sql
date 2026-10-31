
-- Assignment IV: Employee Management System
-- Demonstration: Collection of Records

CREATE OR REPLACE PROCEDURE display_employee_collection
IS
    -- Define an employee record
    TYPE employee_record_type IS RECORD (
        emp_id employees.employee_id%TYPE,
        emp_name employees.employee_name%TYPE,
        emp_salary employees.salary%TYPE
    );

    -- Define a collection of employee records
    TYPE employee_collection_type IS
        TABLE OF employee_record_type
        INDEX BY PLS_INTEGER;

    -- Declare collection
    v_employees employee_collection_type;

    v_index PLS_INTEGER := 0;

BEGIN
    -- Retrieve employees into the collection
    FOR emp IN (
        SELECT employee_id, employee_name, salary
        FROM employees
        ORDER BY employee_id
    )
    LOOP
        v_index := v_index + 1;

        v_employees(v_index).emp_id := emp.employee_id;
        v_employees(v_index).emp_name := emp.employee_name;
        v_employees(v_index).emp_salary := emp.salary;
    END LOOP;

    -- Display employee records
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE RECORD COLLECTION');
    DBMS_OUTPUT.PUT_LINE('---------------------------');

    FOR i IN 1 .. v_employees.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_employees(i).emp_id ||
            ' | Name: ' || v_employees(i).emp_name ||
            ' | Salary: ' || v_employees(i).emp_salary
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Total employees: ' || v_employees.COUNT
    );

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END display_employee_collection;
/
