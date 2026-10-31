
CREATE OR REPLACE PROCEDURE increase_all_salaries
IS
    -- Collection to hold employee IDs
    TYPE employee_id_table IS TABLE OF employees.employee_id%TYPE;

    v_employee_ids employee_id_table;
BEGIN
    -- BULK COLLECT retrieves all employee IDs at once
    SELECT employee_id
    BULK COLLECT INTO v_employee_ids
    FROM employees;

    DBMS_OUTPUT.PUT_LINE(
        'Employees collected: ' || v_employee_ids.COUNT
    );

    -- FORALL updates salaries in batches
    FORALL i IN 1 .. v_employee_ids.COUNT
        UPDATE employees
        SET salary = salary * 1.10
        WHERE employee_id = v_employee_ids(i);

    DBMS_OUTPUT.PUT_LINE(
        'Employees updated: ' || SQL%ROWCOUNT
    );

    ROLLBACK;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END increase_all_salaries;
/
