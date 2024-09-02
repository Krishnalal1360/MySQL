create database table_locking_db;
select database();
use table_locking_db;
select database();

show processlist;

show full processlist;

CREATE TABLE comment (

    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,

    comment VARCHAR(255) NOT NULL

);

select * from comment;

insert into comment(comment) values
("After lock, can you go");

select * from comment;
describe comment;

lock table comment read;

show full processlist;

select * from comment;

select concat("Kill ", id) as thread_id from information_schema.processlist 
where user="root";

show processlist;

insert into comment(comment) values
("After lock, can you go for 22");

insert into comment(comment) values
("After lock, can you go for 23");

select connection_id();

unlock tables;

kill 23;

select connection_id();

show full processlist;

lock table comment write;

insert into comment(comment) values
("After lock, can you go for 24");

select * from comment;

select connection_id();

select concat("Kill", id) as thread_id from information_schema.processlist where
user="root";

kill 24;

unlock tables;

kill 25;

select * from comment;

drop table comment;

select * from comment;