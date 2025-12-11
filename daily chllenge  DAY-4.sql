Codes used for outpput result 
CREATE DATABASE EcommerceDB;
USE EcommerceDB;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);
INSERT INTO Products (ProductName, Price) VALUES
('Laptop Pro', 1299.99),
('Wireless Headphones', 199.50),
('Smartphone X', 999.00),
('Gaming Monitor', 349.99),
('Mechanical Keyboard', 129.00),
('4K TV', 1799.00),
('Bluetooth Speaker', 89.99);
SELECT ProductID, ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3;
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;
SELECT ProductID, ProductName, Price
FROM Products
ORDER BY Price DESC, ProductName ASC
LIMIT 3;
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price >= 100
ORDER BY Price DESC
LIMIT 3;
USE EcommerceDB;
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2)
);
INSERT INTO Sales (ProductName, Quantity, Price) VALUES
('Laptop Pro', 2, 1299.99),
('Wireless Headphones', 5, 199.50),
('Smartphone X', 3, 999.00),
('Gaming Monitor', 4, 349.99),
('Bluetooth Speaker', 10, 89.99);
SELECT COUNT(*) AS TotalSales
FROM Sales;
SELECT SUM(Quantity * Price) AS TotalRevenue
FROM Sales;
SELECT AVG(Price) AS AveragePrice
FROM Sales;
SELECT MAX(Price) AS HighestPrice
FROM Sales;
SELECT MAX(Price) AS HighestPrice
FROM Sales;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);
INSERT INTO Employees (EmployeeName, DepartmentName) VALUES
('Alice', 'Computer Science'),
('Bob', 'Computer Science'),
('Clara', 'Computer Science'),
('David', 'Computer Science'),
('Emma', 'Computer Science'),
('Frank', 'Computer Science'),
('Grace', 'Computer Science'),
('Henry', 'Computer Science'),
('Ivy', 'Computer Science'),
('Jack', 'Computer Science'),
('Kevin', 'Computer Science'), -- 11th employee in CS
('Laura', 'Mechanical'),
('Mike', 'Mechanical'),
('Nina', 'Mechanical'),
('Oscar', 'Mechanical'),
('Paul', 'History'),
('Quinn', 'History'),
('Rita', 'Physics');
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 10;