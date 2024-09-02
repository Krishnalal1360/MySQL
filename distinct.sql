create database distinct_db;
select database();
use distinct_db;
select database();

select * from where_db.customers;

select distinct city from where_db.customers;

select distinct country from where_db.customers;

select distinct city, country from where_db.customers;

select count(distinct city) as number_of_cities from where_db.customers;

select count(distinct country) as number_of_countries from where_db.customers;