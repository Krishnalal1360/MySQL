create database update_replace_db;
select database();
use update_replace_db;
select database();

CREATE TABLE Cars (
    CarID INTEGER PRIMARY KEY NOT NULL,
    CarName CHAR(50) NOT NULL,
    Price REAL NOT NULL,
    ManufacturerID INTEGER NOT NULL,
    Description TEXT,
    Features TEXT,
    CarModel TEXT
);

INSERT INTO Cars(CarID, CarName, Price, ManufacturerID, Description, Features, CarModel) VALUES
(1, 'C-Class', 40000, 105, 'Great car with ac and powerwindow', 'GPSnavigation Bluetoothconnection', 'SedanModelX'),
(2, 'Model S', 40000, 106, 'Electric car with autolock and ac', 'Bluetoothconnection backupcamera', 'CoupeModelY'),
(3, 'Elantra', 14000, 104, 'Affordable car with ac', 'GPSnavigation backupcamera', 'HatchbackModelZ'),
(4, 'Truck', 100000, 106, 'Heavy duty with autolock', 'Bluetoothconnection', 'TruckModelV'),
(5, 'Corolla', 25000, 101, 'Reliable car with powerwindow', 'GPSnavigation', 'SedanModelZ'),
(6, 'Civic', 21000, 102, 'Economical with autolock', 'Bluetoothconnection', 'CoupeModelX'),
(7, 'Vivo', 11000, 102, 'Compact with ac', 'backupcamera', 'HatchbackModelY'),
(8, '4 Series', 30000, 103, 'Luxury car with powerwindow', 'Bluetoothconnection GPSnavigation', 'CoupeModelZ'),
(9, '6 Series', 40000, 103, 'Sporty with autolock', 'backupcamera', 'SedanModelY'),
(10, 'Odyssey', 30000, 102, 'Family car with ac and powerwindow', 'GPSnavigation', 'MinivanModelX'),
(11, 'MiniCooper', 22000, 103, 'Compact and efficient', 'GPSnavigation Bluetoothconnection', 'CompactModel');

select * from cars;
describe cars;

update cars set price="16000" where carname="Elantra";

select * from cars where carname="Elantra";

CREATE TABLE Manufacturers (
    ManufacturerID INTEGER PRIMARY KEY NOT NULL,
    ManufacturerName CHAR(50) NOT NULL 
);

INSERT INTO Manufacturers(ManufacturerID, ManufacturerName) VALUES
(101, 'Toyota'),
(102, 'Honda'),
(103, 'BMW'),
(104, 'Hyudai'),
(105, 'Mercedes-Benz'),
(106, 'Tesla');

show tables;

update manufacturers set manufacturername="Hyundai" where manufacturername="Hyudai";

select * from manufacturers where manufacturername="Hyundai";

select * from cars;

update cars set price=1.10*price where price<20000;

select * from cars;

select * from manufacturers;

update cars set price=price+5000 where manufacturerid=(select manufacturerid from manufacturers where manufacturername="Tesla");

select * from cars;

update cars set price=price+10000 where manufacturerid=(select manufacturerid from manufacturers where manufacturername="BMW");

select * from cars;

update cars set carname="Model S Special Edition", price=35000 where carname="Model S";

select * from cars;

update cars set carname="Model S Special Edition", price=35000 where carname="Model S" and manufacturerid=106;

select * from cars;

update cars set carname="Model S Special Edition", price=35000 where carname="Model S" and manufacturerid=
(select manufacturerid from manufacturers where manufacturername="Tesla");

select * from cars;

update cars set carname="Civic 2024", price=price+2000 where carname="Civic" and manufacturerid=
(select manufacturerid from manufacturers where manufacturername="Honda");

select * from cars;

select * from manufacturers;

update cars set carname="C-Class Luxury Edition", price=42000 where carname="C-Class" and manufacturerid=
(select manufacturerid from manufacturers where manufacturername="Mercedes-Benz");

select * from cars;

select * from cars where carname="Vivo";

select manufacturername from manufacturers where manufacturerid=102;

update cars set carname=replace(carname, "Vivo", "Vivos") where carname like "%Vivo%";

select * from cars;

update cars set carname=replace(carname, "MiniCooper", "Mini Cooper") where carname like "%MiniCooper%";

select * from cars;

UPDATE Cars
SET Description = REPLACE(REPLACE(REPLACE(Description, 'ac', 'AC'), 'powerwindow', 'power window'), 'autolock', 'auto lock')
WHERE Description LIKE '%ac%' OR Description LIKE '%powerwindow%' OR Description LIKE '%autolock%';

update cars set description=replace(replace(replace(description, "ac", "AC"), "powerwindow", "power window"), "autolock", "auto lock")
where description like "%ac%" or description like "%powerwindow%" or description like "%autolock%";

select * from cars; 