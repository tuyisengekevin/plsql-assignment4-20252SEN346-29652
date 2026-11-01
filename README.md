# plsql-assignment4-20252SEN346-29652
Advanced Oracle PL/SQL - Records and Collections
# Employee Management System – Oracle PL/SQL

## 1. Project Description

The Employee Management System is a database application developed using Oracle SQL and PL/SQL.

It manages employee information, department information, and employee salaries. The project demonstrates advanced PL/SQL programming concepts, including records, collections, cursors, bulk processing, stored procedures, functions, and exception handling.

## 2. Group Members

| Full Name | Student ID |
|---|---|
| [TUYISENGE KEVIN] | [20252SEN346] |
| [MIHIGO WYCLIFF] | [29652] |

## 3. Technologies Used

- Oracle Database
- Oracle PL/SQL
- GitHub

## 4. Database Structure

The application contains two tables:

**Departments**
- department_id (Primary Key)
- department_name

**Employees**
- employee_id (Primary Key)
- employee_name
- department_id (Foreign Key)
- salary
- hire_date

One department can have multiple employees.

## 5. PL/SQL Features Implemented

- User-defined records
- `%ROWTYPE` records
- Associative arrays
- Collections of employee records
- Implicit cursors
- Explicit cursors
- `SQL%ROWCOUNT`, `SQL%FOUND`, and `SQL%NOTFOUND`
- `BULK COLLECT`
- `FORALL`
- `SAVE EXCEPTIONS`
- Stored procedures
- Stored functions
- Predefined and user-defined exceptions
- `RAISE_APPLICATION_ERROR`

## 6. Repository Structure

```text
plsql-assignment4-<studentID1>-<studentID2>/
│
├── README.md
├── .gitignore
│
├── 00_schema/
│   ├── 01_create_tables.sql
│   └── 02_insert_sample_data.sql
│
├── 01_procedures/
│   ├── update_employee_salary.sql
│   ├── display_employees.sql
│   ├── user_defined_record.sql
│   ├── rowtype_record.sql
│   ├── associative_array.sql
│   ├── employee_record_collection.sql
│   ├── implicit_cursors.sql
│   ├── bulk_collect_forall.sql
│   └── bulk_error_handling.sql
│
├── 02_functions/
│   ├── calculate_annual_salary.sql
│   └── calculate_employee_bonus.sql
│
├── 03_tests/
│   ├── 03_tests/test_success_cases.sql
│   └── 03_tests/test_error_cases.sql
│
├── screenshots/
│      └──<test_name>_output.png 
│
└── docs/
    └── IMPLEMENTATION_NOTES.md
```

## 7. How to Run the Project

Execute the scripts in the following order using Oracle SQL Developer or another compatible Oracle SQL environment:

1. Run `00_schema/01_create_tables.sql`.
2. Run `00_schema/02_insert_sample_data.sql`.
3. Compile all SQL files in `01_procedures/`.
4. Compile all SQL files in `02_functions/`.
5. Run the test scripts in `03_tests/`.
6. Review the execution results and screenshots.

Enable server output when testing procedures:

```sql
SET SERVEROUTPUT ON;
```

## 8. Testing

The project includes successful execution tests and error-handling tests.

Screenshots of test results are stored in the `screenshots/` directory.

## 9. Implementation Notes

Additional technical explanations and performance considerations are provided in:

`docs/IMPLEMENTATION_NOTES.md`

## 10. AI Assistance Disclosure

An AI assistant was used as a learning and development aid to help understand Oracle PL/SQL concepts, review code structure, and prepare explanations and test examples.

The group members are responsible for reviewing, testing, understanding, and explaining all submitted code.

## 11. Conclusion

This project demonstrates the application of advanced Oracle PL/SQL concepts in a practical Employee Management System.
