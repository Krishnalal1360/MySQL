select * from where_db.customers;

select customerid as id, companyname as company, contactname as contact, city, country from where_db.customers;

select * from where_db.products;

select productid as id, productname as product, unitsinstock as "available units" from where_db.products;

select productid as id, productname as product, unitsinstock as available_units from where_db.products;

select * from where_db.suppliers;

select companyname as company, contactname as "name", contacttitle as title from where_db.suppliers; 