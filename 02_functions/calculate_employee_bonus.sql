
CREATE OR REPLACE FUNCTION calculate_employee_bonus (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
)
RETURN NUMBER
IS
    v_salary employees.salary%TYPE;

    -- Declare a user-defined exception
    e_invalid_percentage EXCEPTION;

BEGIN
    -- Validate the bonus percentage
    IF p_percentage IS NULL
       OR p_percentage <= 0
       OR p_percentage > 100 THEN

        RAISE e_invalid_percentage;
    END IF;

    -- Retrieve employee salary
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    -- Calculate and return bonus
    RETURN v_salary * p_percentage / 100;

EXCEPTION
    WHEN e_invalid_percentage THEN
        RAISE_APPLICATION_ERROR(
            -20020,
            'Bonus percentage must be between 0 and 100.'
        );

    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20021,
            'Employee does not exist.'
        );
END calculate_employee_bonus;
/
