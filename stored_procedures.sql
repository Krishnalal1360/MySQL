create database stored_procedures_db;
select database();
use stored_procedures_db;
select database();

delimiter //
create procedure simple_greeting()
begin 
       select "Hello, Welcome to MySQL procedures!" as greeting;
end //;
delimiter ;

call simple_greeting();

delimiter $$
create procedure add_2_number(in num1 int, in num2 int, out result int)
begin 
      set result=num1+num2;
end $$;
delimiter ;

call add_2_number(100, 50, @addition);

select @addition;

delimiter //
create procedure greet_user(in user_name varchar(20))
begin 
      select concat("Hello ", user_name, "! Welcome to MySQL procedures!") as greeting;
end //;
delimiter ;

call greet_user("Alex Christ");

call greet_user("John Abhraham");

delimiter @@
create procedure square_number(in num int, out result int)
begin 
      set result=num*num;
end @@
delimiter ;

call square_number(15, @square);

select @square;

call square_number(25, @square);

select @square;

delimiter //
create procedure increment_number(inout num int)
begin 
      set num=num+1;
end //;
delimiter ;

set @number=10;

call increment_number(@number);

select @number;

delimiter //
create procedure decrement_number(inout num int)
begin
      set num=num-1;
end //;
delimiter ;

select @number;

call decrement_number(@number);

select @number;

delimiter //
create procedure check_number(in num int, out result varchar(20))
begin
	   if num>0 then
          set result="positive";
	   elseif num<0 then
		  set result="negative";
	   else
		  set result="zero";
	   end if;
end //;
delimiter ;

set @number=0;

call check_number(@number, @result);

select @result;

set @number=1;

call check_number(@number, @result);

select @result;

set @number=-1;

call check_number(@number, @result);

select @result;

delimiter @@
create procedure calculator(in num1 int, in num2 int, out r1 int, out r2 int, out r3 int, out r4 int)
begin 
      set r1=num1/num2;
      set r2=num1*num2;
      set r3=num1+num2;
      set r4=num1-num2;
end @@;
delimiter ;

set @num1=10;
set @num2=5;

call calculator(@num1, @num2, @r1, @r2, @r3, @r4);

select @num1 as First_Number, @num2 as Second_Number, @r1 as Division, @r2 as Multiplication, @r3 as Addition, @r4 as Subtraction;

drop procedure if exists add_2_number;