use camera;
select database();

show tables;

select * from items;
describe items;

select * from suppliers;
describe suppliers;

select * from supplies;
describe supplies;

select * from items;

select itemname from items;

select itemname as "ITEM NAME" from items;

select * from items;
select * from suppliers;
select * from supplies;

select suppliername as "SUPPLIER NAME" , itemname as "ITEM NAME", unitprice as "UNIT PRICE" from supplies s 
inner join items i on s.item=i.itemid
inner join suppliers su on su.supplierid=s.supplier;

select * from items;
select * from suppliers;
select * from supplies;

select sum(unitprice) as Sum,
avg(unitprice) as Average, 
min(unitprice) as Minimum, 
max(unitprice) as Maximum, 
count(unitprice) as Count 
from supplies;

select * from items;
select * from suppliers;
select * from supplies;

select su.supplierid as "Supplier_ID", concat(format(avg(s.unitprice),2)) as "Average_price", su.suppliername as "Supplier_Name" 
from supplies s inner join suppliers su on su.supplierid=s.supplier group by su.supplierid;

select su.supplierid as "Supplier_ID", concat(format(avg(s.unitprice),2)) as "Average_price", su.suppliername as "Supplier_Name" 
from supplies s inner join suppliers su on su.supplierid=s.supplier group by s.supplier;

select * from supplies;

select supplier as "SUPPLIER_ID", avg(unitprice) as "UNIT_PRICE" from supplies
group by supplier;

select * from items;
select * from suppliers;
select * from supplies;

select su.supplierid, su.suppliername,
max(s.unitprice) as Maximum_unitprice, 
min(s.unitprice) as Minimum_unitprice, 
sum(s.unitprice) as Total_unitprice from supplies s
inner join suppliers su on su.supplierid=s.supplier group by su.supplierid;

select unitprice from supplies where supplier="TLP";

select su.supplierid, su.suppliername,
max(s.unitprice) as Maximum_unitprice, 
min(s.unitprice) as Minimum_unitprice, 
sum(s.unitprice) as Total_unitprice from supplies s
left join suppliers su on su.supplierid=s.supplier group by su.supplierid;

select su.supplierid, su.suppliername,
max(s.unitprice) as Maximum_unitprice, 
min(s.unitprice) as Minimum_unitprice, 
sum(s.unitprice) as Total_unitprice from suppliers su
right join supplies s on su.supplierid=s.supplier group by su.supplierid;

select * from items;
select * from suppliers;
select * from supplies;

select su.suppliername, i.itemname, s.unitprice from supplies as s
inner join items i on s.item=i.itemid
inner join suppliers su on s.supplier=su.supplierid;

select count(*) from supplies;

select su.suppliername, i.itemname, s.unitprice from supplies as s
inner join items i on s.item=i.itemid
inner join suppliers su on s.supplier=su.supplierid
order by suppliername asc;

select su.suppliername, i.itemname, s.unitprice from supplies as s
inner join items i on s.item=i.itemid
inner join suppliers su on s.supplier=su.supplierid
order by unitprice desc;

select * from suppliers;

select supplierid, suppliername from suppliers where supplierid="MDI";

select * from items;
select * from suppliers;
select * from supplies;

select su.supplierid, su.suppliername, i.itemname from supplies as s
inner join items as i on s.item=i.itemid
inner join suppliers as su on s.supplier=su.supplierid;

create view product_list
as (select su.supplierid, su.suppliername, i.itemname from supplies as s
inner join items as i on s.item=i.itemid
inner join suppliers as su on s.supplier=su.supplierid);

show tables;
select * from product_list;

select su.supplierid, su.suppliername, i.itemname from supplies as s
inner join items as i on s.item=i.itemid
inner join suppliers as su on s.supplier=su.supplierid
where supplierid="MDI";

select * from items;
select * from suppliers;
select * from supplies;

select itemname from items where 
itemid in (select item from supplies where 
supplier in (select supplierid from suppliers where supplierid="MDI")
);

select * from supplies;

select item, supplier, unitprice as original_price, unitprice*1.05 as increased_price from supplies;

update supplies
set unitprice=unitprice+0.05*unitprice;

select * from supplies;

select * from items;
select * from suppliers;
select * from supplies;

select i.itemname, su.suppliername, s.unitprice as Maximum_price from supplies s
inner join items i on s.item=i.itemid
inner join suppliers su on s.supplier=su.supplierid
where s.unitprice=(select max(s.unitprice) from supplies s where s.item=i.itemid);

select i.itemname, su.suppliername, s.unitprice as Minimum_price from supplies s
inner join items i on s.item=i.itemid
inner join suppliers su on s.supplier=su.supplierid
where s.unitprice=(select min(s.unitprice) from supplies s where s.item=i.itemid);

select * from items;
select * from suppliers;
select * from supplies;

select su.supplierid, su.suppliername from suppliers su 
inner join supplies s on su.supplierid=s.supplier
where s.item=1;

select su.supplierid, su.suppliername from suppliers su 
inner join supplies s on su.supplierid=s.supplier
and s.item=1;

select su.supplierid, su.suppliername from suppliers su
where su.supplierid in 
(select s.supplier from supplies s where s.item=1);

select * from items;
select * from suppliers;
select * from supplies;

select su.supplierid, su.suppliername from suppliers su
inner join supplies s on su.supplierid=s.supplier
where s.item = (select i.itemid from items i where itemname="Canon Camera");

select * from supplies order by unitprice desc;

select max(unitprice) from supplies;

select * from supplies order by unitprice desc limit 1;

select * from supplies order by unitprice desc limit 1 offset 1;

select * from supplies order by unitprice desc limit 1,1;

select * from supplies order by unitprice desc limit 1,2;

select database();
use camera;
select database();
show tables;

select unitprice from supplies where
unitprice not in (select max(unitprice) from
(select distinct unitprice from supplies order by unitprice desc) as price2
)order by unitprice desc limit 1;

select * from items;

select itemid, itemname, ucase(itemname) as Upper_case_Items, upper(itemname) as UpperCase_Items from items;