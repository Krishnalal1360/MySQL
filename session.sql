create database session_db;
select database();
use session_db;
select database();

show full processlist;

select concat("Kill ", id) as thread_id from information_schema.processlist
where user="root";

kill 18;

select concat("Kill ", id) as thread_id from information_schema.processlist
where user="root";

show full processlist;

kill 20;

select concat("Kill ", id) as thread_id from information_schema.processlist
where user="root";

show full processlist;