use bank;
-- Display customer Table
select * from customers;
-- Display all customer FirstName in uppercase.
select FirstName, upper(FirstName) as new_name from customers;
-- Display all customer FirstName in lowercased
select FirstName, lower(FirstName) as n_name from customers;
-- Find the total number of characters in each customer FirstName
select FirstName, length(FirstName) as lengthofname from customers;
-- Display only the first three characters of customer FirstName .
select FirstName, left(FirstName, 3) from customers;
-- Combine customer's FirstName with LastName.
select concat(FirstName, " ", LastName) as combine from customers;
-- right --
select FirstName, right(FirstName, 2) from customers;
-- trim --
select trim(FirstName) as c_name from customers; 
-- mid --
select FirstName, mid(FirstName, 2,2) from customers;
-- all --
select FirstName, upper(FirstName), lower(FirstName), length(FirstName), left(FirstName, 3), right(FirstName, 2), mid(FirstName,2,2), concat(FirstName, " ", LastName), trim(FirstName) from customers;


-- mod --
select mod(30,7) as remainder;
-- abs --
select abs(-2100) as abs_value;
-- floor --
select floor(1010.30) as fl_value;
-- ceil --
select ceil(1010.40) as ce_value;
-- round --
select round (1010.50) as ro_value;

-- Display customer Table
select * from customers;
-- Display the current system date
select current_date();
-- Display the current system date and time.
select now();
-- Display the Birth of year
select year(DateofBirth) as BirthDate from customers;
-- Display the Birth month
select month(DateofBirth) as M_BirthDate from customers;
-- Calculate the number of days since BirthDate
select datediff(current_date(), DateofBirth) as nod_bd from customers;
-- Find the latest birth date.
select max(DateofBirth) as latest_BirthDate from customers;
-- Find the earliest birth date
select min(DateofBirth) as earliest_BirthDate from customers;

-- Categorize customers as Adult or Young based on their birth year
 select year(DateofBirth), case when year(DateofBirth)>1998 then "young" when year(DateofBirth)<=1998 then "adult" end as type from customers;
-- Display 'Not Available' if a phone number is NULL
 select ifnull(Phone,'Not Available') from customers;
-- Compare two customer names
 select strcmp('Rahul','Priya');
-- Calculate the total balance maintained across all customer accounts.
 select sum(balance) as total_sum from accounts;
-- Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
 select avg(balance) as avg_balance from accounts;
-- Identify the highest balance maintained in any customer account.
 select max(balance) as high_balance from accounts;
-- Identify the lowest balance maintained in any customer account
select min(balance) as low_balance from accounts;
-- Determine the total number of customer accounts available in the system.
select count(*) from accounts;
-- The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
 select accounttype, sum(balance) from accounts group by accounttype;
-- The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
 select accounttype, sum(balance) from accounts group by accounttype having sum(balance) > 25000;
 