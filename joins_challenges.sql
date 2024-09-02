create database joins_challenges_db;
use joins_challenges_db;
select database();

use northwind;
select database();

select * from employees;
select * from orders;

select o.orderid, o.orderdate, o.requireddate, o.shippeddate, e.firstname, e.lastname from 
orders as o inner join employees as e on o.employeeid=e.employeeid;

select * from products;
select * from suppliers;

select p.productname, s.companyname from products p
inner join suppliers s on p.supplierid=s.supplierid;

select p.productname, s.companyname from products p
inner join suppliers s where p.supplierid=s.supplierid;

select p.productname, s.companyname from products p
inner join suppliers s using(supplierid);

select * from customers;
select * from orders;

select companyname, shipvia from customers inner join orders on orders.customerid=customers.customerid;

select companyname, shipvia from customers inner join orders where orders.customerid=customers.customerid;

select companyname, shipvia from customers inner join orders using(customerid);

select * from customers;
select * from orders;
select * from shippers;

select c.companyname, s.companyname from customers as c
inner join orders as o on c.customerid=o.customerid
inner join shippers as s on s.shipperid=o.shipvia;

select * from products;
select * from categories;

select productname, unitprice, categoryname, description from
products inner join categories on products.categoryid=categories.categoryid;

select productname, companyname as supplier, concat(address, ", ", city, ", ", postalcode, ", ", country) as address
from suppliers inner join products on products.supplierid=suppliers.supplierid;

select companyname, count(orderid) as Number_of_orders from
customers inner join orders on customers.customerid=orders.customerid
group by companyname order by number_of_orders;

select employees.employeeid, concat(firstname, " ", lastname) as full_name, count(territoryid) as number_of_territory_cover from
employeeterritories inner join employees on employeeterritories.employeeid=employees.employeeid
group by employeeterritories.employeeid;

select orders.orderid, customers.companyname, concat(firstname, " ", lastname) as full_name from 
employees inner join orders on employees.employeeid=orders.employeeid
inner join customers on customers.customerid=orders.customerid
order by orderid;

select productname as product_name, categoryname as category_name, companyname as supplier_name from
categories inner join products on categories.categoryid=products.categoryid
inner join suppliers on products.supplierid=suppliers.supplierid;

SELECt orders.orderid 'Order ID', customers.companyname 'Customer Name', concat('$',format(sum(quantity*unitprice),2)) 'Grand Total',
concat(firstname, ' ', lastname) 'Employee Name' FROM employees
INNER JOIN orders ON employees.employeeid = orders.employeeid
INNER JOIN customers ON customers.customerid = orders.customerid
INNER JOIN orderdetails ON orderdetails.orderid = orders.orderid
GROUP BY orderdetails.orderid
ORDER BY orders.orderid ASC
LIMIT 4;

select database();
use northwind;
select database();

SELECT
orders.orderid 'Order ID',
customers.companyname 'Customer Name',
concat('$',format(abs(sum(quantity*orderdetails.unitprice - quantity*products.unitprice)),2)) 'Absolute Profit & Loss',
concat(firstname, ' ', lastname) 'Employee Name'
FROM employees
INNER JOIN orders
ON employees.employeeid = orders.employeeid
INNER JOIN customers
ON customers.customerid = orders.customerid
INNER JOIN orderdetails
ON orderdetails.orderid = orders.orderid
INNER JOIN products
ON products.productid = orderdetails.productid
GROUP BY orderdetails.orderid
ORDER BY orders.orderid ASC
LIMIT 4;

SELECT
orders.orderid 'Order ID',
CompanyName 'Customer Name',
ProductName 'Product Name',
CategoryName 'Product Category',
orderdetails.Quantity Quantity,
orderdetails.UnitPrice Price
FROM customers
INNER JOIN orders
ON customers.customerid = orders.customerid
INNER JOIN orderdetails
ON orders.orderid = orderdetails.orderid
INNER JOIN products
ON orderdetails.productid = products.productid
INNER JOIN categories
ON products.categoryid = categories.categoryid;

