create database format_db;
select database();
use format_db;
select database();

select * from where_db.products;

select productname, format(unitprice,2) as formatted_price from where_db.products; 

select * from where_db.orderdetails limit 5;

select orderid, format(sum(unitprice*quantity),2) as formatted_price from where_db.orderdetails
group by orderid;

select orderid, format((unitprice*quantity),2) as formatted_price from where_db.orderdetails;

select orderid, concat("$",format(sum(unitprice*quantity),2,"en_US")) as formatted_price from where_db.orderdetails
group by orderid;

select orderid, concat("€",format(sum(unitprice*quantity),2,"de_DE")) as formatted_price from where_db.orderdetails
group by orderid;

select firstname, lastname, title, hiredate, city, country, format(salary,2) as formatted_salary from where_db.employees;

select * from where_db.products;

select productid, productname, quantityperunit, format(unitprice,2) as formatted_price from where_db.products;