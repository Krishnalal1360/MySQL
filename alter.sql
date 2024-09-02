create database alter_db;
select database();
use alter_db;
select database();

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

ALTER TABLE Products 
ADD Price DECIMAL(10, 2);

select * from products;
describe products;

alter table products
drop price;

select * from products;
describe products;

alter table products
modify column productname varchar(150);

describe products;

alter table products 
drop primary key;

describe products;

alter table products
add primary key(productid);

describe products;

alter table products
add unique(productname);

describe products;

alter table products
change column productname nameofproduct varchar(100);

describe products;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

select schema_name from information_schema.schemata where schema_name="alter_db";

/*alter table categories 
add foreign key(categoryid) references categories(categoryid);*/

alter table categories
drop primary key;
describe categories;

alter table categories
drop column categoryid;

alter table categories
add categoryid int;
describe categories;

/*alter table categories
add foreign key(categoryid) references categories(categoryid);*/

alter table products
rename to items;

describe items;

alter table items
add price decimal(10,2);

describe items;

alter table items
alter column price set default 0.00;

describe items;

alter table items
alter column price drop default;

describe items;

describe categories;
alter table categories
add primary key(categoryid);
describe categories;

CREATE TABLE Products2 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT
);

alter table products2
add foreign key(categoryid) references categories(categoryid);

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing');

INSERT INTO Products2 (ProductID, ProductName, CategoryID) VALUES
(1, 'Smartphone', 1),
(2, 'T-Shirt', 2);

select * from categories;

select * from products2;

select
constraint_name
table_name,
column_name,
referenced_table_name,
referenced_column_name
from
information_schema.key_column_usage
where 
referenced_column_name is not null
and table_schema="alter_db"
and table_name="products2";

alter table products2
drop foreign key products2_ibfk_1;

select constraint_name, table_name, column_name, referenced_table_name, referenced_column_name from information_schema.key_column_usage
where referenced_table_name is not null and table_schema="alter_db" and table_name="products2";