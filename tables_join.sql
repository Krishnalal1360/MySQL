create database tables_join_db;
select database();
use tables_join_db;
select database();

show tables;

CREATE TABLE IF NOT EXISTS `CustomerCustomerDemo` (
  `CustomerID` varchar(5) NOT NULL,
  `CustomerTypeID` varchar(10) NOT NULL,
  PRIMARY KEY (`CustomerID`,`CustomerTypeID`),
  KEY `FK_CustomerCustomerDemo` (`CustomerTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO CustomerCustomerDemo (CustomerID, CustomerTypeID)
VALUES 
('ALFKI', 'TYPE1'),
('BONAP', 'TYPE2'),
('CACTU', 'TYPE3');

CREATE TABLE IF NOT EXISTS `CustomerDemographics` (
  `CustomerTypeID` varchar(10) NOT NULL,
  `CustomerDesc` mediumtext,
  PRIMARY KEY (`CustomerTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO CustomerDemographics (CustomerTypeID, CustomerDesc)
VALUES 
('TYPE1', 'Small Business'),
('TYPE2', 'Large Enterprise'),
('TYPE3', 'Non-Profit Organization');

alter table customercustomerdemo rename to demo;

alter table customerdemographics rename to demographics;

select * from demo;
select * from demographics;

show tables;

select * from products;
select * from categories;

use northwind;

select products.productid, products.productname, categories.categoryname from products inner join categories on 
products.categoryid=categories.categoryid;

select * from employees;
select * from orders;

select e.employeeid, e.firstname, e.lastname, o.orderid, o.orderdate from employees as e inner join orders as o 
on e.employeeid=o.employeeid;

select e.employeeid, e.firstname, e.lastname, o.orderid, o.orderdate from employees as e inner join orders as o 
using(employeeid);

select * from orders;
select * from employees;
select * from customers;

select orders.orderid, employees.firstname, employees.lastname, customers.companyname from orders
inner join employees on orders.employeeid=employees.employeeid
inner join customers on orders.customerid=customers.customerid;

select orders.orderid, employees.firstname, employees.lastname, customers.companyname from orders
inner join employees using(employeeid)
inner join customers using(customerid);

select * from products;
select * from suppliers;
select * from categories;

select products.productname, suppliers.companyname, categories.categoryname from products
inner join suppliers on products.supplierid=suppliers.supplierid
inner join categories on products.categoryid=categories.categoryid;

select products.productname, suppliers.companyname, categories.categoryname from products
inner join suppliers using(supplierid)
inner join categories using(categoryid);

SELECT 
    Orders.OrderID,
    Employees.FirstName AS EmployeeFirstName,
    Employees.LastName AS EmployeeLastName,
    Customers.CompanyName AS CustomerName,
    Products.ProductName,
    OrderDetails.Quantity,
    OrderDetails.UnitPrice
FROM 
    Orders
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID;
    
select * from orders;
select * from employees;
select * from customers;
select * from products;
select * from orderdetails;

select orders.orderid, employees.firstname, employees.lastname, customers.companyname, products.productname, orderdetails.quantity,
orderdetails.unitprice from orders
inner join employees on orders.employeeid=employees.employeeid
inner join customers on orders.customerid=customers.customerid
inner join orderdetails on orders.orderid=orderdetails.orderid
inner join products on products.productid=orderdetails.productid;

SELECT 
    Customers.CompanyName AS CustomerName,
    Orders.OrderID,
    Products.ProductName,
    Categories.CategoryName,
    OrderDetails.Quantity,
    OrderDetails.UnitPrice
FROM 
    Customers
JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID;
    
-- Six Tables Join

SELECT 
    Products.ProductName,
    Suppliers.CompanyName AS SupplierName,
    Categories.CategoryName,
    Employees.FirstName AS EmployeeFirstName,
    Employees.LastName AS EmployeeLastName,
    Orders.OrderDate
FROM 
    Products
JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN 
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN 
    Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID;

SELECT 
    Customers.CompanyName AS CustomerName,
    Orders.OrderID,
    Employees.FirstName AS EmployeeFirstName,
    Employees.LastName AS EmployeeLastName,
    Products.ProductName,
    Categories.CategoryName
FROM 
    Customers
JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID;

-- Seven Tables Join

SELECT 
    Orders.OrderID,
    Customers.CompanyName AS CustomerName,
    Customers.ContactName AS CustomerContact,
    Employees.FirstName AS EmployeeFirstName,
    Employees.LastName AS EmployeeLastName,
    Products.ProductName,
    Categories.CategoryName,
    Suppliers.CompanyName AS SupplierName,
    Orders.ShippedDate
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID;
    
SELECT 
    Products.ProductID,
    Products.ProductName,
    Categories.CategoryName,
    Suppliers.CompanyName AS SupplierName,
    OrderDetails.Quantity,
    OrderDetails.UnitPrice,
    Orders.OrderID,
    Customers.CompanyName AS CustomerName,
    Employees.FirstName AS EmployeeFirstName,
    Employees.LastName AS EmployeeLastName
FROM 
    Products
JOIN 
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN 
    Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID;
    
-- Eleven Tables Join

SELECT 
    Products.ProductName,
    Suppliers.CompanyName AS SupplierName,
    Categories.CategoryName,
    OrderDetails.Quantity,
    OrderDetails.UnitPrice,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.ShippedDate,
    Employees.FirstName AS EmployeeFirstName,
    Employees.LastName AS EmployeeLastName,
    Customers.CompanyName AS CustomerName,
    Shippers.CompanyName AS ShipperName,
    Region.RegionDescription,
    Territories.TerritoryDescription
FROM 
    Orders
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN 
    EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
JOIN 
    Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
JOIN 
    Region ON Territories.RegionID = Region.RegionID
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    Shippers ON Orders.ShipVia = Shippers.ShipperID;

-- Thirteen Tables Join

SELECT 
    Orders.OrderID,
    Orders.OrderDate,
    Products.ProductName,
    Categories.CategoryName,
    Suppliers.CompanyName AS SupplierName,
    Customers.CompanyName AS CustomerName,
    Customers.ContactName,
    Customers.ContactTitle,
    Employees.FirstName AS EmployeeFirstName,
    Employees.LastName AS EmployeeLastName,
    Shippers.CompanyName AS ShipperName,
    Region.RegionDescription AS EmployeeRegion,
    Territories.TerritoryDescription AS EmployeeTerritory,
    EmployeeTerritories.TerritoryID
FROM 
    Orders
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN 
    EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
JOIN 
    Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
JOIN 
    Region ON Territories.RegionID = Region.RegionID
JOIN 
     Shippers ON Orders.ShipVia = Shippers.ShipperID
JOIN 
    CustomerCustomerDemo ON Customers.CustomerID = CustomerCustomerDemo.CustomerID
JOIN 
    CustomerDemographics ON CustomerCustomerDemo.CustomerTypeID = CustomerDemographics.CustomerTypeID;
    
select database();
use tables_join_db;
select database();

use northwind;

select * from products;
select * from suppliers;

select products.productname, suppliers.supplierid, suppliers.CompanyName, suppliers.country from
products inner join suppliers on products.supplierid=suppliers.supplierid where suppliers.country="USA";

select database();
use northwind;
select database();

select * from orders;
select * from customers;

select orders.orderid, customers.companyname, customers.city from 
orders inner join customers on orders.customerid=customers.customerid where customers.city="London";

select * from employees;
select * from orders;

select employees.firstname, employees.lastname, orders.orderid, orders.shipregion  from 
employees inner join orders on employees.employeeid=orders.employeeid where shipregion="WA";

select * from orders;
select * from employees;
select * from customers;
select * from orderdetails;
select * from products;

select orders.orderid, employees.firstname, employees.lastname, customers.companyname, products.productname,
orderdetails.unitprice, orderdetails.quantity from 
orders inner join employees on orders.employeeid=employees.employeeid
inner join customers on orders.customerid=customers.customerid
inner join orderdetails on orders.orderid=orderdetails.orderid
inner join products on orderdetails.productid=products.productid;

select orders.orderid, employees.firstname, employees.lastname, customers.companyname, products.productname,
orderdetails.unitprice, orderdetails.quantity from 
orders inner join employees on orders.employeeid=employees.employeeid
inner join customers on orders.customerid=customers.customerid
inner join orderdetails on orders.orderid=orderdetails.orderid
inner join products on orderdetails.productid=products.productid
where orders.orderdate>="1997-01-01" and orders.orderdate<="1997-12-31";

select * from employees;
select * from orders;

select e.employeeid, e.firstname, e.lastname, count(o.orderid) as total_orders from
employees as e inner join orders as o on e.employeeid=o.employeeid
group by e.employeeid, e.firstname, e.lastname;

select * from categories;
select * from orderdetails;
select * from products;

select categories.categoryname, sum(orderdetails.unitprice*orderdetails.quantity) as total_sales_amount from
categories inner join products on categories.categoryid=products.categoryid
inner join orderdetails on orderdetails.productid=products.productid
group by categories.categoryname;

SELECT 
    Suppliers.Country,
    Products.ProductName,
    AVG(OrderDetails.Quantity) AS AverageOrderQuantity
FROM 
    Suppliers
JOIN 
    Products ON Suppliers.SupplierID = Products.SupplierID
JOIN 
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY 
    Suppliers.Country, Products.ProductName;

select * from suppliers;
select * from products;
select * from orderdetails;

select suppliers.country, products.productname, avg(orderdetails.quantity) as avg_order_quantity from 
suppliers inner join products on suppliers.supplierid=products.supplierid
inner join orderdetails on orderdetails.productid=products.productid
group by suppliers.country, products.productname;
    
select suppliers.country, products.productname, min(orderdetails.quantity) as minimum_order_quantity from
suppliers inner join products on suppliers.supplierid=products.supplierid
inner join orderdetails on orderdetails.productid=products.productid
group by suppliers.country, products.productname;

select suppliers.country, products.productname, max(orderdetails.quantity) as maximum_order_quantity from
suppliers inner join products on suppliers.supplierid=products.supplierid
inner join orderdetails on orderdetails.productid=products.productid
group by suppliers.country, products.productname;

select * from employees;
select * from orders;

select concat(e.firstname, " ", e.lastname) as full_name, count(o.orderid) as total_orders from
employees as e inner join orders as o on e.employeeid=o.employeeid
group by e.employeeid, full_name
having total_orders>50
order by total_orders;

select concat(e.firstname, " ", e.lastname) as full_name, count(o.orderid) as total_orders from
employees as e inner join orders as o on e.employeeid=o.employeeid
group by e.employeeid, full_name
having total_orders>50
order by total_orders desc;

select database();
use northwind;
select database();

SELECT c.ContactName, c.ContactTitle, s.CompanyName,
  CASE 
    WHEN s.CompanyName = 'Speedy Express' THEN 'Preferred'
    ELSE 'Standard'
  END AS ShipperStatus
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Shippers s ON o.ShipVia = s.ShipperID;

select * from customers;
select * from orders;
select * from shippers;

select c.contactname, c.contacttitle, s.companyname,
case 
     when s.companyname="Speedy Express" then "Preferred"
     else "Standard"
end as shipper_status
from customers c inner join orders as o on c.customerid=o.customerid
inner join shippers as s on o.shipvia=s.shipperid;

select concat(p.productname, "-", p.quantityperunit, " at $", p.unitprice) as product_details,
c.categoryname, s.companyname from
products p inner join categories c on p.categoryid=c.categoryid
inner join suppliers s on p.supplierid=s.supplierid
limit 5;