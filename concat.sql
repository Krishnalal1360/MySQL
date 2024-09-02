create database concat_db;
select database();
use concat_db;
select database();

select concat("My","SQL") as concatted_string;

select concat("I"," Love"," MySQL.") as "concatted string";

select * from where_db.customers;

select concat(contactname, ",   ", contacttitle) 
as customer_details from where_db.customers;

select * from where_db.employees;

select concat(titleofcourtesy, " ",firstname, " ", lastname, " - ", title) as employee_info from where_db.employees;

select * from where_db.products;

select concat(productname, ", (", quantityperunit, ")") as product_details from where_db.products;

select * from where_db.suppliers;

select concat("Company-", companyname, ", Contact-", contactname) 
as customer_info from where_db.suppliers;