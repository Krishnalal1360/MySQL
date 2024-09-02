create database string_functions_db;
use string_functions_db;
select database();

select space(1);

select space(10);

select space(100);

use northwind;
select database();

select * from employees;

select concat(firstname, space(1), lastname) as employee_name from employees;

select repeat("Artificial Intelligence ",2) as repeated_words;

select * from customers;

select customerid, companyname, repeat("Good Customer! ",2) as greetings from customers;

select replace(83432323, 3, "A") as replaced_token;

select replace("root_mean_square", "root", "random") as replaced_token;

select * from employees;

select employeeid, firstname, lastname, replace(hiredate, "00:00:00", "Time is missing") as hire_date from employees;

select reverse("evil") as reversed_token;

select reverse("devil") as reversed_token;

select * from employees;

select employeeid, firstname, reverse(firstname) as reversed_first_name from employees;

select left("Donatus", 3) as left_selected_token;

select lastname, left(lastname, 3) as left_selected_token from employees;

select right("Canada", 3) as right_selected_token;

select * from employees;

select firstname, lastname, homephone, right(homephone, 8) as modified_homephone from employees;

select rpad(9, 3, 11) as rpadded_token;

select rpad("My", 5, "SQL") as rpadded_token;

select * from employees;

select firstname, lastname, rpad(salary, length(salary)+length("USD"), "USD") as rpadded_token from employees;

select firstname, lastname, rpad(salary, length(salary)+4, " USD") as rpadded_token from employees;

select lpad(456789, 9, 123) as lpadded_token;

select lpad("SQL", 5, "My") as lpadded_token;

select * from customers;

select lpad(companyname, length(companyname)+length("Happy Customer: "), "Happy Customer: ") as greetings from customers;

select database();
use northwind;
select database();

select position("c" in "America");

select position("rica" in "America");

select locate("c", "America");

select locate("rica", "America");

select lastname, position("a" in lastname) from employees;

select lastname, locate("a", lastname) from employees;

select substring("foregone", 5, 4) as sub_string;

select substr("foregone", 5, 4) as sub_str;

select substring("foregone", -4, 4) as sub_string;

select * from orders;

select orderid, customerid, substring(orderdate, 1, 10) as "date" from orders;

select * from products;

select productid, substring(productname, 3, length(productname)-2) as sub_string, productname from products;

select substring("foregone", 2, 6) as substring;

select substring("foregone", -7, 6) as substring;

select substring_index("movement-of-the-people", "-", 2) as "substring";

select substring_index("Artificial", "i", 4) as "substring";

select substring_index("www.exams.com", ".", 2) as sub_string;

select substring_index("www.exams.com", ".", 3) as sub_string;

select substring_index("www.exams.com", ".", -2) as sub_string;

select substring_index("www.exams.com", ".", -3) as sub_string;

select substring_index("https://www.exams.com", ".", 1) as sub_string;

select substring_index("https://www.exams.com", ".", 2) as sub_string;

select substring_index("https://www.exams.com", ".", 3) as sub_string;

select substring_index("https://www.exams.com", "//", 1) as sub_string;

select substring_index("https://www.exams.com", "//", 2) as sub_string;

select * from shippers;

select shipperid, companyname, substring_index(phone, ")", -1) as phone_number from shippers;

select mid("forever", -4, 4) as mid_string;

select * from employees;

select employeeid, firstname, mid(firstname, 2, 3) as mid_name from employees;

select "mysql.sql" as original_token, insert("mysql.sql", 1, 5, "peace") as changed_token;

select "22people" as original_token, insert("22people", 1, 8, "people") as changed_token;

select "23students" as original_token, insert("23people", 2, 9, "boys") as changed_token;

select * from orderdetails;

select orderid, unitprice, quantity, insert(discount, 1, 1, "20%") as discount from orderdetails;

select "graduate" as original_token, instr("graduate", "u") as position_of_u;

select instr("7234981", "4");

select "youtube" as original_token, instr("youtube", "tube") as position_of_tube;

select * from employees;

select firstname, instr(firstname, "t") as position_of_t from employees;

select lcase("Miss World") as lower_case;

select lower("Miss World") as lower_case;

select "ABOUT US" as original_token, lcase("ABOUT US") as lower_case;

select ucase("about us") as upper_case;

select upper("about us") as upper_case;

select * from products;

select productname, ucase(productname) as Product_Name from products;

select productname, upper(productname) as Product_Name from products;

select upper(firstname), ucase(lastname) from employees;

select concat(upper(firstname), " ", ucase(lastname)) as employee from employees;

select length("hello world") as length_of_string;

select firstname, length(firstname) as firstname_length, lastname, length(lastname) as lastname_length from employees;

select ltrim(" programmer") as left_trimmed_string;

select ltrim("          school") as left_trimmed_string;

select ltrim(firstname), ltrim(lastname) from employees;

select rtrim("Hello ") as right_trimmed_string;

select rtrim("World    ") as right_trimmed_string;

select * from customers;

select rtrim(companyname) as right_trimmed_companyname from customers;

select trim(" Hello World ") as trimmed_string;

select trim("     Hello World     ") as trimmed_string;

select trim(productname) as trimmed_productname from products;