-- upper, lower, trim, length, trim and boolean expressions and concatenations

SELECT UPPER(first_name), LOWER(last_name), LENGTH(first_name)
from employees;

SELECT LENGTH('    HEllo  There      ');
SELECT LENGTH(TRIM('    HEllo  There      '));

select * from employees;
select first_name || ' '||last_name as full_name from employees;

select first_name || ' '||last_name, (salary > 140000) as full_name from employees order by 2 desc;

select department , ('Clothing' in (department)) "Boolean Column" from employees;




---substring,  replace, postition, coalesce

select 'This is test data' test_data;
select SUBSTRING('This is test data' FROM 1 FOR 4 ) test_data_extracted;


select department, 
REPLACE(department,'Clothing','Attire') modifiled_data, 
department || ' department' department_name from departments;

select email, SUBSTRING(email, POSITION('@' IN email)+1) "Formatted text"
from employees;

select coalesce(email,'Empty cell')
from employees;



--Grouping functions: MIN, MAX, AVG, SUM, Count

select MIN(salary) "MINIMUM" from employees;
select MAX(salary) from employees;
select SUM(salary) from employees;
select ROUND(AVG(salary)) from employees;
select COUNT(employee_id), COUNT(email) from employees;



---assignment
select * from professors;

select last_name || ' works in ' || department || ' department' from professors;

select 'It is ' || (salary > 95000) || ' that professor ' || last_name || ' is highly paid' 
from professors ; 

select last_name, UPPER(SUBSTRING(department FROM 1 FOR 3)) department, salary, hire_date 
from professors;

select MAX(SALARY), MIN(Salary) from professors where NOT last_name = 'Wilson';

select MIN(hire_date) from professors; 