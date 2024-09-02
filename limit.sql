create database limit_db;
select database();
use limit_db;
select database();

select * from where_db.customers;

select * from where_db.customers limit 3;

select * from where_db.employees limit 5;

select * from where_db.products;

select productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder from where_db.products
order by unitprice asc limit 1;

select productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder from where_db.products
order by unitprice desc limit 1;

select productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder from where_db.products
order by unitprice asc limit 3;

select productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder from where_db.products
order by unitprice desc limit 5;

select * from where_db.employees;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees
order by hiredate desc limit 1;

select employeeid, firstname, lastname, title, hiredate, city, country, salary from where_db.employees
order by hiredate asc limit 3;