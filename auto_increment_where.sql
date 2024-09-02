create database auto_increment_where;
select database();
use auto_increment_where;
select database();

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO users (name) VALUES ('Alice'); 
INSERT INTO users (name) VALUES ('Bob');  
INSERT INTO users (name) VALUES ('Charlie'); 
INSERT INTO users (name) VALUES ('David'); 
INSERT INTO users (name) VALUES ('Eve'); 
INSERT INTO users (name) VALUES ('Frank');  
INSERT INTO users (name) VALUES ('Grace');

select * from users;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50) DEFAULT 'USA'
);

INSERT INTO employees (id, name, country)
VALUES (1, 'John Doe', DEFAULT);

INSERT INTO employees (id, name)
VALUES (2, 'Ken Lee');

select * from employees;

ALTER TABLE employees 
MODIFY country VARCHAR(50) DEFAULT 'Canada';

INSERT INTO employees (id, name, country) 
VALUES (3, 'John Dan', DEFAULT);

select * from employees;
describe employees;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT
);

INSERT INTO students (id, name, age) VALUES (1, 'John Doe', 20);
INSERT INTO students (id, name, age) VALUES (2, 'Jane Smith', 22);
INSERT INTO students (id, name, age) VALUES (3, 'Alice Johnson', 19);
INSERT INTO students (id, name, age) VALUES (4, 'Bob Brown', 23);
INSERT INTO students (id, name, age) VALUES (5, 'Charlie Green', 21);

select * from students;
show tables;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Age, Department) VALUES
(1, 'John', 'Doe', 28, 'IT'),
(2, 'Alice', 'Smith', 32, 'Finance'),
(3, 'Bob', 'Brown', 45, 'Human Resources'),
(4, 'Eva', 'White', 29, 'Marketing'),
(5, 'Charlie', 'Green', 34, 'IT');

SELECT * FROM Employee
WHERE Department = 'Finance';

SELECT * FROM Employee
WHERE Age > 30;