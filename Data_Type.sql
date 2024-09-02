create database data_type;
select database();
use data_type;

CREATE TABLE RetailPlatform (

    UserID BIGINT,

    Age TINYINT,

    ProductID SMALLINT,

    ProductRating TINYINT,

    WarehouseID MEDIUMINT,

    TransactionID INT

);

INSERT INTO RetailPlatform (UserID, Age, ProductID, ProductRating, WarehouseID, TransactionID)
VALUES

(10000000001, 25, 1200, 5, 300, 200000000),

(10000000002, 30, 1300, 4, 301, 200000001),

(10000000003, 35, 1400, 3, 302, 200000002),

(10000000004, 40, 1500, 2, 303, 200000003),

(10000000005, 45, 1600, 1, 304, 200000004);

show tables;
select * from retailplatform;
select userid, productid, warehouseid, transactionid from retailplatform;

CREATE TABLE books (

id INT AUTO_INCREMENT PRIMARY KEY,

title VARCHAR(255) NOT NULL,

author VARCHAR(255),

isInStock BOOLEAN NOT NULL DEFAULT 1, -- 1 for true, 0 for false

isOnSale BOOLEAN NOT NULL DEFAULT 0 -- 1 for true, 0 for false

);

INSERT INTO books (title, author, isInStock, isOnSale)
VALUES
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 1, 0),

('To Kill a Mockingbird', 'Harper Lee', 1, 1),

('The Great Gatsby', 'F. Scott Fitzgerald', 0, 0),

('Moby Dick', 'Herman Melville', 1, 0),

('1984', 'George Orwell', 1, 1);

select * from books;
select title, isinstock, isonsale from books;

CREATE TABLE EmployeeFinance (

    EmployeeID INT,

    Salary DECIMAL(8,2),

    Bonus DECIMAL(8,2)

);

INSERT INTO EmployeeFinance (EmployeeID, Salary, Bonus)
VALUES
(1001, 5000.00, 200.50),

(1002, 6000.00, 300.75),

(1003, 7000.00, 400.25),

(1004, 8000.00, 500.50),

(1005, 9000.00, 600.75);

select * from employeefinance;
show tables;
select employeeid, bonus from employeefinance;

CREATE TABLE ResearchData (

    ExperimentID INT,

    MeasurementFloat FLOAT,

    MeasurementDouble DOUBLE

);

INSERT INTO ResearchData (ExperimentID, MeasurementFloat, MeasurementDouble)
VALUES
(101, 0.12345, 0.12345678901234),

(102, 12345.6789, 12345.67890123456789),

(103, 0.000012345, 0.00001234567890123456),

(104, 1234567890.1234, 1234567890.1234567890123456),

(105, -12345.6789, -12345.67890123456789);

select * from researchdata;
show tables;
select experimentid, measurementdouble from researchdata;

CREATE TABLE ServerStatus (

    ServerID INT,

    ModuleStatus BIT(8)

);

INSERT INTO ServerStatus (ServerID, ModuleStatus)
VALUES

(1, b'11111111'),

(2, b'11111110'),

(3, b'11001100'),

(4, b'10101010'),

(5, b'00000000');

select * from serverstatus;
select serverid, modulestatus from serverstatus;
show tables;

CREATE TABLE Products (

    ProductCode CHAR(5),

    ProductName VARCHAR(100),

    Description VARCHAR(255)

);

INSERT INTO Products (ProductCode, ProductName, Description)
VALUES

('P001A', 'Apple', 'Fresh and juicy red apples'),

('P002B', 'Banana', 'Sweet and delicious yellow bananas'),

('P003C', 'Carrot', 'Crunchy and healthy carrots'),

('P004D', 'Dates', 'Sweet and nutritious dates'),

('P005E', 'Eggplant', 'Fresh and organic eggplants');

select * from products;
select productname, description from products;
show tables;

CREATE TABLE UserProfiles (

    UserID VARCHAR(50),

    Username VARCHAR(50),

    PasswordHash BINARY(32)

);

