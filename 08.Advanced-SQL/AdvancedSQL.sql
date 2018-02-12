USE TelerikAcademy
--01.Write a SQL query to find the names and salaries of the employees that take the minimal salary in the company.
--Use a nested SELECT statement.

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary = 
 (SELECT MIN(Salary) FROM Employees)

 --02.Write a SQL query to find the names and salaries of the employees that have a salary that is up to 10% higher
 --than the minimal salary for the company.

SELECT FirstName, LastName, Salary
FROM Employees
Where Salary  <
 (SELECT  MIN(Salary) + MIN(Salary) / 10 FROM Employees)

 --03.Write a SQL query to find the full name, salary and department of the employees 
 --that take the minimal salary in their department.Use a nested SELECT statement.

 SELECT  FirstName + LastName AS FullName, Salary, e.DepartmentID
 FROM Employees e
 WHERE Salary = 
  (SELECT MIN(Salary) FROM Employees  WHERE e.DepartmentID = DepartmentID)
 
 --04.Write a SQL query to find the average salary in the department #1.

 SELECT  AVG(Salary) AS AVGSalary
 FROM Employees 
 WHERE DepartmentID = 1

 --05.Write a SQL query to find the average salary in the "Sales" department.

 SELECT AVG(Salary)
 FROM Employees e
 JOIN Departments d 
 ON e.DepartmentID = d.DepartmentID 
 WHERE d.Name = 'Sales'

 --06.Write a SQL query to find the number of employees in the "Sales" department.

 SELECT COUNT(*)
 FROM Employees e, Departments d
 WHERE e.DepartmentID = d.DepartmentID AND d.Name = 'Sales'

 --07.Write a SQL query to find the number of all employees that have manager.

 SELECT COUNT(FirstName) AS NumberOfEmployeesWithManagers
 FROM Employees
 WHERE Employees.ManagerID IS NOT NULL

 --08.Write a SQL query to find the number of all employees that have no manager.
 
 SELECT COUNT(FirstName) AS NumberOfEmployeesWithoutManagers
 FROM Employees
 WHERE Employees.ManagerID IS NULL

 --09.Write a SQL query to find all departments and the average salary for each of them.

 SELECT d.Name ,AVG(Salary) AS AverageSalary
 FROM Employees e, Departments d
 WHERE e.DepartmentID = d.DepartmentID
 GROUP BY d.Name

 --10.Write a SQL query to find the count of all employees in each department and for each town.

 SELECT d.Name AS DepartmentName, t.Name AS TownName, COUNT(e.FirstName) AS NumberOfEmployees
 FROM Employees e ,Addresses a, Towns t, Departments d
 WHERE e.DepartmentID = d.DepartmentID 
       AND e.AddressID = a.AddressID 
       AND a.TownID = t.TownID 
 GROUP BY d.Name , t.Name
 ORDER BY d.Name

 --11.Write a SQL query to find all managers that have exactly 5 employees. Display their first name and last name.

SELECT m.FirstName, m.LastName
FROM Employees m, Employees e
WHERE e.ManagerID = m.EmployeeID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(*) = 5

--12.Write a SQL query to find all employees along with their managers. For employees that do not have manager 
--display the value "(no manager)".

SELECT e.FirstName, e.LastName, ISNULL(m.FirstName,'no manager') AS ManagerName
FROM Employees e
LEFT OUTER JOIN Employees m 
ON e.ManagerID = m.EmployeeID

--13.Write a SQL query to find the names of all employees whose last name is exactly 5 characters long. 
--Use the built-in LEN(str) function.

SELECT FirstName, LastName
FROM Employees
WHERE LEN(LastName) = 5

--14.Write a SQL query to display the current date and time in the 
--following format "day.month.year hour:minutes:seconds:milliseconds".

SELECT CONVERT(varchar, GETDATE(),113 )

--15.Write a SQL statement to create a table Users. Users should have username, password, full name and last login time.
--Choose appropriate data types for the table fields. Define a primary key column with a primary key constraint.
--Define the primary key column as identity to facilitate inserting records.
--Define unique constraint to avoid repeating usernames.
--Define a check constraint to ensure the password is at least 5 characters long.

CREATE TABLE Users (
 [UserID] int IDENTITY,
 [Username] NVARCHAR(50) NOT NULL,
 [Password] NVARCHAR(50) NOT NULL,
 [FullName] NVARCHAR(50) NOT NULL,
 [LastLogin] DATETIME NOT NULL,
 CONSTRAINT UC_Constraint UNIQUE (Username),
 CONSTRAINT CHK_Password CHECK (DATALENGTH([Password]) < 5)
 )
 GO
 --16.Write a SQL statement to create a view that displays the users from the Users table that have
 --been in the system today.Test if the view works correctly.

 CREATE VIEW [DisplayUsers] AS
 SELECT Username
 FROM Users
 WHERE   CONVERT(date,LastLogin) = CONVERT(date,GETDATE()) 
 GO

 SELECT * FROM[DisplayUsers]

--17.Write a SQL statement to create a table Groups. Groups should have unique name (use unique constraint).
--Define primary key and identity column.

CREATE TABLE Groups (
[GroupID] INT NOT NULL IDENTITY PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL UNIQUE)
GO

