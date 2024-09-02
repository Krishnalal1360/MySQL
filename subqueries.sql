create database subqueries_db;
select database();
use subqueries_db;
select database();

use northwind;
select database();

select productname, unitprice, categoryid from 
products where categoryid=1;

select productname, unitprice from products
where categoryid=(select categoryid from categories where categoryname="beverages");

select productname, unitprice from products where unitprice=(select max(unitprice) from products);

select productname, quantityperunit, unitsinstock from products
where (quantityperunit, unitsinstock)=(select quantityperunit, unitsinstock from products
order by productname asc limit 1);

select productname, unitprice from products
where productid in (
select productid from orderdetails 
group by productid 
having sum(quantity)>100);

select database();
use northwind;
select database();

select * from products;

select categoryid, productname, unitprice from products
where unitprice>(select avg(unitprice) from products where categoryid=products.categoryid);

select productname, unitprice,
       case
           when unitprice>(select avg(unitprice) from products where categoryid=products.categoryid) then "Above Average"
           else "Not Above Average"
	  end as price_status
from products;

select productname, unitprice from products where
unitprice<(select avg(unitprice) from products);

select productname, unitprice from products where
unitprice>(select avg(unitprice) from products);

select categoryname from categories
where exists(
select 1 from products where products.categoryid=categories.categoryid and products.discontinued=1);

select categoryname from categories
where exists(
select * from products where products.categoryid=categories.categoryid and products.discontinued=1);

select database();
use northwind;
select database();

select companyname from suppliers;

select companyname from suppliers where not exists
(select * from products where products.supplierid=suppliers.supplierid and products.discontinued=0);

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Products
    WHERE CategoryID = (
        SELECT CategoryID
        FROM (
            SELECT CategoryID, AVG(UnitPrice) AS AvgPrice
            FROM Products
            GROUP BY CategoryID
            ORDER BY AvgPrice DESC
            LIMIT 1
        ) AS MostExpensiveCategory
    )
);

select productname, unitprice from products where
unitprice>(select avg(unitprice) from products where 
categoryid=(select categoryid from
(select categoryid, avg(unitprice) as avg_price from products 
group by categoryid order by avg_price desc limit 1) as most_expensive_category)
);

select categoryid, avg(unitprice) as avg_price from products 
group by categoryid order by avg_price desc limit 1;