Create database carshop;
use carshop;

create table manufacturers (
	manufacturerid int primary key not null,
	manufacturername varchar(50) NOT NULL 
);

create table cars (
	carid int primary key not null,
	carname varchar(50) not null,
	price real not null,
	manufacturerid int not null
);

INSERT INTO Manufacturers(ManufacturerID,ManufacturerName) VALUES(101,'Toyota');
INSERT INTO Manufacturers(ManufacturerID,ManufacturerName) VALUES(102,'Honda');
INSERT INTO Manufacturers(ManufacturerID,ManufacturerName) VALUES(103,'BMW');
INSERT INTO Manufacturers(ManufacturerID,ManufacturerName) VALUES(104,'Hyudai');
INSERT INTO Manufacturers(ManufacturerID,ManufacturerName) VALUES(105,'Mercedes-Benz');
INSERT INTO Manufacturers(ManufacturerID,ManufacturerName) VALUES(106,'Tesla');

INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(1,'C-Class',40000,105);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(2,'Model S',40000,106);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(3,'Elentra',14000,104);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(4,'Truck',100000,106);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(9,'6 Series',40000,103);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(5,'Corolla',25000,101);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(6,'Civic',21000,102);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(7,'Vivo',11000,102);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(8,'4 Series',30000,103);
INSERT INTO Cars(CarID,CarName,Price,ManufacturerID) VALUES(10,'Odyssey',30000,102);

select * from manufacturers;
describe manufacturers;

select * from cars;
describe cars;