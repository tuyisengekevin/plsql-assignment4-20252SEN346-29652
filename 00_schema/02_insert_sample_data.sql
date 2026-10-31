
-- Insert departments
INSERT INTO departments VALUES (1, 'IT');
INSERT INTO departments VALUES (2, 'Finance');
INSERT INTO departments VALUES (3, 'Human Resources');

-- Insert employees
INSERT INTO employees
VALUES (101, 'Kevin', 1, 500000, DATE '2025-01-10');

INSERT INTO employees
VALUES (102, 'Eric', 2, 600000, DATE '2024-05-15');

INSERT INTO employees
VALUES (103, 'Alice', 1, 450000, DATE '2025-03-20');

INSERT INTO employees
VALUES (104, 'David', 3, 550000, DATE '2023-08-12');

INSERT INTO employees
VALUES (105, 'Sarah', 2, 700000, DATE '2022-06-01');

COMMIT;
