-- Database: course_data

-- DROP DATABASE IF EXISTS course_data;

--conditinal expressions
select salary from employees;

select first_name, salary,
	CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 THEN 'PAID WELL'
	END
from employees
ORDER by salary desc ;

select first_name, salary,
	CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	ELSE 'PAID WELL'
	END category
from employees
ORDER by salary desc ;

select category, count(*)
from (
select first_name, salary,
	CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
	ELSE 'EXECUTIVE'
	END category
from employees
ORDER by salary desc) a
group by category;

--transposing
select SUM(CASE WHEN salary < 100000 THEN 1 ELSE 0 END) "UNDER PAID" ,
	SUM(CASE WHEN salary > 100000 AND salary < 160000 THEN 1 ELSE 0 END) "PAID WELL",
	SUM(CASE WHEN salary > 160000 THEN 1 ELSE 0 END) "EXECUTIVE"
from employees;

select department, count(*)
from employees
where department in ('Sports','Tools','Clothing','Computers')
group by department;

SELECT 
SUM(CASE WHEN department = 'Sports' THEN 1 ElSE 0 END) sports_employees,
SUM(CASE WHEN department = 'Tools' THEN 1 ElSE 0 END) tools_employees,
SUM(CASE WHEN department = 'Clothing' THEN 1 ElSE 0 END) clothing_employees,
SUM(CASE WHEN department = 'Computers' THEN 1 ElSE 0 END) computers_employees
from employees;

select r.region_id, country from regions r, employees e 
where e.region_id = r.region_id;
select * from regions;

select first_name, 
CASE WHEN region_id = 1 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 1 LIMIT 1) END region_1, 
CASE WHEN region_id = 2 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 2 LIMIT 1) END region_2,
CASE WHEN region_id = 3 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 3 LIMIT 1) END region_3,
CASE WHEN region_id = 4 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 4 LIMIT 1) END region_4,
CASE WHEN region_id = 5 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 5 LIMIT 1) END region_5,
CASE WHEN region_id = 6 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 6 LIMIT 1) END region_6,
CASE WHEN region_id = 7 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 7 LIMIT 1) END region_7
from employees;

SELECT count(region_1) + count(region_2)+ count(region_3) Unites_States,
count(region_4) + count(region_5)  ASIA,
count(region_6) + count(region_7) CANADA
from(
select first_name, 
CASE WHEN region_id = 1 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 1 LIMIT 1) END region_1, 
CASE WHEN region_id = 2 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 2 LIMIT 1) END region_2,
CASE WHEN region_id = 3 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 3 LIMIT 1) END region_3,
CASE WHEN region_id = 4 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 4 LIMIT 1) END region_4,
CASE WHEN region_id = 5 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 5 LIMIT 1) END region_5,
CASE WHEN region_id = 6 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 6 LIMIT 1) END region_6,
CASE WHEN region_id = 7 THEN (select country from regions r, employees e 
where e.region_id = r.region_id and r.region_id = 7 LIMIT 1) END region_7
from employees
) a;

--assignment
select * from fruit_imports;

select name, s,
case when s < 20000 then 'low'
	when s between 20000 and 50000 then 'enough'
	else 'Full'
	end category
from(
select name ,sum(supply) s
from fruit_imports
group by name) a;

select season, sum(supply)
from fruit_imports
group by season;

select 
case when season = 'Winter' then total_cost end Winter_total,
case when season = 'Summer' then total_cost end Summer_total,
case when season = 'Spring' then total_cost end Spring_total,
case when season = 'Fall' then total_cost end Spring_total,
case when season = 'All Year' then total_cost end Spring_total
from (select season, sum(supply * cost_per_unit) total_cost
from fruit_imports
group by season) a;

SELECT SUM(CASE WHEN season = 'Winter' THEN total_cost end) as Winter_total,
SUM(CASE WHEN season = 'Summer' THEN total_cost end) as Summer_total,
SUM(CASE WHEN season = 'Spring' THEN total_cost end) as Spring_total,
SUM(CASE WHEN season = 'Fall' THEN total_cost end) as Spring_total,
SUM(CASE WHEN season = 'All Year' THEN total_cost end) as Spring_total
FROM (
select season, sum(supply * cost_per_unit) total_cost
from fruit_imports
group by season
    ) a;



































































