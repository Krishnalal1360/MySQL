use northwind;
select database();
show tables;

select * from employees;

select
distinct e1.employeeid,
concat(e1.firstname, " ", e1.lastname),
e1.salary
from employees e1, employees e2 where 
e1.salary=e2.salary and e1.employeeid!=e2.employeeid;

INSERT INTO `Employees` 
(`EmployeeID`, `LastName`, `FirstName`, `Title`, `TitleOfCourtesy`, `BirthDate`, `HireDate`, `Address`, `City`, `Region`, `PostalCode`, 
`Country`, `HomePhone`, `Extension`, `Notes`, `ReportsTo`, `PhotoPath`, `Salary`) VALUES
(10, 'Peter', 'Doze', 'Sales Representative', 'Mr.', '1966-01-27 00:00:00', '1994-11-15 00:00:00', '10 Houndstooth Rd.', 'London', NULL, 
'WG2 7LT', 'UK', '(71) 555-4444', '459', 'Peter is good', 5, 'http://accweb/emmployees/davolio.bmp', 2333.33);

select * from employees;

select 
distinct e1.employeeid,
concat(e1.firstname, " ", e1.lastname) as employee,
e1.salary from
employees e1, employees e2
where e1.salary=e2.salary and e1.employeeid!=e2.employeeid;

select * from employees;

select title from employees group by title;

select title, count(*) from employees 
group by title having count(*)>1;

select database();
show tables;

select title from employees group by title;

select * from employees where title not in ("Sales Representative", "Vice President, Sales");

select * from employees where lastname like "_______n";

select count(*) from employees;

select * from employees where employeeid
in (2,4,6,8,10);

select * from employees where 
mod(employeeid,2)=0;

select * from employees where 
employeeid in (1,3,5,7,9);

select * from employees where
mod(employeeid,2)<>0;

select * from employees where 
mod(employeeid,2)=1;

select substring(lastname, 2, 4) as lastname_substring from employees;

select substr(lastname, 2, 4) as lastname_substring from employees;

select * from employees;

use northwind;
select database();

select * from employees;

select * from employees order by salary desc limit 1;

select * from employees order by salary desc limit 1 offset 1;

select max(salary) from employees
where salary not in 
(select max(salary) from employees);

select max(salary) from employees
where salary not in 
(select max(salary) from 
(select distinct salary from employees order by salary desc) as sal
)order by salary desc limit 1;

SELECT DISTINCT Salary
FROM employees e1
WHERE 2>= (SELECT
COUNT(DISTINCT Salary)
FROM employees e2
WHERE e1.Salary <= e2.Salary)
ORDER BY e1.Salary DESC
limit 1,1;

select * from customers;

select distinct region from customers;

select region from customers 
group by region;

select * from customers;

select country, count(city) as number_of_employees_in_city from customers
group by country order by number_of_employees_in_city desc;

select * from customers;

select * from orders;

select customerid from customers;

select customerid from customers
where customerid not in 
(select customerid from orders);

select count(*) from customers;
select count(*) from orders;
select customerid, count(customerid) from customers group by customerid;
select customerid, count(customerid) from orders group by customerid;

select * from customers;
select * from orders;

select c.customerid, o.customerid from customers c 
left join orders o on c.customerid=o.customerid
where o.customerid is null;

select c.customerid, o.customerid from orders o 
right join customers c on o.customerid=c.customerid
where o.customerid is null;

select customerid from customers
where not exists
(select customerid from orders where customers.customerid=orders.customerid);

select * from customers;

select customerid, contactname from customers where
customerid not in (select customerid from orders);

select c.contactname, c.customerid from customers c
left join orders o on c.customerid=o.customerid
where o.customerid is null;

select c.contactname, c.customerid from orders o
right join customers c on o.customerid=c.customerid
where o.customerid is null;

select contactname, customerid from customers
where not exists (select customerid from orders where customers.customerid=orders.customerid);

select * from customers;
select * from orders;

select c.customerid, c.companyname as customer, c.contacttitle, c.city, c.country,
o.orderdate, o.shippeddate, o.requireddate,
datediff(o.shippeddate,o.orderdate) as shippeddate_to_orderdate,
datediff(o.requireddate,o.shippeddate) as requireddate_to_shippeddate
from customers c
inner join orders o on c.customerid=o.customerid
where requireddate<=shippeddate
order by requireddate_to_shippeddate desc;

select * from customers;
select * from orders;
show tables;

select database();
use northwind;
select database();
show tables;

select * from orders;
select * from customers;
select * from orderdetails;
select * from products;

select c.companyname as customer, p.productname as product, sum(od.quantity) as total_quantity_of_product from orders o
inner join customers c on o.customerid=c.customerid
inner join orderdetails od on o.orderid=od.orderid
inner join products p on od.productid=p.productid where 
extract(year from o.orderdate) group by
customer, product order by
customer;

select orderid, companyName
from customers
inner join orders
on customers.customerid = orders.customerid;

select * from customers;
select * from orders;

select B.orderid, A.companyName
from customers A
inner join orders B
on A.customerid = B.customerid;

