create database join_db;
select database();
use join_db;
select database();

CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

INSERT INTO employees VALUES 
(10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'),
(10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21'),
(10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28'),
(10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01'),
(10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12'),
(10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1989-06-02'),
(10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', '1989-02-10'),
(10008, '1958-02-19', 'Saniya', 'Kalloufi', 'M', '1994-09-15'),
(10009, '1952-04-19', 'Sumant', 'Peac', 'F', '1985-02-18'),
(10010, '1963-06-01', 'Duangkaew', 'Piveteau', 'F', '1989-08-24');

select * from employees;
describe employees;

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, from_date)
);

INSERT INTO salaries VALUES 
(10001, 60117, '1986-06-26', '1987-06-26'),
(10002, 65828, '1996-08-03', '1997-08-03'),
(10003, 40006, '1995-12-03', '1996-12-02'),
(10004, 51990, '1986-12-01', '1987-12-01'),
(10005, 51370, '1989-09-12', '1990-09-12'),
(10006, 58586, '1989-06-02', '1990-06-02'),
(10007, 56389, '1989-02-10', '1990-02-10'),
(10008, 46671, '1994-09-15', '1995-09-15'),
(10009, 60929, '1985-02-18', '1986-02-18'),
(10010, 56974, '1989-08-24', '1990-08-24');

select * from salaries;
describe salaries;

select * from employees;
select * from salaries;

select first_name, last_name, salary from employees inner join salaries on employees.emp_no=salaries.emp_no;

select first_name, last_name, concat("$",format(salary,2)) as salary from employees inner join salaries on employees.emp_no=salaries.emp_no;

CREATE TABLE people (
  s_no INT,
  name VARCHAR(255)
);

INSERT INTO people (s_no, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(3, 'Diana'),
(4, 'Evan'),
(NULL, 'Fiona'),
(5, 'George');

select * from people;
describe people;

CREATE TABLE label (
  s_no INT,
  label_name CHAR(1)
);

INSERT INTO label (s_no, label_name) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(5, 'F'),
(NULL, 'G');

select * from label;
describe label;

select * from people;
select * from label;

select name, label_name from people inner join label on people.s_no=label.s_no;

select name, label_name from people join label on people.s_no=label.s_no;

select * from people;
select * from label;

select name, label_name from people left join label on people.s_no=label.s_no;

select name, label_name from people right join label on people.s_no=label.s_no;

(select name, label_name from people left join label on people.s_no=label.s_no) union all
(select name, label_name from people right join label on people.s_no=label.s_no);

(select name, label_name from people left join label on people.s_no=label.s_no) union
(select name, label_name from people right join label on people.s_no=label.s_no);

select name, label_name from people cross join label;

select name, label_name from people cross join label on people.s_no=label.s_no;

select * from people cross join label;

select name, label_name from people natural join label;

select * from people natural join label;

select name, label_name from people as p inner join label as l on p.s_no=l.s_no;

select database();
use join_db;
select database();
show tables;

select * from employees;

CREATE TABLE Employee (
    EmployeeID INT,
    Name VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employee (EmployeeID, Name, ManagerID) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Diana', 2),
(5, 'Evan', 2);

select * from employee;
describe employee;
select * from employees;
describe employees;

select e1.name as employee, e2.name as manager from employee e1 left join employee e2 on e1.managerid=e2.employeeid;

select e1.name as manager, e2.name as employee from employee e1 right join employee e2 on e1.employeeid=e2.managerid;

select * from people;
select * from label;

select people.name, label.label_name from people inner join label on people.s_no=label.s_no;

select p.name, l.label_name from people as p inner join label as l on p.s_no=l.s_no;

select a.s_no, name, b.s_no, label_name from people as a inner join label as b on a.s_no=b.s_no;

select people.name, label.label_name from people inner join label using(s_no);

select p.name, l.label_name from people as p inner join label as l using (s_no);

select a.s_no, name, b.s_no, label_name from people as a inner join label as b using(s_no);

select * from where_db.shippers;

select * from where_db.orders;

select a.shipperid, b.shipvia from where_db.shippers as a inner join where_db.orders as b on a.shipperid=b.shipvia;

select * from where_db.employees;
select * from where_db.orders;

select a.employeeid, b.employeeid from where_db.employees as a inner join where_db.orders as b 
on a.employeeid=b.employeeid;

select a.employeeid, b.employeeid from where_db.employees as a inner join where_db.orders as b 
using(employeeid);