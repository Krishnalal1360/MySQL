create database orderby_db;
select database();
use orderby_db;
select database();

select * from where_db.employees;

select employeeid, titleofcourtesy, firstname, lastname, title, city, country, hiredate, salary from where_db.employees 
order by hiredate asc;

select employeeid, titleofcourtesy, firstname, lastname, title, city, country, hiredate, salary from where_db.employees 
order by salary desc;

select * from where_db.products;

select productid, productname, quantityperunit, unitprice, unitsinstock from where_db.products
order by unitsinstock desc;

select productid, productname, supplierid, categoryid, quantityperunit, unitprice from where_db.products 
order by categoryid asc, unitprice desc;