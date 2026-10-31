
CREATE OR REPLACE PROCEDURE demonstrate_implicit_cursors
IS
    v_rows NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('IMPLICIT CURSOR DEMONSTRATION');

    -- 1. UPDATE
    UPDATE employees
    SET salary = salary + 1000
    WHERE employee_id = 101;

    v_rows := SQL%ROWCOUNT;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'UPDATE successful. Rows affected: ' || v_rows);
    ELSE
        DBMS_OUTPUT.PUT_LINE('UPDATE affected no rows.');
    END IF;

    -- 2. INSERT
    INSERT INTO employees (
        employee_id, employee_name, department_id, salary, hire_date
    )
    VALUES (
        900001, 'Test Employee', 1, 300000, SYSDATE
    );

    v_rows := SQL%ROWCOUNT;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'INSERT successful. Rows affected: ' || v_rows);
    END IF;

    -- 3. DELETE an existing test employee
    DELETE FROM employees
    WHERE employee_id = 900001;

    v_rows := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE(
        'DELETE affected rows: ' || v_rows);

    -- 4. Demonstrate SQL%NOTFOUND
    DELETE FROM employees
    WHERE employee_id = 999999;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'SQL%NOTFOUND is TRUE: no employee was deleted.');
    END IF;

    -- Undo all demonstration changes
    ROLLBACK;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END demonstrate_implicit_cursors;
/
