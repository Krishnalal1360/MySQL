create database research_db;
use research_db;

CREATE TABLE ResearchWorks (
  ResearchID INTEGER PRIMARY KEY,
  ResearchTitle varchar(50) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Professors (
  ProfessorID INTEGER PRIMARY KEY,
  FirstName varchar(50) NOT NULL ,
  LastName varchar(50) NOT NULL ,
  ResearchWork INTEGER NOT NULL , 
  foreign key (ResearchWork) references ResearchWorks(ResearchID) 
) ENGINE=INNODB;


INSERT INTO ResearchWorks(ResearchID,ResearchTitle,Budget) VALUES(101,'Self Driving Car',1000000);
INSERT INTO ResearchWorks(ResearchID,ResearchTitle,Budget) VALUES(102,'Renewable Energy',25000000);
INSERT INTO ResearchWorks(ResearchID,ResearchTitle,Budget) VALUES(103,'Zero Gravity',500000);
INSERT INTO ResearchWorks(ResearchID,ResearchTitle,Budget) VALUES(104,'Airplane Wing',800000);

INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(1,'Kelly','Anthony',101);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(2,'Author','Brian',101);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(3,'Tessy','Dan',102);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(4,'Gavy','Bandos',102);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(5,'Zain','Terry',101);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(6,'Tim','Babo',104);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(7,'Zaga','Bash',103);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(8,'Ken','Peter',104);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(9,'Tero','Dan',103);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(10,'Zain','Eric',103);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(11,'Michelle','Paul',101);
INSERT INTO Professors(ProfessorID,FirstName,LastName,ResearchWork) VALUES(12,'Zong','Mee',101);

select * from researchworks;

select * from professors;

use research_db;
select database();