--18.Write a SQL statement to add a column GroupID to the table Users.
--Fill some data in this new column and as well in the `Groups table.
--Write a SQL statement to add a foreign key constraint between tables Users and Groups tables.

ALTER TABLE Users
ADD GroupID INT NOT NULL
GO

ALTER TABLE Users
ADD CONSTRAINT FK_UsersGroups
FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)

--19.Write SQL statements to insert several records in the Users and Groups tables.

INSERT INTO Groups
VALUES 
(1),
(2),
(3)
GO

INSERT INTO Users
values 
('JohnD', 'johny_bravo', 'John Doe', GetDate(), 1),
('JaneD', 'janeIsInsane', 'Jane Doe', GetDate(), 2),
('JimmyD', 'hendrix4Life', 'Jimmy Doe', GetDate(), 3)
GO

--20.Write SQL statements to update some of the records in the Users and Groups tables.

UPDATE Groups
SET	Name = 'SomeNerds'
Where GroupID = 1
GO

UPDATE Users
SET FullName = 'Pesho'
WHERE UserID = 4
GO

--21.Write SQL statements to delete some of the records from the Users and Groups tables.

DELETE FROM Groups 
WHERE GroupID = 1
GO

DELETE FROM Users
WHERE Username = 'Pesho'
GO

--22.Write SQL statements to insert in the Users table the names of all employees from the Employees table.
--Combine the first and last names as a full name.
--For username use the first letter of the first name + the last name (in lowercase).
--Use the same for the password, and NULL for last login time.

INSERT INTO Users(Username, FullName, [Password],LastLogin)
SELECT SUBSTRING(FirstName,1,1) + SUBSTRING(LastName,LEN(LastName) - 1,1) ,FirstName + ' ' + LastName, NULL
FROM Employees	
GO

--23.Write a SQL statement that changes the password to NULL for all users
-- that have not been in the system since 10.03.2010.

UPDATE Users
SET Passwordd = NULL
WHERE CONVERT(date,LastLogin) < CONVERT(date,'10.03.2010')
GO

--24.Write a SQL statement that deletes all users without passwords (NULL password).

DELETE FROM Users
WHERE [Passwordd] IS NULL
GO

--25.Write a SQL query to display the average employee salary by department and job title.

SELECT d.Name, e.JobTitle, AVG(Salary) AS AverageSalary
FROM Employees e, Departments d
WHERE e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle

--26.Write a SQL query to display the minimal employee salary by department and job title along with
-- the name of some of the employees that take it.

SELECT d.Name, e.JobTitle, e.FirstName, e.LastName,  MIN(Salary) AS MinSalary
FROM Employees e, Departments d
WHERE e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle, e.FirstName, e.LastName

--27.Write a SQL query to display the town where maximal number of employees work.

SELECT TOP 1 t.Name AS Town, COUNT(*) AS EmployeesCount
FROM Employees e
	JOIN Addresses a
		ON e.AddressID = a.AddressID
	JOIN Towns t
		ON a.TownID = t.TownID
GROUP BY t.Name
ORDER BY EmployeesCount DESC

--28.Write a SQL query to display the number of managers from each town.

SELECT  t.Name as TownName, COUNT(DISTINCT m.FirstName) as NumberOfPeople
FROM Employees e, Employees m, Addresses a, Towns t
WHERE e.ManagerID = m.EmployeeID AND m.AddressID = a.AddressID AND a.TownID = t.TownID
GROUP BY t.Name

--29.Write a SQL to create table WorkHours to store work reports for each employee (employee id, date, task, hours, comments).
--Don't forget to define identity, primary key and appropriate foreign key.
--Issue few SQL statements to insert, update and delete of some data in the table.
--Define a table WorkHoursLogs to track all changes in the WorkHours table with triggers.
--For each change keep the old record data, the new record data and the command (insert / update / delete).

CREATE TABLE WorkHours(
[WorkHoursID] INT IDENTITY PRIMARY KEY,
[EmployeeID] INT FOREIGN KEY REFERENCES Employees(EmployeeID) ,
[Date] DATE NOT NULL,
[Task] NVARCHAR(200) NOT NULL,
[Hours] TIME NOT NULL,
[Comments] NVARCHAR(200)
)
GO

INSERT INTO WorkHours([EmployeeID],[Date],[Task],[Hours],[Comments])
VALUES (1,'12.2.2018','To develop Web Site','1:25','This project is so important')
GO

UPDATE WorkHours 
SET Task = NULL
WHERE WorkHoursID = 1
GO

DELETE FROM WorkHours
WHERE Hours = 0
GO



--30.Start a database transaction, delete all employees from the 'Sales' department along 
--with all dependent records from the pother tables. At the end rollback the transaction.

BEGIN TRAN 

DELETE Employees
FROM Employees e ,Departments d
WHERE e.DepartmentID = d.DepartmentID AND d.DepartmentID = 'Sales'

ROLLBACK TRAN

--31.Start a database transaction and drop the table EmployeesProjects.
--Now how you could restore back the lost table data?

BEGIN TRAN

DROP TABLE EmployeesProjects

ROLLBACK TRAN

--32.Find how to use temporary tables in SQL Server.
--Using temporary tables backup all records from EmployeesProjects and restore them back after dropping and re-creating the table.

SELECT *
INTO #EmployeesProjectsBackUp
FROM EmlpoyeesProjects