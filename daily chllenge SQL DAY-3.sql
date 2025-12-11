
Codes used

CREATE DATABASE UniversityDB;
USE UniversityDB;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Faculty VARCHAR(100)
);
INSERT INTO Departments (DepartmentID, DepartmentName, Faculty) VALUES
(1, 'Computer Science', 'Engineering'),
(2, 'Mechanical', 'Engineering'),
(3, 'Computer Science', 'Engineering'),
(4, 'History', 'Arts'),
(5, 'History', 'Arts'),
(6, 'Physics', 'Science');
SELECT DISTINCT DepartmentName
FROM Departments;
SELECT DISTINCT DepartmentName
FROM Departments
WHERE Faculty = 'Engineering';

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(100)
);
INSERT INTO Students (StudentID, StudentName, Email) VALUES
(1, 'Alice', 'alice@uni.edu'),
(2, 'Bob', NULL),
(3, 'Clara', 'clara@uni.edu'),
(4, 'David', NULL),
(5, 'Emma', 'emma@uni.edu');
SELECT StudentID, StudentName, Email
FROM Students
WHERE Email IS NULL;
SELECT StudentID, StudentName, Email
FROM Students
WHERE Email IS NOT NULL;
ALTER TABLE Students
ADD GPA DECIMAL(3,2),
ADD Course VARCHAR(100);
INSERT INTO Students (StudentID, StudentName, Email, GPA, Course)
VALUES (6, 'Alice', 'alice@uni.edu', 3.8, 'Computer Science');
SELECT * FROM Students;
SELECT StudentID, StudentName
FROM Students
WHERE Email IS NULL;
SELECT StudentID, StudentName, Email
FROM Students
WHERE Email IS NOT NULL;
SELECT StudentID, StudentName, Course
FROM Students
WHERE Course IN ('Computer Science', 'Physics');
SELECT StudentID, StudentName, GPA
FROM Students
WHERE GPA BETWEEN 3.0 AND 4.0;
SELECT StudentID, StudentName, GPA
FROM Students
WHERE GPA NOT BETWEEN 3.0 AND 4.0;