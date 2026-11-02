CREATE OR REPLACE PROCEDURE increase_all_salaries
IS
    -- Declare a collection to store employee IDs
    TYPE employee_id_table IS TABLE OF employees.employee_id%TYPE;

    v_employee_ids employee_id_table;

BEGIN
    -- Step 1: Collect all employee IDs
    SELECT employee_id
    BULK COLLECT INTO v_employee_ids
    FROM employees;

    DBMS_OUTPUT.PUT_LINE(
        'Number of employees found: ' || v_employee_ids.COUNT
    );

    -- Step 2: Check whether employees were found
    IF v_employee_ids.COUNT > 0 THEN

        -- Step 3: Update all salaries using FORALL
        FORALL i IN 1 .. v_employee_ids.COUNT
            UPDATE employees
            SET salary = salary * 1.10
            WHERE employee_id = v_employee_ids(i);

        -- Step 4: Display the number of updated employees
        DBMS_OUTPUT.PUT_LINE(
            'Employees updated: ' || SQL%ROWCOUNT
        );

    ELSE
        DBMS_OUTPUT.PUT_LINE('No employees found.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        RAISE;
END;
/
