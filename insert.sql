create database insert_query;
select database();
use insert_query;
select database();

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Age INT
);

INSERT INTO Users (UserName, Age) VALUES ('John Doe', 25);

select * from users;

INSERT INTO Users (UserName, Age) VALUES
('Alice', 30),
('Bob', 32),
('Charlie', 29);

select * from users;
show tables;
describe users;

CREATE TABLE TempUsers (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Age INT
);

INSERT INTO TempUsers (UserName, Age) VALUES ('Eva', 27);
select * from tempusers;

INSERT INTO Users (UserName, Age)
SELECT UserName, Age FROM TempUsers WHERE UserName = 'Eva';

select * from users;

INSERT INTO Users SET UserName = 'Frank', Age = 35;

select * from users;