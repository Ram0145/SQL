--select statement filtering

select * from employees; 

select * from employees
where department = 'Phones & Tablets';

select * from employees
where department like '%ones%';

select * from employees
where salary > 200000;

select * from employees
where employees.department = 'Clothing' and employees.salary>90000;

select * from employees
where salary < 40000
AND (employees.department = 'Clothing' OR employees.department = 'Pharmacy');

select * from employees
where not department = 'Sports'

select * from employees
where department != 'Sports' --- not <> !  --> all are same in where

select * from employees
where department <> 'Sports'

select * from employees
where email = 'NUll';   --- null is not equal to null in SQL

select * from employees
where email is null;    --- this is how we find the nulls

select * from employees
where email is not null;  

select * from employees
where department in ('Sports','Tools','Clothing')

select * from employees
where salary BETWEEN 80000 AND 100000; ---both the limits are inclusive in between

select * from regions;

select * from departments;

---assignments

select first_name, email from employees
where gender = 'F' and department = 'Tools' and salary > 110000;

select first_name, hire_date from employees
where salary > 165000 or (department='Sports' and gender='M');

select * from employees 
where hire_date BETWEEN '2002-01-01' AND '2004-01-01';

select * from employees
where (gender = 'M' and department='Automotive' and salary > 40000 and salary < 100000) 
or (gender ='F' and department = 'Toys');


