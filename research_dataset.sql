select database();
use research_db;
select database();

show tables;

select * from researchworks;
select * from professors;

select firstname, lastname from professors where researchwork in
(select researchid from researchworks where budget<1000000);

select firstname, lastname from professors where 
researchwork=(select researchid from researchworks where researchid=101);

select firstname, lastname from professors as p inner join researchworks as r
on p.researchwork=r.researchid;

select firstname, lastname from professors as p inner join researchworks as r
on p.researchwork=r.researchid and budget<1000000;

select * from researchworks;

select * from professors;

select * from researchworks where budget > (select avg(budget) from researchworks);

select * from researchworks where budget > any (select avg(budget) from researchworks);

select * from researchworks where budget > all (select avg(budget) from researchworks);

select firstname, lastname from professors where researchwork =
(select researchid from researchworks order by budget asc limit 1 offset 1);

select * from researchworks;
select * from professors;

select firstname, lastname from professors where
researchwork=(select researchid from 
(select * from researchworks order by budget as asc limit 1 offset 1) as research
);

SELECT FirstName, LastName
FROM Professors
WHERE ResearchWork = (
SELECT res.ResearchID
FROM (SELECT * FROM ResearchWorks ORDER BY budget LIMIT 2) as res
ORDER BY budget DESC LIMIT 1);

select firstname, lastname from professors where
researchwork=(select res.researchid from
(select * from researchworks order by budget limit 2) as res
order by budget desc limit 1);

SELECT FirstName, LastName
FROM Professors WHERE ResearchWork IN (
SELECT ResearchID FROM ResearchWorks WHERE Budget = (
SELECT Budget FROM ResearchWorks
WHERE Budget IN (
SELECT DISTINCT Budget FROM ResearchWorks ORDER BY Budget asc)
order by budget asc limit 1 offset 1)
);

SELECT ResearchTitle FROM ResearchWorks
WHERE 4 <
(
SELECT COUNT(*)
FROM Professors
WHERE ResearchWork = ResearchID
);

select * from professors;
select * from researchworks;

select researchtitle from researchworks where 
4 < ( select count(*) from professors where researchwork=researchid
);

select researchtitle from researchworks where researchid in
(select researchwork from professors group by researchwork having count(*)>4);

select researchtitle from researchworks as r inner join professors as p on
r.researchid=p.researchwork group by researchwork having count(*)>4;