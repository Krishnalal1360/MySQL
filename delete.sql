create database delete_db;
select database();
use delete_db;
select database();

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);

INSERT INTO students (student_id, first_name, last_name, age) VALUES 
(1, 'John', 'Doe', 20),
(2, 'Jane', 'Smith', 21),
(3, 'Robert', 'Brown', 22),
(4, 'Emily', 'Johnson', 19),
(5, 'Chris', 'Lee', 23);

select * from students;
describe students;

delete from students
where student_id=5;

select database();
use delete_db;
select database();

select * from students;

delete from students
where age<20;

select * from students;

delete from students;

select * from students;
describe students;

truncate table students;

select * from students;
describe students;

CREATE TABLE authors_with_cascade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE books_with_cascade (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors_with_cascade(id) ON DELETE CASCADE
);


INSERT INTO authors_with_cascade (name) VALUES ('Author A'), ('Author B'), ('Author C'), ('Author D'), ('Author E');

INSERT INTO books_with_cascade (title, author_id) VALUES 
('Book 1', 1),
('Book 2', 1),
('Book 3', 3),
('Book 4', 4),
('Book 5', 5);

select * from books_with_cascade;
select * from authors_with_cascade;
describe authors_with_cascade;
describe books_with_cascade;
select constraint_name, table_name, column_name, referenced_table_name, referenced_column_name from information_schema.key_column_usage
where referenced_table_name is not null and table_schema="delete_db" and table_name="books_with_cascade";

DELETE FROM authors_with_cascade 
WHERE id = 1;

CREATE TABLE authors_without_cascade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE books_without_cascade (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors_without_cascade(id)
);

INSERT INTO authors_without_cascade (name) VALUES ('Author A'), ('Author B'), ('Author C'), ('Author D'), ('Author E');

INSERT INTO books_without_cascade (title, author_id) VALUES 
('Book 1', 1),
('Book 2', 1),
('Book 3', 3),
('Book 4', 4),
('Book 5', 5);

select * from authors_without_cascade;
select * from books_without_cascade;
describe authors_without_cascade;
describe books_without_cascade;

delete from authors_without_cascade
where id=1;