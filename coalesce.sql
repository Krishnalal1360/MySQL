create database coalesce_db;
select database();
use coalesce_db;
select database();

select * from where_db.customers;

select companyname, contactname, contacttitle, address, city, country, phone, fax from where_db.customers;

select contactname, contacttitle, country, coalesce(fax,"No fax number") as fax from where_db.customers;

select contactname, coalesce(phone,"No phone number") as phone from where_db.customers;

select * from where_db.employees;

select contactname, coalesce(phone, fax, "No contact information") as contact_info from where_db.customers;

select * from where_db.customers where contactname="Valon Hoti";

select * from where_db.employees;