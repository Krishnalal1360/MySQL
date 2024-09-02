create database union_db;
select database();
use union_db;
select database();

CREATE TABLE sales_east (

    id INT AUTO_INCREMENT PRIMARY KEY,

    product_name VARCHAR(255),

    sales INT

);

CREATE TABLE sales_west (

    id INT AUTO_INCREMENT PRIMARY KEY,

    product_name VARCHAR(255),

    sales INT

);

INSERT INTO sales_east (product_name, sales) VALUES

('Product A', 100),

('Product B', 150),

('Product C', 200);

INSERT INTO sales_west (product_name, sales) VALUES

('Product D', 100),

('Product B', 150),

('Product E', 200);

select * from sales_east;

select * from sales_west;

select product_name, sales from sales_east union
select product_name, sales from sales_west;

select product_name, sales from sales_east union all
select product_name, sales from sales_west;

select product_name as name, sales from sales_east union
select product_name, sales from sales_west;

select product_name, sales from sales_east union
select product_name, sales from sales_west order by sales desc;

select product_name, sales from sales_east union
select product_name, sales from sales_west order by sales desc limit 3;

select product_name, sales from sales_east union
select product_name, sales from sales_west order by sales desc limit 4 offset 1;

select product_name, sales from sales_east union
select product_name, sales from sales_west order by sales desc limit 1,4;

(select product_name, sales from sales_east order by sales asc limit 1) union
(select product_name, sales from sales_west order by sales asc limit 1);

(select product_name, sales from sales_east order by sales desc limit 1) union
(select product_name, sales from sales_west order by sales desc limit 1);

(select product_name, sales from sales_east order by sales desc limit 1 offset 1) union
(select product_name, sales from sales_west order by sales desc limit 1 offset 1);

select product_name, sales from sales_east;

select product_name, sales from sales_west;

(select product_name, sales from sales_east order by sales desc limit 1 offset 1) union all
(select product_name, sales from sales_west order by sales desc limit 1 offset 1);