
SET SERVEROUTPUT ON;

-- TEST 1: Calculate annual salary
SELECT calculate_annual_salary(101) AS annual_salary
FROM dual;

-- TEST 2: Calculate a 10% employee bonus
SELECT calculate_employee_bonus(101, 10) AS employee_bonus
FROM dual;

-- TEST 3: Calculate a 20% employee bonus
SELECT calculate_employee_bonus(102, 20) AS employee_bonus
FROM dual;


-- ERROR TESTS
-- Run these separately because they intentionally raise errors.

-- TEST 4: Employee does not exist
-- SELECT calculate_annual_salary(999999) FROM dual;

-- TEST 5: Invalid bonus percentage
-- SELECT calculate_employee_bonus(101, -5) FROM dual;

-- TEST 6: Bonus percentage exceeds 100
-- SELECT calculate_employee_bonus(101, 150) FROM dual;

-- TEST 7: Bonus employee does not exist
-- SELECT calculate_employee_bonus(999999, 10) FROM dual;
