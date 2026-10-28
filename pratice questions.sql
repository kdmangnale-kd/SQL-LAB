create database nss;
use nss;

create table employees (
emp_id int,
emp_name varchar(20),
dept varchar(20),
city varchar(20),
salary float,
hire_data date,
manager_id int);

select * from employees;
truncate table employees;
insert into employees value (1,'Aarav Shah','IT','Pune',72000,"2021-03-15",null),(2,'Sneha Rao','HR','Mumbai',48000,"2022-07-01",1),(3,'Karan Mehta','Sales','Delhi',55000,"2023-01-10",1);
insert into employees value (4,'Priya Nair','IT','Pune',64000,"2020-11-23","1"),(5,'Ramesh Iyer','Finance','Mumbai',59000,"2019-05-30",null),(6,'Anita Desai','Sales','Pune',41000,"2024-02-12","3");

-- List emp_name and salary of all employees who work in the IT department.
select emp_name, salary from employees where dept ='IT';
-- Show all employees who earn more than 50000 and live in Pune.
select * from employees where salary > 50000 and city ="Pune";
-- Find employees hired between 2022-01-01 and 2023-12-31.
select * from employees where hire_data between '2022-01-01' and '2023-12-31';
-- Show employees from Pune, Mumbai or Delhi who have no manager assigned.
select * from employees where city in ('Pune','Mumbai','Delhi') and manager_id is null;

-- Show the names of employees that start with the letter 'A'.
select emp_name from employees where emp_name like 'A%';
-- Show the names of employees that end with 'sh'.
select emp_name from employees where emp_name like "%sh";
-- Find employees whose name contains 'an' anywhere.
select emp_name from employees where emp_name like "%an%";
-- Find names that are exactly 5 characters long with 'a' as the second letter.
select emp_name from employees where emp_name like "_a___";

-- Count the number of employees in each department.
select dept, count(*) as t_employee from employees group by dept;
-- Find the average salary for each city.
select city, avg(salary) as a_salary from employees group by city;
-- For each department show the total salary and the highest salary.
select dept, sum(salary) as to_salary, max(salary) as m_salary from employees group by dept;
-- Count employees for each dept and city combination, only for salary above 30000.
select dept,city,count(*) as tot_employee from employees where salary > 30000 group by dept,city;

-- Show departments that have more than 3 employees.
select dept, count(*) as tota_employees from employees group by dept having count(*) > 3;
-- Show cities where the average salary is above 60000.
select city, avg(salary) as av_salary from employees group by city having avg(salary) > 60000;
-- Show departments whose total salary payout is between 200000 and 500000.
select dept, sum(salary) as s_salary from employees group by dept having sum(salary) between 200000 and 500000;
-- Excluding HR, show departments with average salary above 45000, highest average first.
select dept, avg(salary) as a_salary from employees where dept ='HR' group by dept having avg(salary) > 45000 order by a_salary desc;

-- Show the 5 highest-paid employees.
select * from employees order by salary desc limit 5;
-- Show the 3 most recently hired employees.
select * from employees order by hire_data desc limit 3;
-- Skip the 5 highest-paid employees and show the next 5 .
select * from employees order by salary desc limit 5 offset 5;
-- Find the third highest distinct salary using LIMIT and OFFSET.
select distinct(salary) from employees order by salary desc limit 1 offset 2;

-- Among employees whose name starts with 'S', show the top 3 cities by headcount.
select city, count(*) as total_employees from employees where emp_name like "S%" group by city order by total_employees desc limit 3;
-- Show page 3 (10 rows per page) of Pune employees sorted by name.
select * from employees where city ='Pune' order by emp_name asc limit 10 offset 20;
-- For hires after 2021, find depts with more than 2 employees. Rank by average salary (high to low), skip the first and show the next 2.
select dept, count(*) as total_employees, avg(salary) as avg_salary from employees where hire_data > '2021-12-31' group by dept having count(*) > 2 order by avg_salary desc limit 2 offset 1;
-- Find cities where at least 2 employee names contain 'ar'. Show the top 3 by count.
select city, count(*) as tot_employees from employees where emp_name like '%ar%' group by city having count(*) >=2 order by tot_employees desc limit 3;