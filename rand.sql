create database rand_db;
select database();
use rand_db;
select database();

select rand() as randnumber;

select rand(1) as randnumber;

select rand(9999) as randnumber;

select * from where_db.customers;

select * from where_db.customers
order by rand() limit 1;

select * from where_db.customers
order by rand(1) limit 3;

select * from where_db.employees
order by rand(0) limit 2;

select * from where_db.orders
order by rand(2) limit 5;

select * from where_db.products
order by rand(3) limit 10;

select * from where_db.suppliers
order by rand(4) limit 20;