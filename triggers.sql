show databases;
use world;
select database();

show tables;

select * from city;

select * from country;

select * from countrylanguage;

create database triggers_db;
select database();
use triggers_db;
select database();

create table users(
id int auto_increment primary key,
name varchar(20),
email varchar(40),
created_at datetime
);

insert into users(name, email, created_at) values
("John", "john@example.com", "2024-07-20 10:30:00"),
("Alice", "alice@example.com", "2024-07-20 11:00:00");

select * from users;

insert into users(name, email) values
("Bob", "bob@example.com");

select * from users;

describe users;

delimiter //
create trigger before_insert_users
before insert 
on users
for each row 
begin 
       set new.created_at=now();
end;
//
delimiter ;

drop table users;

create table users(
id int auto_increment primary key,
name varchar(20),
email varchar(40),
created_at datetime
);

insert into users(name, email, created_at) values
("John", "john@example.com", "2024-07-20 10:30:00"),
("Alice", "alice@example.com", "2024-07-20 11:00:00");

select * from users;

delimiter //
create trigger before_insert_users
before insert 
on users
for each row 
begin 
       set new.created_at=now();
end;
//
delimiter ;

insert into users(name, email) values
("Bob", "bob@example.com");

select * from users;

create table my_table(
id int auto_increment primary key,
name varchar(10),
value int
);

insert into my_table(name, value) values
("Item1", 10),
("Item2", 20);

select * from my_table;

create table audit_log(
log_id int auto_increment primary key,
table_name varchar(10),
changed_at datetime
);

insert into audit_log(table_name, changed_at) values
("users", "2024-07-20 10:30:00"),
("orders", "2024-07-20 11:00:00");

select * from audit_log;
describe audit_log;

select * from my_table;
describe my_table;

update my_table set value=15 where id=1;

delimiter //
create trigger after_update_example
after update
on my_table
for each row 
begin 
       insert into audit_log(table_name, changed_at) values
       ("products", now());
end;
//
delimiter ;

select * from my_table;

select * from audit_log;

use triggers_db;
select database();

create table employee(
employee_id int auto_increment primary key,
first_name varchar(10),
last_name varchar(10),
department_id int,
hire_date date,
salary decimal(10,2)
);
      
insert into employee(first_name, last_name, department_id, hire_date, salary) values
("John", "Doe", 1, "2024-07-25", 65000.00),
("Peter", "Owen", 2, "2024-04-21", 70000.00);

select * from employee;
describe employee;

create table employee_audit(
audit_id int auto_increment primary key,
employee_id int,
action varchar(10),
action_date datetime
);
      
insert into employee_audit(employee_id, action, action_date) values
(2, "insert", "2024-07-26 18:06:41"),
(1, "update", "2024-07-26 18:16:26");

select * from employee_audit;
describe employee_audit;

delimiter //
create trigger before_employee_update
before update
on employee
for each row 
begin
      if old.salary <> new.salary then
		 insert into employee_audit(employee_id, action, action_date) values
         (old.employee_id, "update", now());
	  end if;
end;
// 
delimiter ;
          
select * from employee;

select * from employee_audit;

update employee set salary=75000.00 where employee_id=1;

select * from employee_audit;

update employee set salary=65000.00 where employee_id=1;

select * from employee_audit;

select * from employee;

delete from employee where employee_id=1;

select * from employee;

delimiter //
create trigger after_employee_delete
after delete 
on employee
for each row
begin 
	   insert into employee_audit(employee_id, action, action_date) values
       (old.employee_id, "delete", now());
end;
//
delimiter ;

select * from employee_audit;

select * from employee;

delete from employee where employee_id=1;

select * from employee;

select * from employee_audit;

delete from employee where employee_id=1;

select * from employee;

select * from employee_audit;

delete from employee where employee_id=2;

select * from employee_audit;

show tables;
select database();

select * from employee;

