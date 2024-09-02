show databases;
create database customer_orders;
show databases;
select database();
use customer_orders;
select database();

create database if not exists project_management;
show databases;
select database();

create database if not exists project_management;

use project_management;
select database();

select schema_name from information_schema.schemata where schema_name="project_management";

select schema_name from information_schema.schemata where schema_name="customer_orders";

drop database customer_orders;
show databases;

drop database project_management;
show databases;

drop database if exists customer_orders;