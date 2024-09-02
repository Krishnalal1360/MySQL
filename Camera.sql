create database camera;
use camera;
select database();

CREATE TABLE Items (
  ItemID INTEGER PRIMARY KEY NOT NULL,
  ItemName TEXT NOT NULL
  );
  
 CREATE TABLE Suppliers (
  SupplierID VARCHAR(40) PRIMARY KEY NOT NULL,  
  SupplierName TEXT NOT NULL 
  );
  
 CREATE TABLE Supplies (
  Item INTEGER, 
  FOREIGN KEY (Item) REFERENCES Items(ItemID),
  Supplier VARCHAR(40), 
  FOREIGN KEY (Supplier) REFERENCES Suppliers(SupplierID),  
  UnitPrice INTEGER NOT NULL,
  PRIMARY KEY(Item, Supplier) 
  );

INSERT INTO Items(ItemID, ItemName) VALUES(1,'Nikko Camera');
INSERT INTO Items(ItemID, ItemName) VALUES(2,'Canon Camera');
INSERT INTO Items(ItemID, ItemName) VALUES(3,'Sony Camera');
INSERT INTO Items(ItemID, ItemName) VALUES(4,'Red Camera');
INSERT INTO Items(ItemID, ItemName) VALUES(5,'Lense');

INSERT INTO Suppliers(SupplierID, SupplierName) 
VALUES	('TLP','Telo PVT'),
		('PERF','Perfect-Tech'),
		('MDI','Moore Digital'),
		('DVE','Dymofed ventures'),
		('LIGE','Ligmus Enterprise');

INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(1,'TLP',1500);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(2,'TLP',1400);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(4,'MDI',2200);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(4,'TLP',7000);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(5,'MDI',2800);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(5,'LIGE',3700);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(2,'PERF',1600);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(3,'TLP',1900);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(4,'LIGE',4400);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(1,'PERF',900);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(4,'PERF',2600);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(2,'MDI',1350);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(3,'DVE',7100);
INSERT INTO Supplies(Item, Supplier, UnitPrice) VALUES(1,'LIGE',1100);

select * from items;

select * from suppliers;

select * from supplies;