INSERT INTO UserProfiles (UserID, Username, PasswordHash)
VALUES
('USR001', 'Alice', UNHEX('AABBCCDDEEFF00112233445566778899AABBCCDDEEFF0011')),

('USR002', 'Bob', UNHEX('BBCCDDEEFF00112233445566778899AABBCCDDEEFF001122')),

('USR003', 'Charlie', UNHEX('CCDDEEFF00112233445566778899AABBCCDDEEFF00113344')),

('USR004', 'Dave', UNHEX('DDEEFF00112233445566778899AABBCCDDEEFF0011445566')),

('USR005', 'Eve', UNHEX('EEFF00112233445566778899AABBCCDDEEFF001155667788'));

select * from userprofiles;
select username, passwordHash from userprofiles;
show tables;

CREATE TABLE DigitalAssets (

    AssetID INT,

    AssetName VARCHAR(255),

    AssetType VARCHAR(50),

    AssetData MEDIUMBLOB

);

-- Inserting binary data like this is generally not done in raw SQL, since binary data isn't easily represented as text.

-- Instead, you'd use a function or method in your programming language of choice to read the file data and insert it into the database.

-- For the sake of simplicity, we'll insert a simple string as binary data.

INSERT INTO DigitalAssets (AssetID, AssetName, AssetType, AssetData)
VALUES

(1, 'Sample Text Document', 'text', UNHEX('48656C6C6F20576F726C6421')),

(2, 'Sample Image', 'image', UNHEX('AABBCC')),

(3, 'Sample Video', 'video', UNHEX('112233')),

(4, 'Sample Audio', 'audio', UNHEX('445566')),

(5, 'Another Text Document', 'text', UNHEX('5468697320697320616E6F74686572207465787420646F63756D656E742E'));

CREATE TABLE BlogPosts (

    PostID INT,

    Title VARCHAR(255),

    Content MEDIUMTEXT

);

INSERT INTO BlogPosts (PostID, Title, Content)
VALUES

(1, 'First Blog Post', 'This is the content of the first blog post. It is quite short.'),

(2, 'Second Blog Post', 'This is the content of the second blog post. It is a bit longer than the first one. It has a couple of paragraphs.'),

(3, 'Third Blog Post', 'This is the content of the third blog post. It is quite long, and goes into a lot of detail on a particular topic.'),

(4, 'Fourth Blog Post', 'This is the content of the fourth blog post. It is medium length, and covers a few different topics.'),

(5, 'Fifth Blog Post', 'This is the content of the fifth blog post. It is very long, and covers many different topics in great detail.');

select * from digitalassets;
select assetname, assettype from digitalassets;
select * from blogposts;
select title, content from blogposts;
show tables;

CREATE TABLE Students (

    ID INT AUTO_INCREMENT,

    Name VARCHAR(100),

    Grade ENUM('Freshman', 'Sophomore', 'Junior', 'Senior'),

    PRIMARY KEY(ID)

);

INSERT INTO Students (Name, Grade)
VALUES

('John Doe', 'Freshman'),

('Jane Smith', 'Sophomore'),

('Alice Johnson', 'Junior'),

('Bob Williams', 'Senior'),

('Charlie Brown', 'Freshman');

select * from students;
select name, grade from students;

CREATE TABLE Book (

    BookID INT AUTO_INCREMENT,

    Title VARCHAR(100),

    Author VARCHAR(100),

    Genres SET('Science Fiction', 'Adventure', 'Thriller', 'Romance', 'Fantasy', 'Mystery', 'Horror'),

    PRIMARY KEY(BookID)

);

INSERT INTO Book (Title, Author, Genres)
VALUES

('The Galactic Adventure', 'John Doe', 'Science Fiction,Adventure'),

('Romantic Spaceships', 'Jane Smith', 'Science Fiction,Romance'),

('Mysteries of the Universe', 'Robert Brown', 'Science Fiction,Mystery'),

('Thrills in Space', 'Emma White', 'Science Fiction,Thriller'),

('Fantasy of Stars', 'Emily Johnson', 'Science Fiction,Fantasy');

