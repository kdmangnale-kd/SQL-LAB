use bank;

-- Retrieve only the following details from the Accounts table: AccountID, AccountType, and Balance.--
select AccountID,Accounttype,balance from accounts;
-- Retrieve Customers with Savings Accounts--
select * from accounts where Accounttype = 'Savings';
-- Retrieve Accounts with Balance Greater Than 25000 --
select * from accounts where balance > 25000;
-- Retrieve Transactions Between Specific Amounts 5000 -20000 --
select * from transactions where Amount >= 5000 and Amount <= 20000;
-- Retrieve Records for Selected Customers 101,102,103,104 --
select * from customers where CustomerId in (101,102,103,104);
-- This displays customers whose names start with the letter R. --
select * from customers where FirstName like "R%";

-- Retrieve all current account records --
select * from accounts where Accounttype = 'Current';
-- Find accounts with balance less than 15000 --
select * from accounts where balance < 15000;
-- Display transactions between 1000 and 10000 --
select * from transactions where Amount >= 1000 and Amount <= 10000;
-- Retrieve customer records for CustomerID 104 and 105 --
select * from customers where CustomerId in (104,105);
-- Display customers whose last name starts with S --
select * from customers where LastName like "%S";

-- Display Customers in Alphabetical Order--
select * from customers order by LastName asc;
-- Display Accounts with Highest Balance First --
select * from accounts order by balance desc;
-- Retrieve Unique Account Types --
select Accounttype from accounts group by Accounttype;
-- Display Top 3 Highest Balance Accounts --
select * from accounts order by balance desc limit 3;
-- Skip Initial Records While Viewing Transactions --
select * from transactions limit 2 offset 1;
-- Display customers sorted by LastName --
select * from customers order by LastName;
-- Retrieve top 5 transactions with highest amount --
select * from transactions order by Amount desc limit 5;
--  Display unique transaction types --
select TransactionType from transactions order by TransactionType;
-- Skip the first 3 transaction records and display the next 4 records --
select * from transactions limit 4 offset 3;

-- Find Customers Without Phone Numbers --
select * from customers where Phone is null;
-- Find Customers Having Email Addresses--
select * from customers where Email is not null;
-- Find customers without email addresses --
select * from customers where Email is null;
--  Display all accounts where balance information is available --
select * from accounts where balance is not null;

-- Search Customers Whose First Name Starts with “A” --
select * from customers where FirstName like "A%";
-- Search Customers Whose Email Contains “gmail” --
select * from customers where Email like "%gmail%";
-- Search Customers Whose Last Name Ends with “kar”--
select * from customers where LastName like "%Kar";

-- Display customers whose first name starts with R --
select * from customers where FirstName like "R%";
-- Find customers whose email contains yahoo --
select * from customers where Email like "%yahoo%";
-- Display customers whose last name starts with P --
select * from customers where LastName like "%P";
-- Search customers whose phone number ends with 99 --
select * from customers where Phone like "%99";

-- Display accounts belonging to Salary and Savings account types --
select * from accounts where Accounttype in ('Salary','Savings');
-- Retrieve transactions for Payment and Deposit categories --
select * from transactions where Transactiontype in ('Payment','Deposit');
-- Display customer records for CustomerID 103 and 104 --
select * from customers where CustomerId in (103,104);
-- Retrieve selected account records using AccountID values --
select * from accounts where AccountID in (101,102,105);

-- Display Customers in Ascending Order of Last Name --
select * from customers order by LastName asc;
-- Display Accounts with Highest Balance First --
select * from accounts order by balance desc;
-- Display Transactions Sorted by Transaction Date --
select * from transactions order by TransactionDate asc;
-- Display customers sorted by FirstName --
select * from customers order by FirstName asc;
-- Display accounts sorted by AccountType --
select * from accounts order by Accounttype asc;
-- Display transactions sorted by Amount in descending order --
select * from transactions order by Amount desc;
-- Display customers sorted by DateOfBirth --
select * from customers order by DateofBirth asc;

-- Display Only Top 5 Highest Balance Accounts --
select * from accounts order by balance desc limit 5;
-- Display First 3 Customer Records --
select * from customers limit 3;
-- Skip Initial Transaction Records 3 While Viewing Data record 2 --
select * from transactions limit 2 offset 3;
-- Display top 3 transactions with highest amount --
select * from transactions order by amount desc limit 3;
-- Retrieve only 4 customer records --
select * from customers limit 4;
-- Skip first 2 account records and display next 3 records --
select * from accounts limit 3 offset 2;
-- Display top 5 latest transactions --
select * from transactions order by TransactionDate desc limit 5;


-- Display Savings Account Customers Sorted by Balance
-- Categorize Accounts Using Balance
-- Balance >50000 then premium account
-- Balance >2500 then standar account
 
-- · High Transaction
-- · Medium Transaction
--  Low Transaction
-- based on transaction amount.

select AccountID, balance, case when balance > 50000 then "Premium" when balance > 25000 then "Standard" end from accounts;

select Amount, case when Amount > 50000 then "HIgh" when Amount >30000 then "Medium" when Amount <= 10000 then "low" end from transactions;