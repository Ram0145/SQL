-- Database: course_data

-- DROP DATABASE IF EXISTS course_data;
select * from employees order by department;

select * from employees order by department desc; 

--- distinct

select distinct(department) from employees;

--limit 
select * from employees order by 2 limit 10;


--assignment

select student_name from students where age in (18,19,20) ;
--another approach 
select student_name from students where age BETWEEN 18 AND 20 ; 

--Write a query to display all of those students that contain the letters
--"ch" in their name or their name ends with the letters "nd".
select * from students where student_name like '%ch%' or student_name like '%nd';

--display the name of those students that have the
--letters "ae" or "ph" in their name and are NOT 19 years old.
select * from students 
where (student_name like '%ae%' or student_name like '%ph') AND age!= 19;

--The student must not be older than age 20 
--if their student_no is either between 3 and 5 or their student_no is 7. Your query should also return students older than age 20
--but in that case they must have a student_no that is at least 4.
select * from students
where (age<=20 AND student_no in (3,4,5,7)) OR (age> 20  AND student_no >=4);

