create database group_db;
select database();
use group_db;
select database();

select * from where_db.orderdetails;

select orderid, sum(unitprice*quantity) as total_price from where_db.orderdetails group by orderid;

select count(distinct productid) from where_db.products;

select count(distinct categoryid) from where_db.products;

select categoryid, count(productid) from where_db.products group by categoryid;

select categoryid, max(unitprice) as Max_price, min(unitprice) as Min_price from where_db.products group by categoryid;

select * from where_db.orders;

select orderid, shipname, shipcountry from where_db.orders;

select orderid, shipname, count(shipcountry) from where_db.orders
group by orderid;

select shipcountry, count(orderid) from where_db.orders
group by shipcountry;