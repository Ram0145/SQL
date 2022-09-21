-- Database: course_data

-- DROP DATABASE IF EXISTS course_data;
select departments.department from employees, departments;

select * from departments;

select DISTINCT(department) from employees
where department not in (Select department from departments);

select sal.salary from (select * from employees where salary > 160000) sal;

select yearly_sal from (select salary yearly_sal from employees where salary > 160000) sal;

select b.employee_name, yearly_sal
from (select first_name employee_name, salary yearly_sal from employees where salary > 160000) a,
(select department employee_name from departments) b ;

select department 
from employees
where department in ( Select department from departments);

SELECT first_name, last_name, salary, (select first_name from employees where salary > 160000 limit 1)
from employees;

select * from departments;
select * from employees 
where department in ( select department from departments where division = 'Electronics'  );

select * from regions;
select * from employees;
select * 
from employees 
where region_id in (select region_id from regions where country in ('Asia','Canada'))
And salary > 130000;

select e.first_name, e.department, (a.sal-e.salary) diff
from employees e, (select max(salary) sal from employees )a
where region_id in (select region_id from regions where country in ('Asia','Canada'));

--above query can also be written as 

select max(salary) from employees

select first_name, department, (select MAX(salary) from employees) maximum, (select MAX(salary) from employees) - salary diff
from employees 
where region_id in (select region_id from regions where country in ('Asia','Canada')); 	



--any\all

select region_id from regions where country = 'United States';
select * from employees
where region_id > ALL(select region_id from regions where country = 'United States');

select * from employees
where region_id not in (select region_id from regions where country = 'United States');

select * from employees
where region_id > ANY(select region_id from regions where country = 'United States')

select * from (select * from employees
where region_id > ANY(select region_id from regions where country = 'United States'))a where region_id = 1;

select * from (select * from employees
where region_id > ANY(select region_id from regions where country = 'United States'))a where region_id = 2;

select * from employees where region_id = 2;


select * from employees;
select * from departments;
select * from employees 
where department = ANY ( select department from departments where division = 'Kids'  ) 
AND (hire_date > ALL( select hire_date from employees where department like '%aintenan%' ));

select salary , count(*)
from employees
group by salary
order by count(*) desc ,1 desc
limit 1 ;


--above can be also written as  
select salary 
from employees
group by salary 
having count(*) >= All(Select count(*) from employees
					  group by salary)
order by salary desc
limit 1;


--assignment video
create table dupes(id integer, name varchar(10));

INSERT into dupes VALUES(1,'FRANK');
INSERT into dupes VALUES(2,'FRANK');
INSERT into dupes VALUES(3,'ROBERT');
INSERT into dupes VALUES(4,'ROBERT');
INSERT into dupes VALUES(5,'SAM');
INSERT into dupes VALUES(6,'FRANK');
INSERT into dupes VALUES(7,'PETER');

select * from dupes;

select min(id), name
from dupes
group by name;


select AVG(salary) 
from employees
where salary NOT IN (
(select max(salary) from employees),
(select min(salary) from employees)); 

---assignment
select * from students;
select * from student_enrollment;
select * from courses;


select student_name from students
where student_no in 
(select student_no from student_enrollment where course_no in 
 (select course_no from courses where course_title in ('Physics','US History')));

select student_name from students where student_no = 
(select student_no from student_enrollment
group by student_no
order by count(*) desc
 LIMIT 1)
 
--or
select * from students
where age >= ALL(select age from students);















