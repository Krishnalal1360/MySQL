create database window_functions_db;
select database();
use window_functions_db;
select database();

CREATE TABLE students (

    student_id INT PRIMARY KEY,

    name VARCHAR(50),

    class VARCHAR(10),

    age INT,

    score INT

);

INSERT INTO students (student_id, name, class, age, score) 
VALUES
(1, 'Alice', 'A', 17, 90),
(2, 'Bob', 'A', 16, 85),
(3, 'Carol', 'B', 17, 85),
(4, 'Dave', 'B', 16, 80),
(5, 'Eve', 'A', 17, 75),
(6, 'Frank', 'B', 16, 70),
(7, 'Grace', 'A', 15, 95),
(8, 'Hank', 'B', 15, 60),
(9, 'Ivy', 'A', 17, 82),
(10, 'Jack', 'B', 16, 78),
(11, 'Kate', 'A', 15, 88),
(12, 'Leo', 'A', 17, 75), 
(13, 'Mia', 'B', 17, 85); 

select * from students;
describe students;

/*
1. ROW_NUMBER()
We want to assign a unique row number to each student within their class based on their score, with the highest score getting row number 1.
*/

select student_id, name, class, age, score,
row_number() over (partition by class order by score desc) as "row number" from students;

/*
2. RANK()
We want to rank students within each class based on their scores, with ties getting the same rank and the next rank value being skipped.
*/

select student_id, name, class, age, score,
rank() over (partition by class order by score desc) as rnk from students;

/*
3. DENSE_RANK()
We want to rank students within each class based on their scores, with ties getting the same rank but without skipping the next rank value.
*/

select student_id, name, class, age, score,
dense_rank() over (partition by class order by score desc) as dnse_rnk from students;

/*
4. NTILE()
We want to divide all students into 3 groups based on their scores.
*/

select student_id, name, class, age, score,
ntile(2) over (order by score desc) as tile from students;

select student_id, name, class, age, score,
ntile(3) over (order by score desc) as tile from students;

/*
5. LAG()
We want to compare each student's score with the previous student's score within their class.
*/

select student_id, name, class, age, score,
lag(score) over (partition by class order by score desc) as previous_score from students;

/*
6. LEAD()
We want to compare each student's score with the next student's score within their class.

*/

select student_id, name, class, age, score,
lead(score) over (partition by class order by score desc) as next_score from students;

/*
7. FIRST_VALUE()
We want to find the highest score within each class.
*/

select student_id, name, class, score, age,
first_value(score) over (partition by class order by score desc) as highest_value from students;

/*
8. LAST_VALUE()
We want to find the lowest score within each class.
*/

select student_id, name, class, age, score,
last_value(score) over (partition by class order by score desc
rows between unbounded preceding and unbounded following) as lowest_value from students;

/*
9. NTH_VALUE()
We want to find the second highest score within each class.
*/

select student_id, name, class, age, score, 
nth_value(score, 2) over (partition by class order by score desc
rows between unbounded preceding and unbounded following) as second_highest from students;

select student_id, name, class, age, score, 
nth_value(score, 3) over (partition by class order by score desc
rows between unbounded preceding and unbounded following) as third_highest from students;