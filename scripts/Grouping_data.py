select SUM(salary), department 
from employees 
where region_id in (4,5,6,7)
group by department;

select MIn(salary) minimum, MAX(salary),count(*), department
from employees
where salary > 70000
group by department
ORDER BY department;

select MIn(salary) minimum, MAX(salary),count(*), department, gender
from employees
where salary > 70000
group by department, gender 
ORDER BY department;


select MIn(salary) minimum, MAX(salary),count(*) ct, department
from employees
group by department
HAVING count(*) > 35
ORDER BY department;


--practice

select first_name, count(*)
from employees
group by first_name
having count(*) > 1;

select department
from employees
group by department;

select SUBSTRING(email, POSITION('@' IN email)+1) as email_domain, count(*) ct
from employees
where email IS NOT NULL
group by email_domain
order by ct desc;

select gender, region_id, MIN(salary) min_salary, MAX(salary) max_salary, round(AVG(salary)) avg_salary
from employees
group by gender, region_id
order by gender, region_id;


--assignment
CREATE TABLE fruit_imports
(
	id integer,
	name varchar(20),
	season varchar(10),
	state varchar(20),
	supply integer,
	cost_per_unit decimal
);

insert into fruit_imports values(1, 'Apple', 'All Year', 'Kansas', 32900, 0.22);
insert into fruit_imports values(2, 'Avocado', 'All Year', 'Nebraska', 27000, 0.15);
insert into fruit_imports values(3, 'Coconut', 'All Year', 'California', 15200, 0.75);
insert into fruit_imports values(4, 'Orange', 'Winter', 'California', 17000, 0.22);
insert into fruit_imports values(5, 'Pear', 'Winter', 'Iowa', 37250, 0.17);
insert into fruit_imports values(6, 'Lime', 'Spring', 'Indiana', 40400, 0.15);
insert into fruit_imports values(7, 'Mango', 'Spring', 'Texas', 13650, 0.60);
insert into fruit_imports values(8, 'Orange', 'Spring', 'Iowa', 18000, 0.26);
insert into fruit_imports values(9, 'Apricot', 'Spring', 'Indiana', 55000, 0.20);
insert into fruit_imports values(10, 'Cherry', 'Summer', 'Texas', 62150, 0.02);
insert into fruit_imports values(11, 'Cantaloupe', 'Summer', 'Texas', 8000, 0.49);
insert into fruit_imports values(12, 'Apricot', 'Summer', 'Kansas', 14500, 0.20);
insert into fruit_imports values(13, 'Mango', 'Summer', 'Texas', 17000, 0.68);
insert into fruit_imports values(14, 'Pear', 'Fall', 'Nebraska', 30500, 0.12);
insert into fruit_imports values(15, 'Grape', 'Fall', 'Illinois', 72500, 0.35);

select * from fruit_imports;

select state, sum(supply)
from fruit_imports
group by state
order by sum(supply) DESC
LIMIT 1;

select season, MAX(cost_per_unit)
from fruit_imports
group by season;

select state
from fruit_imports
group by state, name
having count(name)>1;

select season, count(name)
from fruit_imports
group by season
having count(name) in (3,4)
order by season;

select state, MAX(supply*cost_per_unit) total_cost
from fruit_imports
group by state
order by total_cost desc
LIMIT 1;

CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);

select count(COALESCE(fruit_name, 'Empty'))
from fruits;







select * from employees;