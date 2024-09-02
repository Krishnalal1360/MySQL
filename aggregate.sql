create database aggregate_db;
select database();
use aggregate_db;
select database();

select count(unitprice) as "Unitprice counted" from where_db.products;

select sum(unitprice) as "Unitprice summed" from where_db.products;

select avg(unitprice) as "Unitprice averaged" from where_db.products;

select min(unitprice) as "Minimum unitprice", max(unitprice) as "Maximum unitprice" from where_db.products;