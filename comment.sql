create database comment_db;
select database();
use comment_db;
select database();

-- selecting each rows and columns of products table
select * from where_db.products;

# selecting each rows with columns of productid, productname, quantityperunit, unitprice of products table
select productid, productname, quantityperunit, unitprice from where_db.products;

/*
select productid, productname, unitprice, unitsinstock, unitsonorder of products table
*/
select productid, productname, unitprice, unitsinstock, unitsonorder from where_db.products;