select * from Book;
select title, genres from book;

CREATE TABLE Movies (

    MovieID INT AUTO_INCREMENT,

    MovieName VARCHAR(100),

    ShowDateTime DATETIME,

    ReleaseYear YEAR(4),

    LastUpdated TIMESTAMP,

    PRIMARY KEY(MovieID)

);

INSERT INTO Movies (MovieName, ShowDateTime, ReleaseYear)
VALUES

('The Great Movie', '2023-08-10 20:00:00', 2023),

('Another Great Movie', '2023-08-11 18:00:00', 2023),

('Old Classic', '2023-08-11 16:00:00', 1990),

('Interesting Documentary', '2023-08-12 15:00:00', 2022),

('Kids Movie', '2023-08-12 14:00:00', 2023);

select * from movies;
select moviename, showdatetime, releaseyear from movies;
show tables;

CREATE TABLE DeliveryLocations (

    ID INT AUTO_INCREMENT,

    CustomerName VARCHAR(100),

    Location POINT,

    PRIMARY KEY(ID)

);

INSERT INTO DeliveryLocations (CustomerName, Location)
VALUES

('John', ST_GeomFromText('POINT(1 1)')),

('Jane', ST_GeomFromText('POINT(2 3)')),

('Jack', ST_GeomFromText('POINT(3 2)')),

('Jim', ST_GeomFromText('POINT(4 4)')),

('Julia', ST_GeomFromText('POINT(5 5)'));

CREATE TABLE DeliveryRoutes (

    ID INT AUTO_INCREMENT,

    RouteName VARCHAR(50),

    RoutePath LINESTRING,

    PRIMARY KEY(ID)

);

INSERT INTO DeliveryRoutes (RouteName, RoutePath)
VALUES

('Route1', ST_GeomFromText('LINESTRING(1 1,2 2,3 3)')),

('Route2', ST_GeomFromText('LINESTRING(2 2,3 3,4 4)')),

('Route3', ST_GeomFromText('LINESTRING(3 3,4 4,5 5)')),

('Route4', ST_GeomFromText('LINESTRING(4 4,5 5,6 6)')),

('Route5', ST_GeomFromText('LINESTRING(5 5,6 6,7 7)'));

CREATE TABLE DeliveryZones (

    ID INT AUTO_INCREMENT,

    ZoneName VARCHAR(50),

    ZoneArea POLYGON,

    PRIMARY KEY(ID)

);

INSERT INTO DeliveryZones (ZoneName, ZoneArea)
VALUES

('Zone1', ST_GeomFromText('POLYGON((1 1,1 2,2 2,2 1,1 1))')),

('Zone2', ST_GeomFromText('POLYGON((2 2,2 3,3 3,3 2,2 2))')),

('Zone3', ST_GeomFromText('POLYGON((3 3,3 4,4 4,4 3,3 3))')),

('Zone4', ST_GeomFromText('POLYGON((4 4,4 5,5 5,5 4,4 4))')),

('Zone5', ST_GeomFromText('POLYGON((5 5,5 6,6 6,6 5,5 5))'));

select * from deliverylocations;
select * from deliveryroutes;
select * from deliveryzones;

CREATE TABLE Product (

    ProductID INT AUTO_INCREMENT,

    ProductName VARCHAR(100),

    Attributes JSON,

    PRIMARY KEY (ProductID)

);

INSERT INTO Product (ProductName, Attributes)
VALUES

('T-shirt', '{"color": "blue", "size": "M", "brand": "BrandA"}'),

('Coffee Mug', '{"color": "white", "brand": "BrandB", "volume": "300ml"}'),

('Book', '{"author": "AuthorName", "pages": 200, "publisher": "PublisherName"}'),

('Laptop', '{"brand": "BrandC", "ram": "16GB", "storage": "512GB SSD"}'),

('Smartphone', '{"brand": "BrandD", "ram": "8GB", "storage": "128GB", "color": "black"}');

select * from product;
select productname, attributes from product;
show tables;