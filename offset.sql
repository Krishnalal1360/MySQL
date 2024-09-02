create database offset_db;
select database();
use offset_db;
select database();

select * from where_db.products;

select productid, productname, quantityperunit, unitprice from where_db.products
order by unitprice desc limit 1;

select productid, productname, quantityperunit, unitprice from where_db.products
order by unitprice desc limit 3;

select productid, productname, quantityperunit, unitprice from where_db.products
order by unitprice desc limit 1 offset 1;

select productid, productname, quantityperunit, unitprice from where_db.products
order by unitprice desc limit 2,1;

select * from where_db.employees;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees
order by salary desc;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees
order by salary desc limit 5 offset 4;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees
order by salary desc limit 4,5;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees
order by salary desc limit 9 offset 4;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees
order by salary desc limit 9999 offset 4;