SELECT
orders.orderid 'Order ID',
productname 'Product Name',
suppliers.companyname 'Supplier Name',
customers.companyname 'Customer Name',
concat(firstname, ' ', lastname) 'Employee Name'
FROM employees
INNER JOIN orders
ON employees.employeeid = orders.employeeid
INNER JOIN customers
ON customers.customerid = orders.customerid
INNER JOIN orderdetails
ON orderdetails.orderid = orders.orderid
INNER JOIN products
ON products.productid = orderdetails.productid
INNER JOIN suppliers
ON suppliers.supplierid = products.supplierid
ORDER BY orders.orderid ASC;

SELECT
orders.orderid,
products.ProductName,
categoryName,
suppliers.companyName,
CONCAT(FirstName, ' ', LastName) 'Full Name',
territoryID 'Number of Territory Cover'
FROM
employeeTerritories
INNER JOIN
employees ON employeeTerritories.employeeID = employees.employeeID
INNER JOIN
orders ON employees.employeeID = orders.employeeID
INNER JOIN
orderdetails ON orderdetails.orderid = orders.orderid
INNER JOIN
products ON orderdetails.productid = products.productid
INNER JOIN
suppliers ON suppliers.supplierid = products.supplierid
INNER JOIN
categories ON categories.categoryid = products.categoryid
WHERE
orders.orderid = 10276
AND products.ProductName = 'Ikura'
AND territoryID = 45839;

SELECT
TerritoryID,
FirstName,
customers.CompanyName,
productName,
categoryName,
suppliers.CompanyName
FROM employeeTerritories
INNER JOIN employees
ON employeeTerritories.employeeID = employees.employeeID
INNER JOIN orders
ON employees.employeeID = orders.employeeID
INNER JOIN orderdetails
ON orderdetails.orderid = orders.orderid
INNER JOIN products
ON orderdetails.productid = products.productid
INNER JOIN suppliers
ON suppliers.supplierid = products.supplierid
INNER JOIN categories
ON categories.categoryid = products.categoryid
INNER JOIN customers
ON customers.customerid = orders.customerid;

SELECT
o.orderid,
a.TerritoryID,
b.FirstName,
c.reportsTo,
cus.CompanyName customer,
p.productName,
cat.categoryName,
sup.CompanyName supplier
FROM employeeTerritories a
INNER JOIN employees b
ON a.employeeID = b.employeeID
INNER JOIN employees c
ON b.employeeID = c.employeeID
INNER JOIN orders o
ON b.employeeID = o.employeeID
INNER JOIN orderdetails os
ON os.orderid = o.orderid
INNER JOIN products p
ON os.productid = p.productid
INNER JOIN suppliers sup
ON sup.supplierid = p.supplierid
INNER JOIN categories cat
ON cat.categoryid = p.categoryid
INNER JOIN customers cus
ON cus.customerid = o.customerid
WHERE c.reportsTo IS NOT NULL
ORDER BY o.orderid ASC;

SELECT
TerritoryID,
concat(FirstName, ' ', LastName) 'Full Name', 
Customers.CompanyName,
products.ProductName,
suppliers.companyName,
categoryName
FROM employeeTerritories
INNER JOIN employees
ON employeeTerritories.employeeID = employees.employeeID
INNER JOIN orders
ON employees.employeeID = orders.employeeID
INNER JOIN orderdetails
ON orderdetails.orderid = orders.orderid
INNER JOIN products
ON orderdetails.productid = products.productid
INNER JOIN suppliers
ON suppliers.supplierid = products.supplierid
INNER JOIN categories
ON categories.categoryid = products.categoryid
INNER JOIN customers
ON customers.customerid = orders.customerid
INNER JOIN customercustomerdemo
ON customercustomerdemo.customerid = customers.customerid
INNER JOIN customerdemographics
ON customerdemographics.customerTypeID = customercustomerdemo.customerTypeID;