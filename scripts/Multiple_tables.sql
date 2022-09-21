-- Database: course_data

-- DROP DATABASE IF EXISTS course_data;


select first_name, country
from employees e, regions r
where e.region_id = r.region_id;

select * from departments;
select * from employees;
select * from regions;
select e.first_name, e.email, d.department, d.division, r.country
from employees e, departments d, regions r
where e.department = d.department
and e.region_id = r.region_id
and e.email is not null;

select r.country, count(*)
from employees e, regions r
where e.region_id = r.region_id
group by r.country;


--Joins
--Join and Inner join   both are same
select first_name, country
from employees e
INNER JOIN regions r
ON e.region_id = r.region_id;

select *
from employees e
INNER JOIN regions r
ON e.region_id = r.region_id; 

select first_name, country, email
from employees e
INNER JOIN regions r
ON e.region_id = r.region_id
where e.email is not null;

--first inner most join will execute after that next one
select first_name, email, division, country
from employees 
INNER JOIN departments
ON employees.department = departments.department
INNER JOIN regions 
ON employees.region_id = regions.region_id    
where email is not null; 

select distinct department from employees; --27
select distinct department from departments; --24
SELECT distinct e.department,d.department
from employees e
INNER JOIN departments d
ON e.department= d.department; --23 that means departments table having 1 value which is not in employees

--OUTER JOINS
SELECT distinct e.department,d.department
from employees e
LEFT JOIN departments d
ON e.department= d.department;

SELECT distinct e.department,d.department
from employees e
RIGHT JOIN departments d
ON e.department= d.department;

SELECT distinct e.department,d.department
from employees e
LEFT JOIN departments d
ON e.department= d.department
where d.department is null;

SELECT distinct e.department,d.department
from employees e
RIGHT JOIN departments d
ON e.department= d.department
where e.department is null;

SELECT distinct e.department,d.department
from employees e
FULL OUTER JOIN departments d
ON e.department= d.department


--Union and Union All
select department 
from employees
UNION
select department from departments; --28 

select distinct department 
from employees
UNION
select department from departments; --28

select distinct department 
from employees
UNION ALL
select department from departments; --51

select department 
from employees
UNION ALL
select department from departments; --1024


select distinct department, region_id
from employees
UNION ALL
select department from departments; --error (each UNION query must have the same number of columns)

select distinct department, first_name
from employees
UNION ALL
select department, division from departments; --this will work

select distinct department, region_id
from employees
UNION ALL
select department, division from departments;  --error(  UNION types integer and character varying cannot be matched)

select distinct department 
from employees
UNION ALL
select department from departments
order by department; --order by has to be at last **************

select distinct department 
from employees
where lower(department) like '%ing'
UNION ALL
select department from departments;

--Except
--this will take the first result set and removes everything which are present in second result set
select distinct department 
from employees
EXCEPT
select department from departments;

select department from departments
except
select distinct department 
from employees;    --other databases will use MINUS instead of this excpet 

select department, count(employee_id)
from employees
group by department
UNION ALL
select 'Total', count(*)
from employees;  --if we use Union then output will be mixed, so inorder to dump the first executed reult on top of the other, we used Union ALL


--Cross JOIN (Cartesian Product using Cross Join)
select * from employees, departments; --24000 (Cartesian product occured (24*1000))

select * from employees CROSS JOIN departments; --same result as above 


---------------------
select first_name, department, hire_date, r.country
from employees e
JOIN regions r
ON e.region_id = r.region_id
where hire_date = (select MIN(hire_date) from employees)
OR hire_date = (select MAX(hire_date) from employees);

--above query can also be writeen as and also in min hire date, we are getting 2 records. Using the below query we can get rid of that
select first_name, department, hire_date, r.country
from employees e
JOIN regions r
ON e.region_id = r.region_id
where hire_date = (select MIN(hire_date) from employees)
LIMIT 1
UNION ALL
select first_name, department, hire_date, r.country
from employees e
JOIN regions r
ON e.region_id = r.region_id
where hire_date = (select MAX(hire_date) from employees); --we will get syntax error 

(select first_name, department, hire_date, r.country
from employees e
JOIN regions r
ON e.region_id = r.region_id
where hire_date = (select MIN(hire_date) from employees)
LIMIT 1)
UNION ALL
select first_name, department, hire_date, r.country
from employees e
JOIN regions r
ON e.region_id = r.region_id
where hire_date = (select MAX(hire_date) from employees);

--moving range
select hire_date, salary,
(select sum(salary) from employees e2
	where e2.hire_date between e.hire_date -90 AND e.hire_date) as spending_pattern
from employees e
order by hire_date;


--creating views vs inline views
--view is avirtual table, generated via sql query
create view v_employee_information as 
select first_name, email, d.department, salary, division, region, country
from employees e, departments d, regions r
where e.department =d.department
and e.region_id = r.region_id;

select * from v_employee_information; --we can use joins and all other operations other than insert, update or delete

--inline view  --subquery inside the from is called inline view
select * 
from (select * from departments) a;


--asignment
select * from students;
select * from student_enrollment;
select * from professors;
select * from courses;
select * from teach;

select s.student_name, c.course_title, p.last_name
from students s
inner join student_enrollment se
on s.student_no = se.student_no
inner join teach t
on se.course_no = t.course_no
inner join professors p 
on p.last_name = t.last_name
inner join courses c
on c.course_no = se.course_no
order by s.student_name;

select first_name, salary
from employees e1
where e1.salary > (select AVG(salary) from employees e2 where e1.department = e2.department );
































