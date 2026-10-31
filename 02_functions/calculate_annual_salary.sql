
CREATE OR REPLACE FUNCTION calculate_annual_salary (
    p_employee_id IN employees.employee_id%TYPE
)
RETURN NUMBER
IS
    v_monthly_salary employees.salary%TYPE;
BEGIN
    SELECT salary
    INTO v_monthly_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    RETURN v_monthly_salary * 12;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'Employee ID not found.'
        );

    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(
            -20011,
            'More than one employee found.'
        );
END calculate_annual_salary;
/