delimiter //
create trigger check_hire_date
before insert 
on employee
for each row
begin 
      if new.hire_date > current_date then
         signal sqlstate "45000" set message_text="Hire date cannot be in the future!";
	  end if;
end;
//
delimiter ;

insert into employee(first_name, last_name, department_id, hire_date, salary) values
("Alice", "Johnson", 1, "2024-01-20", 50000.00);

select * from employee;

insert into employee(first_name, last_name, department_id, hire_date, salary) values
("Bob", "Smith", 2, "2025-08-01", 60000.00);

select * from employee;

delimiter //
create trigger prevent_high_salary_delete
before delete 
on employee
for each row
begin
	   if old.salary > 50000 then
	      signal sqlstate "45000" set message_text="Cannot delete employee with high salary greater than 50000!";
	   end if;
end;
//
delimiter ;

select * from employee;

delete from employee where employee_id=1;

update employee set salary=45000.00 where employee_id=3;

select * from employee;

delete from employee where employee_id=3;

select * from employee;

create table department_change_log(
log_id int auto_increment primary key,
employee_id int,
old_department_id int,
new_department_id int,
change_date timestamp default current_timestamp
);

delimiter //
create trigger after_employee_department_update
after update
on employee
for each row
begin
	   if old.department_id <> new.department_id then
          insert into department_change_log(employee_id, old_department_id, new_department_id) values
          (old.employee_id, old.department_id, new.department_id);
	   end if;
end;
//
delimiter ;

select * from department_change_log;

select * from employee;

insert into employee (first_name, last_name, department_id, hire_date, salary) values
("Alice", "Johnson", 1, "2024-07-20", 50000.00);

select * from employee;

update employee set employee_id=3 where first_name="Alice";

select * from employee;

update employee set department_id=2 where employee_id=3;

select * from employee;

select * from department_change_log;

select database();
show tables;

delimiter //
create trigger prevent_low_salary_insert
before insert
on employee
for each row
begin 
      if new.salary < 15000 then
          signal sqlstate "45000" set message_text="Salary Below Minimum 15000 wage!";
	  end if;
end;
// 
delimiter ;

insert into employee (first_name, last_name, department_id, hire_date, salary) values 
('John', 'Doe', 1, '2024-07-25', 20000.00);

insert into employee (first_name, last_name, department_id, hire_date, salary) values
('Jane', 'Smith', 2, '2024-07-26', 10000.00);

select * from employee;

delimiter //
create trigger adjust_salary_on_insert
before insert 
on employee
for each row
begin
      if new.department_id=1 then
         set new.salary=new.salary*1.10;
	  end if;
end;
//
delimiter ;

insert into employee (first_name, last_name, department_id, hire_date, salary) values
('Alice', 'Johnson', 1, '2024-07-25', 50000.00);

insert into employee (first_name, last_name, department_id, hire_date, salary) values
('Bob', 'Smith', 2, '2024-07-26', 60000.00);

select * from employee;

delimiter //
create trigger prevent_empty_first_name_update
before update
on employee
for each row
begin 
      if new.first_name="" or new.first_name is null then 
         signal sqlstate "45000" set message_text="First name cannot be empty!";
	  end if;
end;
//
delimiter ;

select * from employee;

update employee set first_name="Alicia" where department_id=1;

select * from employee;

update employee set first_name="" where department_id=1;

select * from employee;

create table salary_difference (
    diff_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    difference DECIMAL(10, 2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter //
create trigger log_salary_difference
after update 
on employee
for each row
begin
      if old.salary <> new.salary then
         insert into salary_difference (employee_id, old_salary, new_salary, difference) values
         (old.employee_id, old.salary, new.salary, new.salary-old.salary);
	  end if;
end;
//
delimiter ;

select * from employee;

update employee set salary=50000.00 where employee_id=1;

select * from employee;

select * from salary_difference;

update employee set salary=70000.00 where employee_id=2;

select * from employee;

select * from salary_difference;