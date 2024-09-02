create database view_db;
use view_db;
select database();

use northwind;

create view product_category_view as 
select products.productid, products.productname, categories.categoryname from 
products inner join categories on products.categoryid=categories.categoryid;

create view product_category_view as 
select products.productid, products.productname, categories.categoryname from 
products inner join categories where products.categoryid=categories.categoryid;

create view product_category_view as 
select products.productid, products.productname, categories.categoryname from 
products inner join categories using(categoryid);

select * from product_category_view;

select productid, productname from product_category_view;

select * from customers;

select * from orderdetails;

select * from orders;

create view customers_orderdetails as 
select customers.customerid, customers.companyname, sum(orderdetails.unitprice*orderdetails.quantity) as total_order_amount
from customers inner join orders on customers.customerid=orders.customerid
inner join orderdetails on orders.orderid=orderdetails.orderid
group by customers.customerid, customers.companyname;

select * from customers_orderdetails;

select database();

use northwind;

show tables;

select * from product_category_view;

select * from customers_orderdetails;

select orderid, productid, quantity, unitprice,
concat("¥", format(quantity*unitprice*160, 2)) as total_in_jpy
from orderdetails;

update product_category_view 
set productname="Updated Category Name" where 
productid=1;

select * from product_category_view;

select * from products;

delete from product_category_view 
where productid=1;

show tables;

drop view if exists product_category_view;

drop view if exists customers_orderdetails;