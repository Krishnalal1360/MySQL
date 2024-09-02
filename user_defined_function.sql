create database user_defined_function_db;
select database();
use user_defined_function_db;
select database();

delimiter //
create function add_2_number_deterministic(a int, b int)
returns int
deterministic
begin 
      return a+b;
end;
//
delimiter ;

select add_2_number_deterministic(100, 50) as Addition;

select add_2_number_deterministic(200, 100) as Addition;

delimiter //
create function concat_string(st1 varchar(20), st2 varchar(20))
returns varchar(40)
deterministic
begin
      return concat(st1, st2);
end;
//
delimiter ;

select concat_string("My", "SQL") as concat_string;

delimiter //
create function annual_salary(salary decimal(10,2))
returns decimal(10,2)
deterministic
begin
      return 12*salary;
end;
//
delimiter ;

select annual_salary(40000) as salary;

delimiter //
create function price_after_discount(price decimal(10,2), discount decimal(5,2))
returns decimal(10,2)
deterministic
begin
      return price-((discount/100)*price);
end;
//
delimiter ;

select price_after_discount(1000, 10) as new_price;

use northwind;

select * from orderdetails;

delimiter //
create function calculate_order_value(order_id int)
returns decimal(10,2)
deterministic
begin 
      declare total_value decimal(10,2);
      select sum((unitprice*quantity)-(1-discount)) into total_value
      from orderdetails where orderid=order_id;
      return total_value;
end;
//
delimiter ;

select orderid, calculate_order_value(orderid) as total_order_value from  orderdetails;