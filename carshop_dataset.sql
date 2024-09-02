use carshop;
select database();

show tables;

select * from cars;
describe cars;

select * from manufacturers;
describe manufacturers;

select carname, manufacturername from cars c inner join manufacturers m 
on c.manufacturerid=m.manufacturerid;

select carname, price from cars;

select * from cars where price=25000;

select carid, carname, price, manufacturername from cars as c inner join manufacturers as m 
on c.manufacturerid=m.manufacturerid and price=25000;

select carid, carname, price, manufacturername from cars as c inner join manufacturers as m 
where c.manufacturerid=m.manufacturerid and price=25000;

select * from cars;

select * from cars where price between 14000 and 30000;

select * from cars where price between 14000 and 30000
order by price asc;

select * from cars where price>=14000 and price<=30000
order by price asc;

select * from cars where price>=30000;

select count(*) as number_of_cars from cars where price>=30000;

select * from cars;

select carid, carname, price as usa_price, format(price*70,2) as indian_price, manufacturerid from cars;

select carid, carname, price as usa_price, concat("₹", format(price*70,2)) as indian_price, manufacturerid from cars;

select carid, carname, price as usa_price, concat("KHR", format(price*4101.29,2)) as cambodian_riel_price, manufacturername from 
cars as c inner join manufacturers as m on c.manufacturerid=m.manufacturerid;

select carid, carname, price as usa_price, concat("KHR", format(price*4101.29,2)) as cambodian_riel_price, manufacturername from 
cars as c inner join manufacturers as m on c.manufacturerid=m.manufacturerid
order by manufacturername asc;

select * from cars;

select avg(price) as average_price from cars;

select max(price) as maximum_price from cars;

select carname, price from cars order by price desc;

select carname, price from cars order by price desc limit 1;

select carname, price, manufacturername from cars c inner join manufacturers m 
on c.manufacturerid=m.manufacturerid order by price desc limit 1;

select carname, price, manufacturername from cars c inner join manufacturers m
where c.manufacturerid=m.manufacturerid and manufacturername in ("Honda", "Toyota") order by price desc;

select carname, price, manufacturername from cars c inner join manufacturers m
where c.manufacturerid=m.manufacturerid having manufacturername="Honda" or manufacturername="Toyota";

select * from cars;

select carid, carname, price, manufacturername from cars c inner join manufacturers m
on c.manufacturerid=m.manufacturerid order by price desc;

select database();
use carshop;
select database();
show tables;

select carid, carname, price, manufacturername from cars c inner join manufacturers m
on c.manufacturerid=m.manufacturerid order by manufacturername asc;

select manufacturerid, count(manufacturerid) as number_of_unit_manufactured from cars 
group by manufacturerid order by manufacturerid asc;

select * from manufacturers;

select m.manufacturername, count(c.manufacturerid) as number_of_unit_manufactured from
cars as c inner join manufacturers as m where
c.manufacturerid=m.manufacturerid group by m.manufacturername order by m.manufacturername asc;

select m.manufacturername, count(c.manufacturerid) as number_of_unit_manufactured from
cars as c inner join manufacturers as m on
c.manufacturerid=m.manufacturerid group by m.manufacturername order by number_of_unit_manufactured desc;

select * from cars;
select * from manufacturers;

select m.manufacturername, avg(c.price) as average_price from
cars c inner join manufacturers m on 
c.manufacturerid=m.manufacturerid group by m.manufacturername;

select m.manufacturername, avg(c.price) as average_price from
cars c inner join manufacturers m on 
c.manufacturerid=m.manufacturerid group by m.manufacturername order by average_price desc;

select m.manufacturername, avg(c.price) as average_price from
cars c inner join manufacturers m on 
c.manufacturerid=m.manufacturerid group by m.manufacturername order by m.manufacturername asc, average_price desc;

select m.manufacturername, avg(c.price) as average_price from
cars c inner join manufacturers m where
c.manufacturerid=m.manufacturerid group by m.manufacturername
having average_price>=35000;

select m.manufacturername, avg(c.price) as average_price from
cars c inner join manufacturers m where
c.manufacturerid=m.manufacturerid group by m.manufacturername
having average_price>=35000;

select * from cars;

select carname, price as cheapest_car_price from cars order by price asc limit 1;

select m.manufacturername, c.carname, c.price as cheapest_car_price from 
cars c inner join manufacturers m on
c.manufacturerid=m.manufacturerid order by cheapest_car_price asc limit 1;

select * from cars;

select carid, carname, price from cars 
where price = (select min(price) from cars);

select * from cars;
select * from manufacturers;

select m.manufacturername, c.carname, max(c.price) as maximum_price from 
cars c inner join manufacturers m on
c.manufacturerid=m.manufacturerid group by m.manufacturername order by maximum_price;

select manufacturername, carname, price from cars, manufacturers
where cars.manufacturerid=manufacturers.manufacturerid and
price=(select max(price) from cars where cars.manufacturerid=manufacturers.manufacturerid);

select manufacturername, carname, price from cars, manufacturers
where cars.manufacturerid=manufacturers.manufacturerid and
price=(select max(price) as maximum_price from cars where cars.manufacturerid=manufacturers.manufacturerid);

select database();
use carshop;
select database();

select * from cars;

insert into cars (carid, carname, price, manufacturerid) values
(11, "Land Cruiser", 45000, 1);

select * from cars;
describe cars;

select * from cars;

update cars set carname="CyberTruck" where price=100000 and manufacturerid=106;

select * from cars;

update cars set price=price-(price*0.22);

select * from cars;

select carname, price from cars;

update cars set price=price-(price*0.12) where price>=35000;

select * from cars;

select carid, carname,
concat("$",format(c.price,2)) as "USD_price",
concat("€",format(c.price*0.85,2)) as "Euro_price",
concat("£",format(c.price*0.77,2)) as "Pound_sterling_price",
concat("¥",format(c.price*6.84,2)) as "Yuan_price",
manufacturerid from cars c;

select carid, carname,
concat("$",format(price,2)) as USD_price,
concat("€",format(price*0.85,2)) as Euro_price,
concat("£",format(price*0.77,2)) as Pound_sterling_price,
concat("¥",format(price*6.84,2)) as Yuan_price,
manufacturerid from cars;

select m.manufacturername, c.carname,
concat("$",format(c.price,2)) as USD_price,
concat("€",format(c.price*0.85,2)) as Euro_price,
concat("£",format(c.price*0.77,2)) as Pound_sterling_price,
concat("¥",format(c.price*6.84,2)) as Yuan_price
from cars c inner join manufacturers m
on c.manufacturerid=m.manufacturerid order by m.manufacturername asc;

create view price_list
as select m.manufacturername, c.carname,
concat("$",format(c.price,2)) as USD_price,
concat("€",format(c.price*0.85,2)) as Euro_price,
concat("£",format(c.price*0.77,2)) as Pound_sterling_price,
concat("¥",format(c.price*6.84,2)) as Yuan_price
from cars c inner join manufacturers m
on c.manufacturerid=m.manufacturerid order by m.manufacturername asc;

show tables;

select * from price_list;