select orderid, companyName
from
(select customerid, companyName from customers) A
inner join orders
on A.customerid = orders.customerid;

select orderid, companyName
from customers
inner join
(select customerid, orderid from orders) B
on customers.customerid = B.customerid;





select B.orderid, A.companyName
from customers as A
inner join
(select customerid, orderid from orders) as B
on A.customerid = B.customerid;

select B.orderid, A.companyName
from (select customerid, companyName from customers) A
inner join
(select customerid, orderid from orders) B
on A.customerid = B.customerid;

with A as (select customerid, companyName from customers)
select orderid, companyName
from
A
inner join orders
on A.customerid = orders.customerid;

with B as (select customerid, orderid from orders)
select orderid, companyName
from customers
inner join
B
on customers.customerid = B.customerid;

WITH 1996Orders AS (

  SELECT

cs.customerid,

    cs.companyName,

    sum(ods.unitprice * ods.quantity) as TotalOrder

  FROM orders os

  INNER JOIN orderdetails ods

  ON os.orderid = ods.orderid

  INNER JOIN products ps

  ON ps.productid = ods.productid

  INNER JOIN customers cs

  ON cs.customerid = os.customerid

  WHERE

    EXTRACT(YEAR FROM os.orderdate) = 1996

  GROUP BY

    cs.customerid, cs.companyName

)

SELECT

  cs.companyName,

  concat('$',format(kk.TotalOrder, 2)) "Total Order Placed",

  CASE

    WHEN kk.TotalOrder < 1000 THEN 'Very Low Order'

    WHEN kk.TotalOrder BETWEEN 1000 AND 5000 THEN 'Low Order'

    WHEN kk.TotalOrder BETWEEN 5001 AND 10000 THEN 'Medium Order'

    WHEN kk.TotalOrder BETWEEN 10001 AND 15000 THEN 'High Order'

    ELSE 'Very High Order'

  END Comment

FROM

  customers cs

INNER JOIN

  1996Orders kk

ON cs.customerid = kk.customerid

ORDER BY

  "Total Order Placed" DESC;
  
SELECT
country
FROM
employees
UNION
SELECT
  country
FROM
  customers
  UNION
SELECT
  country
FROM
  suppliers;
  
with totalOrderPerEmployee AS (

   SELECT

    employeeid,

    count(employeeid) as NumberOfOrdersTaken

  FROM

    orders

  GROUP BY

    employeeid

), totalNumberOfLateOrdersPerEmployee AS (

  SELECT

    employeeid,

    count(employeeid) as NumberOfLateOrders

  FROM

    orders

  WHERE

    requireddate <= shippeddate

  GROUP BY

    employeeid

)

SELECT

  concat(em.firstname, ' ', em.lastname) Employee,

  toe.NumberOfOrdersTaken "Number of Orders",

  tlo.NumberOfLateOrders "Number of Late Orders",

  concat(format(((tlo.NumberOfLateOrders / toe.NumberOfOrdersTaken)* 100),2),'%') as "Percentage Of Late Orders"

FROM

  totalNumberOfLateOrdersPerEmployee tlo

INNER JOIN

  employees em on tlo.employeeid = em.employeeid

LEFT JOIN

  totalOrderPerEmployee toe on tlo.employeeid = toe.employeeid

  WHERE (tlo.NumberOfLateOrders / toe.NumberOfOrdersTaken)* 100 > 5

ORDER BY (tlo.NumberOfLateOrders / toe.NumberOfOrdersTaken)* 100 DESC;

select date_format("1996-12-01 12:01:22","%Y");
select date_format("1996-12-01 12:01:22","%M");
select date_format("1996-12-01 12:01:22","%D");
select date_format("1996-12-01 12:01:22","%H");
select date_format("1996-12-01 12:01:22","%S");
select date_format("1996-12-01 12:01:22","%Y %M %D");
select date_format("1996-12-01 12:01:22","%y");
select date_format("1996-12-01 12:01:22","%m");
select date_format("1996-12-01 12:01:22","%d");
select date_format("1996-12-01 12:01:22","%h");
select date_format("1996-12-01 12:01:22","%s");

select date_format("2021-11-11 21:30:10","%W");
select date_format("2021-11-11 21:30:10","%w");
select date_format("2021-11-11 21:30:10","%j");
select date_format("2021-11-11 21:30:10","%U");
select date_format("2021-11-11 21:30:10","%u");

select date_format("2021-11-11 21:30:10","%T");
select date_format("2021-11-11 21:30:10","%r");
select date_format("2021-11-11 9:30:10","%r");
select date_format("2021-11-11 21:30:10","%f");
select date_format("2021-11-11 21:30:10","%i");

SELECT
    CONCAT(x.firstname,
            ' and ',
            y.firstname, ' ',
            'were hired the same month and weekday') SamePeriod
FROM
    employees x,
    employees y
WHERE
    DATE_FORMAT(x.hiredate, '%w%M') = DATE_FORMAT(y.hiredate, '%w%M')
        AND x.employeeid < y.employeeid
ORDER BY x.firstname;