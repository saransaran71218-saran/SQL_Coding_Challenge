CREATE DATABASE UniversityDE;
USE UniversityDE;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100)
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Students (StudentName) VALUES
('Alice'),
('Bob'),
('Clara'),
('David');
INSERT INTO Courses (CourseName) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Physics'),
('History');
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1), -- Alice → Computer Science
(2, 2), -- Bob → Mechanical Engineering
(3, 3), -- Clara → Physics
(4, 4); -- David → History
SELECT s.StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;
SELECT s.StudentName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;
CREATE TABLE CurrentEmployees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);

CREATE TABLE PastEmployees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);
INSERT INTO CurrentEmployees (EmployeeName, DepartmentName) VALUES
('Alice', 'Computer Science'),
('Bob', 'Mechanical'),
('Clara', 'Physics'),
('David', 'History');
INSERT INTO PastEmployees (EmployeeName, DepartmentName) VALUES
('Emma', 'Mathematics'),
('Bob', 'Mechanical'),   -- Bob appears in both tables
('Frank', 'Computer Science');
SELECT EmployeeName, DepartmentName
FROM CurrentEmployees
UNION
SELECT EmployeeName, DepartmentName
FROM PastEmployees;
SELECT EmployeeName, DepartmentName
FROM CurrentEmployees
UNION ALL
SELECT EmployeeName, DepartmentName
FROM PastEmployees;
SELECT EmployeeName, UPPER(EmployeeName) AS UpperCaseName
FROM CurrentEmployees;
SELECT EmployeeName, LOWER(EmployeeName) AS LowerCaseName
FROM CurrentEmployees;
SELECT EmployeeName, SUBSTRING(EmployeeName, 1, 3) AS ShortName
FROM CurrentEmployees;
SELECT CONCAT(EmployeeName, ' - ', DepartmentName) AS EmployeeReport
FROM CurrentEmployees;
ALTER TABLE CurrentEmployees
ADD HireDate DATE;
UPDATE CurrentEmployees
SET HireDate = '2018-06-15'
WHERE EmployeeID = 1;
UPDATE CurrentEmployees
SET HireDate = '2020-01-10'
WHERE EmployeeID = 2;
UPDATE CurrentEmployees
SET HireDate = '2019-09-05'
WHERE EmployeeID = 3;
UPDATE CurrentEmployees
SET HireDate = '2021-03-20'
WHERE EmployeeID = 4;
SELECT EmployeeName, YEAR(HireDate) AS HireYear
FROM CurrentEmployees;
SELECT EmployeeName, DATEDIFF(NOW(), HireDate) AS DaysWorked
FROM CurrentEmployees;
SELECT EmployeeName,
       HireDate,
       ROUND(DATEDIFF(NOW(), HireDate) / 365, 1) AS TenureYears
FROM CurrentEmployees;
SELECT EmployeeName,
       ROUND(DATEDIFF(NOW(), HireDate) / 365, 1) AS TenureYears,
       CASE
           WHEN DATEDIFF(NOW(), HireDate) / 365 < 5 THEN 'Junior'
           WHEN DATEDIFF(NOW(), HireDate) / 365 BETWEEN 5 AND 10 THEN 'Mid-Level'
           ELSE 'Senior'
       END AS TenureCategory
FROM CurrentEmployees;
ALTER TABLE Students
ADD FirstName VARCHAR(50),
ADD LastName VARCHAR(50);
UPDATE Students SET FirstName = 'Alice', LastName = 'Johnson' WHERE StudentID = 1;
UPDATE Students SET FirstName = 'Bob', LastName = 'Smith' WHERE StudentID = 2;
UPDATE Students SET FirstName = 'Clara', LastName = 'Brown' WHERE StudentID = 3;
UPDATE Students SET FirstName = 'David', LastName = 'Lee' WHERE StudentID = 4;
DELIMITER //

CREATE FUNCTION GetFullName(fName VARCHAR(50), lName VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(fName, ' ', lName);
END //
---Procedures & Views----
DELIMITER ;
SELECT StudentID, FirstName, LastName, GetFullName(FirstName, LastName) AS FullName
FROM Students;


DELIMITER //

CREATE PROCEDURE GetEmployeeDetails(IN emp_id INT)
BEGIN
    SELECT EmployeeID, EmployeeName, DepartmentName, HireDate
    FROM CurrentEmployees
    WHERE EmployeeID = emp_id;
END //

DELIMITER ;
CALL GetEmployeeDetails(2);
CALL GetEmployeeDetails(3);
CALL GetEmployeeDetails(2);  -- returns employee details
CALL GetEmployeeDetails(99); -- returns message if not found
CREATE VIEW EmployeeDepartmentView AS
SELECT EmployeeName, DepartmentName
FROM CurrentEmployees;
-- Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentID INT
);

-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100)
);

-- Salaries table
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    SalaryAmount DECIMAL(10,2)
);
CREATE VIEW EmployeeDetailsView AS
SELECT e.EmployeeID,
       e.EmployeeName,
       d.DepartmentName,
       s.SalaryAmount
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
INNER JOIN Salaries s ON e.EmployeeID = s.EmployeeID;
SELECT * FROM EmployeeDetailsView;