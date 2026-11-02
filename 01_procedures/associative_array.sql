
-- Assignment IV: Employee Management System
-- Demonstration: Associative Array


CREATE OR REPLACE PROCEDURE display_salary_collection
IS
    -- Define an associative array
    TYPE salary_array IS TABLE OF NUMBER
    INDEX BY PLS_INTEGER;

    -- Declare collection variable
    v_salaries salary_array;

    v_index PLS_INTEGER := 0;

BEGIN
    -- Retrieve salaries and store them in the collection
    FOR emp IN (
        SELECT employee_name, salary
        FROM employees
        ORDER BY employee_id
    )
    LOOP
        v_index := v_index + 1;

        v_salaries(v_index) := emp.salary;
    END LOOP;

    -- Display collection values
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY COLLECTION');
    DBMS_OUTPUT.PUT_LINE('---------------------------');

    FOR i IN 1 .. v_salaries.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Index: ' || i ||
            ' | Salary: ' || v_salaries(i)
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Total salaries stored: ' || v_salaries.COUNT
    );

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END display_salary_collection;
/
