# Implementation Notes – Employee Management System

## 1. Introduction

The Employee Management System is a database application developed using Oracle SQL and PL/SQL. It manages employee information, department information, and employee salaries.

The system demonstrates important PL/SQL programming concepts, including records, collections, implicit cursors, explicit cursors, bulk processing, stored procedures, functions, and exception handling.

## 2. Database Design

The application contains two main tables:

### Departments

Stores department information.

- `department_id`: Primary key.
- `department_name`: Department name, which must be unique and not null.

### Employees

Stores employee information.

- `employee_id`: Primary key.
- `employee_name`: Employee name, which cannot be null.
- `department_id`: Foreign key referencing the Departments table.
- `salary`: Employee salary, which must be greater than zero.
- `hire_date`: Employee hiring date.

### Relationship

One department can have many employees, while each employee belongs to one department.

The foreign key maintains referential integrity between the two tables.

## 3. PL/SQL Implementation

### 3.1 Records

The system demonstrates two types of records:

- **User-defined record:** Stores selected employee information, such as employee ID, name, salary, and department ID.
- **%ROWTYPE record:** Stores an entire employee row using the structure of the Employees table.

These records make it easier to handle related employee information together.

### 3.2 Collections

The system uses associative arrays to store and process multiple employee values.

The implementation includes:
- A salary collection that stores employee salaries.
- An employee record collection that stores employee IDs, names, and salaries.

Collections allow multiple related values to be processed in PL/SQL.

### 3.3 Implicit Cursors

Implicit cursors are demonstrated through INSERT, UPDATE, and DELETE statements.

The application uses:
- `SQL%ROWCOUNT` to identify the number of affected rows.
- `SQL%FOUND` to determine whether a statement affected at least one row.
- `SQL%NOTFOUND` to determine whether a statement affected no rows.

Oracle automatically manages implicit cursors.

### 3.4 Explicit Cursors

The application uses an explicit cursor to retrieve employee information together with department names.

A cursor FOR loop processes the retrieved records and displays an employee report.

### 3.5 Bulk Processing

The application demonstrates:

- `BULK COLLECT` to retrieve multiple employee IDs into a collection.
- `FORALL` to update multiple employee salaries.
- `SAVE EXCEPTIONS` to allow bulk DML processing to continue when individual operations fail.

#### Performance Considerations

Bulk processing can improve performance when handling large amounts of data.

In ordinary row-by-row processing, PL/SQL may communicate with the SQL engine repeatedly for each row. This creates additional context switching.

`BULK COLLECT` and `FORALL` reduce these repeated communications by processing data in batches.

For very large datasets, batch sizes should be controlled to avoid excessive memory consumption.

### 3.6 Stored Procedures

The application includes procedures for:

- Updating employee salaries.
- Displaying employee information.
- Processing user-defined records and `%ROWTYPE` records.
- Processing associative arrays and collections of employee records.
- Demonstrating implicit cursors.
- Demonstrating bulk processing and bulk error handling.

Procedures perform database operations and organize reusable PL/SQL logic.

### 3.7 Stored Functions

The application includes two functions:

**calculate_annual_salary**

Calculates an employee's annual salary by multiplying the monthly salary by 12.

**calculate_employee_bonus**

Calculates an employee's bonus using the employee's salary and a supplied percentage.

Both functions return numeric results and handle relevant exceptions.

## 4. Exception Handling

The application demonstrates predefined and user-defined exceptions.

Examples include:

- `NO_DATA_FOUND`: Raised when an employee cannot be found.
- `TOO_MANY_ROWS`: Demonstrated as a predefined exception handler.
- User-defined exception: Used when an invalid bonus percentage is supplied.
- `RAISE_APPLICATION_ERROR`: Returns meaningful application-specific error messages.
- Bulk DML exception handling: Uses `SAVE EXCEPTIONS` and `SQL%BULK_EXCEPTIONS`.

Unexpected errors are also handled and re-raised where appropriate.

## 5. Testing

The application includes test scripts for procedures and functions.

Testing covers:

- Successful employee salary updates.
- Displaying employee records.
- Collection processing.
- Implicit cursor operations.
- Bulk salary updates.
- Bulk DML errors.
- Annual salary calculations.
- Employee bonus calculations.
- Invalid percentages and nonexistent employee IDs.

Screenshots of successful executions and error-handling tests are stored in the `screenshots` directory.

## 6. Conclusion

The Employee Management System demonstrates how Oracle PL/SQL features can be combined to develop a practical database application.

It uses records and collections to organize data, cursors to retrieve and process information, bulk processing to improve efficiency, and procedures and functions to implement reusable operations.

Exception handling helps the application respond appropriately to invalid inputs and database errors.
