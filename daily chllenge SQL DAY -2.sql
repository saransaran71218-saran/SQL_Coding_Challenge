


-- Create Books table with Primary Key
create database  online_bookstore1;
USE online_bookstore1;
create table books(
books_id int primary key,
books_name varchar(25));


-- Create Orders table with Foreign Key referencing Books(BookID)
create table orders(
orders_id varchar(50),
customer_name varchar(25),
customer_age int,
gender varchar(15),
books_id int,
foreign key(books_id) references books (books_id));

ALTER TABLE Books
ADD ISBN VARCHAR(20) UNIQUE;
SHOW INDEX FROM Books;
DELETE FROM Orders
WHERE OrderID IN (999, 1000);


















