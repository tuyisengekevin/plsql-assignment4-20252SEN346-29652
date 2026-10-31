
SET SERVEROUTPUT ON;

-- TEST 1: Update employee salary
BEGIN
    update_employee_salary(101, 10);
END;
/

-- Undo the salary change made by this test
ROLLBACK;

-- TEST 2: Display all employees
BEGIN
    display_employees;
END;
/

-- TEST 3: User-defined record
BEGIN
    display_employee_record(101);
END;
/

-- TEST 4: %ROWTYPE record
BEGIN
    display_employee_rowtype(101);
END;
/

-- TEST 5: Associative array
BEGIN
    display_salary_collection;
END;
/

-- TEST 6: Collection of employee records
BEGIN
    display_employee_collection;
END;
/

-- TEST 7: Implicit cursors
BEGIN
    demonstrate_implicit_cursors;
END;
/

-- TEST 8: BULK COLLECT and FORALL
BEGIN
    increase_all_salaries;
END;
/

-- TEST 9: Bulk error handling
BEGIN
    demonstrate_bulk_errors;
END;
/

ROLLBACK;
