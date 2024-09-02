create database key_db;
select database();
use key_db;
select database();

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (EmployeeID)
);

INSERT INTO Employees (FirstName, LastName, PhoneNumber) VALUES
('Alice', 'Smith', '123-456-7890'),
('Bob', 'Johnson', '234-567-8901'),
('Charlie', 'Brown', '345-678-9012');

ALTER TABLE Employees
ADD UNIQUE (PhoneNumber);

describe employees;
select * from employees;

CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DOB DATE
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    PublishedDate DATE,
    Genre VARCHAR(100),
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
