
CREATE OR REPLACE PROCEDURE demonstrate_bulk_errors
IS
    TYPE id_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE name_array IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;

    v_ids id_array;
    v_names name_array;

    e_bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_bulk_errors, -24381);

BEGIN
    -- Prepare three employee records
    v_ids(1) := 900101;
    v_ids(2) := 900102;
    v_ids(3) := 900101; -- Duplicate ID intentionally

    v_names(1) := 'Test Employee One';
    v_names(2) := 'Test Employee Two';
    v_names(3) := 'Duplicate Employee';

    -- Insert multiple records using FORALL
    FORALL i IN 1 .. 3 SAVE EXCEPTIONS
        INSERT INTO employees (
            employee_id,
            employee_name,
            department_id,
            salary,
            hire_date
        )
        VALUES (
            v_ids(i),
            v_names(i),
            1,
            300000,
            SYSDATE
        );

    DBMS_OUTPUT.PUT_LINE('All inserts completed successfully.');

EXCEPTION
    WHEN e_bulk_errors THEN
        DBMS_OUTPUT.PUT_LINE('Some bulk operations failed.');

        FOR i IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Failed operation index: ' ||
                SQL%BULK_EXCEPTIONS(i).ERROR_INDEX
            );

            DBMS_OUTPUT.PUT_LINE(
                'Error code: ' ||
                SQL%BULK_EXCEPTIONS(i).ERROR_CODE
            );
        END LOOP;

        ROLLBACK;

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END demonstrate_bulk_errors;
/
