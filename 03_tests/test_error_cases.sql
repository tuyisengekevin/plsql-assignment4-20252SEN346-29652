SET SERVEROUTPUT ON;

-- TEST 1: Employee does not exist
BEGIN
    display_employee_record(999999);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Expected error: ' || SQLERRM
        );
END;
/

-- TEST 2: Invalid employee ID
BEGIN
    display_employee_rowtype(999999);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Expected error: ' || SQLERRM
        );
END;
/

-- TEST 3: Invalid salary percentage
BEGIN
    update_employee_salary(101, -10);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Expected error: ' || SQLERRM
        );
END;
/

-- TEST 4: Employee does not exist
BEGIN
    update_employee_salary(999999, 10);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Expected error: ' || SQLERRM
        );
END;
/

-- TEST 5: Invalid bonus percentage
DECLARE
    v_bonus NUMBER;
BEGIN
    v_bonus := calculate_employee_bonus(101, 150);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Expected error: ' || SQLERRM
        );
END;
/

-- TEST 6: Employee does not exist in function
DECLARE
    v_salary NUMBER;
BEGIN
    v_salary := calculate_annual_salary(999999);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Expected error: ' || SQLERRM
        );
END;
/
