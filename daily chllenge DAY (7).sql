CREATE DATABASE SalesDF;
USE SalesDF;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE
);
INSERT INTO Orders (CustomerID, OrderDate) VALUES
(101, '2025-11-15'),
(102, '2025-11-20'),
(103, '2025-11-25');
CREATE TABLE Order_History (
    HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER LogOrderDeletion
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Order_History (OrderID, CustomerID, OrderDate)
    VALUES (OLD.OrderID, OLD.CustomerID, OLD.OrderDate);
END //

DELIMITER ;
DELETE FROM Orders WHERE OrderID = 1;
SELECT * FROM Order_History;
CREATE USER 'junior_analyst'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON SalesDB.Orders TO 'junior_analyst'@'localhost';
GRANT SELECT ON SalesDB.Order_History TO 'junior_analyst'@'localhost';
SHOW GRANTS FOR 'junior_analyst'@'localhost';
REVOKE SELECT ON SalesDB.Orders FROM 'junior_analyst'@'localhost';
REVOKE SELECT ON SalesDB.Order_History FROM 'junior_analyst'@'localhost';

CREATE TABLE BankAccounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountHolder VARCHAR(100),
    Balance DECIMAL(10,2)
);

-- Sample data
INSERT INTO BankAccounts (AccountHolder, Balance) VALUES
('Alice', 5000.00),
('Bob', 3000.00);
START TRANSACTION;
UPDATE BankAccounts
SET Balance = Balance - 1000
WHERE AccountID = 1;
UPDATE BankAccounts
SET Balance = Balance + 1000
WHERE AccountID = 2;
SAVEPOINT TransferStep;
COMMIT;
ROLLBACK TO TransferStep;   -- undo only after the savepoint