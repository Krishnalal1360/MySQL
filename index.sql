create database index_db;
select database();
use index_db;
select database();

show tables;

CREATE TABLE users (
    id INT AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY (id)
);

SHOW INDEX FROM Users;

select * from users;
describe users;

DROP TABLE users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

SHOW INDEX FROM Users;

INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
INSERT INTO users (name, email) VALUES ('Jane Smith', 'jane.smith@example.com');
INSERT INTO users (name, email) VALUES ('Jane Smith', 'jane.smith@example.com');

select * from users;

drop table users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

create unique index unique_index_email on users(email);

INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
INSERT INTO users (name, email) VALUES ('Jane Smith', 'jane.smith@example.com');
INSERT INTO users (name, email) VALUES ('Jane Smith', 'jane.smith@example.com');

CREATE TABLE articles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    content TEXT
);

INSERT INTO articles (title, content) VALUES 
('Article 1', 'This is the content of the first article'),
('Article 2', 'Content for the second article'),
('Article 3', 'Here is some more article content');

select * from articles;
describe articles;

SHOW INDEX FROM articles;

ALTER TABLE articles ADD FULLTEXT(title, content);

EXPLAIN SELECT * FROM articles WHERE MATCH(title, content) AGAINST('search term');

CREATE TABLE products (
    product_id INT AUTO_INCREMENT,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    PRIMARY KEY (product_id)
);

INSERT INTO products (name, price) VALUES ('Laptop', 1200.00), ('Phone', 600.00);

select * from products;
describe products;

create index indx on products(name);
show index from products;

EXPLAIN SELECT * FROM products WHERE name = 'Laptop';

create unique index unique_price_index on products(name);
show index from products;

explain select * from products where price=1200.00;

CREATE TABLE example (
id INT,
 name VARCHAR(255)
 );

INSERT INTO example (id, name) VALUES 
(1, 'John'), 
(2, 'Jane');

select * from example;
describe example;

show index from example;

create index id_indx on example(id);

show index from example;

drop index id_indx on example;

create index id_indx on example(id);

alter table example drop index id_indx;

show index from example;