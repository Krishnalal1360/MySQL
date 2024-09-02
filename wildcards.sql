create database wildcard_db;
select database();
use wildcard_db;
select database();

CREATE TABLE PatternMatchingExamples (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(255),
    category VARCHAR(50),
    description TEXT,
    code VARCHAR(50),
    date DATE,
    phone VARCHAR(20),
    email VARCHAR(100)
);

INSERT INTO PatternMatchingExamples (text, category, description, code, date, phone, email)
VALUES 
('Pattern One', 'TypeA', 'This is a simple description for pattern one.', 'A123', '2024-02-01', '123-456-7890', 'example@domain.com'),
('Pattern Two', 'TypeB', 'Detailed description that mentions pattern two explicitly.', 'B234', '2024-02-02', '+44 123 4567', 'user@sample.net'),
('Sample Pattern', 'TypeC', 'Another kind of text, related to sample patterns.', 'C345', '2024-02-03', '987-654-3210', 'contact@website.org'),
('Random Text', 'TypeD', 'Text that does not necessarily match common patterns.', 'D456', '2024-02-04', '+1 (800) 123-4567', 'info@random.com'),
('Restaurant Guide', 'Restaura', 'Guide to choosing the best restaurant.', 'E567', '2024-02-05', '+44 800 900 1234', 'guide@foodplace.com'),
('Technology Trends', 'Tech', 'Latest trends in the tech industry.', 'F678', '2024-02-06', '1-800-TECH', 'trends@technews.com'),
('Sales Report 2024', 'Sales', 'Annual report on sales performance.', 'G789', '2024-02-07', '123.456.7890', 'report@salescompany.com'),
('Global Market Analysis', 'Market', 'In-depth analysis of global markets.', 'H890', '2024-02-08', '+44 700 800 9000', 'market@analysis.global'),
('Customer Feedback', 'Feedback', 'Feedback from various customers.', 'I901', '2024-02-09', '555-CONTACT', 'feedback@service.com'),
('Employee Directory', 'HR', 'Contact information for all employees.', 'J012', '2024-02-10', '+1 234 567 8901', 'directory@enterprise.com');

select * from patternmatchingexamples;
describe patternmatchingexamples;

alter table patternmatchingexamples rename to pattern;
select * from pattern;
describe pattern;

select category from pattern;

select * from pattern where category="Feedback";

select * from pattern;

select * from pattern where phone like "+44%";

select * from pattern where phone like "%1234";

select * from pattern;

select * from pattern where text like "%Global Market Analysis%";

select * from pattern where description like "%restaurant%";

select * from pattern where phone not like "+44%";

select * from pattern where phone not like "1234%";

select * from pattern where text not like "%Global Market Analysis%";

select * from pattern where description not like "%restaurant%";

select * from pattern where category="tech";

select * from pattern where description like "%tech%";

select * from pattern where category="tech" or description like "%tech%";

select * from pattern where category="tech" and description like "%tech%";

select * from pattern;

select * from pattern where date="2024-02-01";

select * from pattern where year(date)="2024";

select * from pattern where month(date)="02";

select * from pattern where day(date)="05";

select * from pattern where description like "%sales%" and year(date)="2024";

select * from pattern;

select * from pattern where category="HR" and (phone not like "%-%" or email not like "%@%");