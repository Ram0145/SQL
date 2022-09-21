-- Database: course_data

-- DROP DATABASE IF EXISTS course_data;
-- it is a query which is nested inside of an another that uses values from the outer query.

--for every single record of the outer query, the whole inner query will run. 

--lets write a query which shows the persons earning more than there respective department's average. 
--for this we have to use correlated subquery.
select first_name, salary, department
from employees e1
WHERE salary > (select round(AVG(salary)) 
				FROM employees e2 where e1.department = e2.department);
				
select first_name, salary, department,
(select round(AVG(salary)) 
				FROM employees e2 where e1.department = e2.department) as avg_dep
from employees e1;		

select department, (select count(*) from employees e2 where e1.department = e2.department)
from employees e1
group by department
having count(*) >=38;

--above can also we achieved by 
select department
from departments e1 
where 38 <= (select count(*)
			from employees e2
			where e1.department = e2.department);
			
select department, (select MAX(salary) from employees e1 where d.department = e1.department)
from departments d
where 38 <= (select count(*)
			from employees e2
			where d.department = e2.department);

--assignment video

select department, first_name, salary as max_min,
CASE WHEN salary = (select max(salary) from employees e3 where e1.department = e3.department)
THEN 'HIGHEST PAID'
ELSE 'LOWEST PAID'
END AS salary_label
from employees e1
where salary in  (select   min(salary) from employees e2  where e1.department = e2.department) 
OR salary in  (select max(salary) from employees e2  where e1.department = e2.department) 
order by department;

--above query can also be written as 
select department, first_name, salary, 
CASE WHEN salary = max_by_department THEN 'HIGHEST PAID'
	WHEN salary = min_by_department THEN 'LOWEST SALARY'
END AS salary_in_department
FROM(
SELECt department, first_name, salary, 
	(select max(salary) from employees e2 where e1.department = e2.department ) as max_by_department,
	(select min(salary) from employees e2 where e1.department = e2.department ) as min_by_department
FROM employees e1
) a
where salary = max_by_department
or salary = min_by_department
order by department;



























				