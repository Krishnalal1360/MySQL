create database cast_db;
use cast_db;
select database();

select cast("123" as unsigned integer) as unsigned_integer;

select cast("2024-08-29 4:29:00" as date) as cast_date;

select cast("2024-08-30 4:30:00" as time) as cast_time;

select cast(1000 as decimal(5,2)) as cast_decimal;

use northwind;
select database();

select productname, unitprice from products;

select productname, unitprice, cast(unitprice*1.10 as decimal(5,2)) as new_price from products;

select * from orders;

select orderid, orderdate, cast(orderdate as char(7)) as "year_month" from orders;