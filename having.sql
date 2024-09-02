create database having_db;
select database();
use having_db;
select database();

select * from where_db.orderdetails;

select orderid, sum(unitprice*quantity) as total_price from where_db.orderdetails
group by orderid;

select orderid, sum(unitprice*quantity) as total_price from where_db.orderdetails
group by orderid having total_price>=1000.00;

select * from where_db.products;

select categoryid, count(productid) as number_of_products from where_db.products group by categoryid having number_of_products>=5;