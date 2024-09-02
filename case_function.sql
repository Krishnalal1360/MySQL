create database case_function_db;
select database();
use case_function_db;
select database();

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Destination VARCHAR(100),
    Price DECIMAL(10,2) 
);

INSERT INTO Orders (OrderID, Destination, Price) VALUES
(1, 'USA', 100.00),
(2, 'Canada', 200.00),
(3, 'Mexico', 150.00),
(4, 'UK', 250.00);

SELECT * FROM Orders;
describe orders;

SELECT OrderID, Destination,
       CASE Destination
           WHEN 'USA' THEN 20
           WHEN 'Canada' THEN 30
           WHEN 'Mexico' THEN 25
           ELSE 40
       END AS ShippingRate
FROM Orders;

select * from orders;

select orderid, destination,
       case destination
            when "USA" then 20
            when "Canada" then 30
            when "Mexico" then 40
            else 50
		end as shipping_rate
from orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Category, Price) 
VALUES
(1, 'Smartphone', 'Electronics', 999.99),
(2, 'Jeans', 'Clothing', 79.99),
(3, 'Science Fiction Novel', 'Books', 19.99),
(4, 'Blender', 'Electronics', 49.99),
(5, 'T-shirt', 'Clothing', 29.99);

SELECT * FROM Products;
describe products;

SELECT ProductID, ProductName, Category, Price,
       CASE Category
           WHEN 'Electronics' THEN Price * 0.85
           WHEN 'Clothing' THEN Price * 0.90
           WHEN 'Books' THEN Price * 0.95
           ELSE Price * 0.98
       END AS DiscountedPrice
FROM Products;

select productid, productname, category, price,
       case category
            when "electronics" then 0.60*price
            when "clothing" then 0.70*price
            else 0.80*price
		end as discounted_price
from products;

show tables;

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Marks INT
);

INSERT INTO Students (ID, Name, Marks) VALUES
(1, 'Alice', 85),
(2, 'Bob', 75),
(3, 'Charlie', 55),
(4, 'Diana', 30);

select * from students;
describe students;

SELECT Name, Marks,
       CASE
           WHEN Marks > 80 THEN 'Excellent'
           WHEN Marks BETWEEN 60 AND 80 THEN 'Good'
           WHEN Marks BETWEEN 40 AND 60 THEN 'Average'
           ELSE 'Needs Improvement'
       END AS Classification
FROM Students;

select name, marks,
       case 
            when marks>80 then "Excellent"
            when marks between 60 and 80 then "Good"
            when marks between 40 and 60 then "Average"
            else "Needs Improvement"
		end as classification_report
from students;

CREATE TABLE EmployeePerformance (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Score INT
);

INSERT INTO EmployeePerformance (EmployeeID, EmployeeName, Score) VALUES
(1, 'John Doe', 85),
(2, 'Jane Smith', 78),
(3, 'Emily Jones', 55),
(4, 'Michael Brown', 30);

select * from employeeperformance;
describe employeeperformance;

SELECT EmployeeID, EmployeeName, Score,
       CASE 
           WHEN Score > 80 THEN 'Excellent'
           WHEN Score BETWEEN 60 AND 80 THEN 'Good'
           WHEN Score BETWEEN 40 AND 60 THEN 'Satisfactory'
           ELSE 'Needs Improvement'
       END AS Performance
FROM EmployeePerformance;

select employeeid, employeename, score,
	   case 
            when score>80 then "Excellent"
            when score between 60 and 80 then "Good"
            when score between 40 and 60 then "Satisfactory"
            else "Needs Improvement"
		end as performance_report
from employeeperformance;

CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(255),
    Department VARCHAR(255)
);

INSERT INTO Employees (EmployeeID, Name, Department) VALUES
(1, 'John Doe', 'Engineering'),
(2, 'Jane Smith', NULL),
(3, 'Emily Jones', 'Marketing'),
(4, 'Mark Brown', NULL);

SELECT * FROM Employees;
describe employees;

SELECT EmployeeID, Name,
       CASE 
           WHEN Department IS NULL THEN 'Unassigned'
           ELSE Department
       END AS Department
FROM Employees;

select  employeeid, name,
        case 
             when department is null then "Unassigned"
             else department
		end as department
from employees;

CREATE TABLE Orders_table (
    OrderID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Orders_table (OrderID, Amount) VALUES
(1, 50.00),
(2, 150.00),
(3, 300.00),
(4, 600.00);

select * from orders_table;
describe orders_table;

WITH OrderLevels AS (
    SELECT OrderID, Amount,
           CASE
               WHEN Amount <= 100 THEN 'Small'
               WHEN Amount <= 500 THEN 'Medium'
               ELSE 'Large'
           END AS OrderLevel
    FROM Orders_table
)
SELECT orderlevel, AVG(Amount) AS AverageAmount
FROM OrderLevels
GROUP BY OrderLevel;

with orderlevels as (
select orderid, amount,
	   case 
            when amount<=100 then "small"
            when amount<=500 then "medium"
            else "large"
		end as orderlevel
from orders_table)
select orderlevel, avg(amount) as average_amount from orderlevels group by orderlevel;


