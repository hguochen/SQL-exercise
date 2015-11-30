

-- Select the last name of all employees.
SELECT lastName
FROM Employees;
-- 
-- Select the last name of all employees, without duplicates.
SELECT DISTINCT lastName
FROM Employees;

-- 
-- Select all the data of employees whose last name is "Smith".
SELECT *
FROM Employees
WHERE lastName = "Smith";

-- 
-- Select all the data of employees whose last name is "Smith" or "Doe".
SELECT *
FROM Employees
WHERE lastName = 'Smith'
OR lastName = 'Doe';

-- 
-- Select all the data of employees that work in department 14.
SELECT *
FROM Employees
WHERE department = 14;

-- Select all the data of employees that work in department 37 or department 77.
SELECT *
FROM Employees
WHERE department = 37
OR department = 77;

-- 
-- Select all the data of employees whose last name begins with an "S".
SELECT *
FROM Employees
WHERE lastName LIKE 'S%';

-- 
-- Select the sum of all the departments' budgets.
SELECT SUM(budget)
FROM DEPARTMENTS;



-- 
-- Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT Departments.code, COUNT(Employees.department)
FROM Employees
INNER JOIN Departments ON Departments.code = Employees.department
GROUP BY Employees.department;

-- 
-- Select all the data of employees, including each employee's department's data.
SELECT *
FROM Employees
LEFT OUTER JOIN Departments ON Employees.department = Departments.code;

-- 
-- Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT Employees.name, Employees.lastName, Departments.name, Departments.budget
FROM Employees
INNER JOIN Departments ON Departments.code = Employees.department;

/* Without labels */

/* With labels */


-- 
-- Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT Employees.name, Employees.lastName
FROM Employees
INNER JOIN Departments ON Employees.department = Departments.code
WHERE Departments.budget > 60000;

/* Without subquery */


/* With subquery */

-- 
-- Select the departments with a budget larger than the average budget of all the departments.
SELECT Departments.name, Departments.budget
FROM Departments
HAVING Departments.budget > (SELECT AVG(Departments.budget) FROM Departments);


-- 
-- Select the names of departments with more than two employees.
SELECT Departments.name
FROM Departments
WHERE code IN (
  SELECT department
  FROM Employees
  GROUP BY department
  HAVING COUNT(*) > 2
  );

/* With subquery */


/* With UNION. This assumes that no two departments have
   the same name */


-- !!!!!!!!!!!!!!!!!! Very Important
-- Select the name and last name of employees working for departments with second lowest budget.
-- get department with 2nd lowest budget
SELECT name, lastName
FROM employees
WHERE department = 
(SELECT temp.code
FROM (select * from departments order by budget limit 2) temp
ORDER BY temp.budget DESC LIMIT 1);


/* With subquery */
       

-- 
-- Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
INSERT INTO Departments (code, name, budget)
VALUES (11, 'Quality Assurance', 40000);


-- Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO Employees (SSN, name, lastName, department)
VALUES (847219811, "Mary", "Moore", 11);
-- 
-- Reduce the budget of all departments by 10%.
UPDATE Departments
SET budget = budget * 0.9;

-- 
-- Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE Employees
SET department = 77
WHERE department = 14;

-- Delete from the table all employees in the IT department (code 14).
DELETE FROM Employees
WHERE department = 14;

-- 
-- Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM Employees
WHERE department in (SELECT code
FROM Departments
WHERE budget >= 60000);

-- 
-- Delete from the table all employees.
DELETE FROM Employees;
