create database Neww;
use Neww;

CREATE TABLE t1 (
  TransactionID   INT PRIMARY KEY,
  CustomerName    VARCHAR(50),
  City            VARCHAR(30),
  TransactionType VARCHAR(20),
  Amount          INT,
  Mode            VARCHAR(10),
  TransactionDate DATE,
  Remarks         VARCHAR(20)
);

INSERT INTO t1 VALUES
(1,  'Amit Sharma',    'Pune',      'Deposit',    15000, 'UPI',  '2026-01-05', 'Salary'),
(2,  'Priya Patil',    'Mumbai',    'Withdrawal',  3000, 'Cash', '2026-01-12', NULL),
(3,  'Rahul Verma',    'Delhi',     'Transfer',    8500, 'NEFT', '2026-01-18', 'Rent'),
(4,  'Sneha Kulkarni', 'Pune',      'Deposit',     4500, 'Card', '2026-02-02', NULL),
(5,  'Arjun Singh',    'Nagpur',    'Withdrawal', 12000, 'Cash', '2026-02-09', 'ATM'),
(6,  'Neha Joshi',     'Mumbai',    'Deposit',    25000, 'NEFT', '2026-02-15', 'Bonus'),
(7,  'Vikram Rao',     'Hyderabad', 'Transfer',    6000, 'UPI',  '2026-03-01', NULL),
(8,  'Anjali Desai',   'Pune',      'Withdrawal',  1500, 'Card', '2026-03-07', 'Shopping'),
(9,  'Rohan Mehta',    'Delhi',     'Deposit',     9800, 'UPI',  '2026-03-14', NULL),
(10, 'Kavita Nair',    'Kochi',     'Transfer',    2200, 'NEFT', '2026-03-21', 'Gift'),
(11, 'Sanjay Kapoor',  'Mumbai',    'Withdrawal',  7500, 'Cash', '2026-04-03', 'Rent'),
(12, 'Pooja Sharma',   'Nagpur',    'Deposit',    18000, 'Card', '2026-04-10', 'Salary'),
(13, 'Aakash Gupta',   'Pune',      'Transfer',    5000, 'UPI',  '2026-04-18', NULL),
(14, 'Meera Iyer',     'Chennai',   'Deposit',     3500, 'NEFT', '2026-05-02', 'Refund'),
(15, 'Aditya Bhosale', 'Pune',      'Deposit',    30000, 'UPI',  '2026-05-09', 'Bonus');

select * from t1;

-- 1
select CustomerName as c_name,city from t1 where city = 'pune';

-- 2 
select * from t1 where TransactionType = 'Withdrawal' and mode = 'Cash';

-- 3
select * from t1 where mode = 'UPI' and Amount >= 1000 order by Amount desc limit 1;
-- or --
select * from t1 where mode = 'UPI' and Amount >= 1000 order by Amount limit 1 offset 4; 

-- 4
select TransactionType, Max(Amount) from t1 group by TransactionType order by Max(Amount) desc limit 1;

-- 
select * from t1 where CustomerName like "A%";
select * from t1 where CustomerName like "%A%";
select * from t1 where CustomerName like "%A";

select * from t1 where mode like "U_I";
select * from t1 where mode like "___";

--
select * from t1 where CustomerName regexp "^A";
select * from t1 where CustomerName regexp "a$";
select * from t1 where mode regexp "UPI";
select * from t1 where mode regexp "UPI|Cash";


-- Show all Deposit transactions. -- 
select * from t1 where TransactionType = 'Deposit';

--  Show TransactionID, CustomerName and Amount for transactions above 10000. --
select TransactionID, CustomerName from t1 where Amount > 10000;

-- Show all transactions made in Pune.--
select TransactionID,TransactionType,Amount,city from t1 where city = 'pune';

-- Show Withdrawals made in Cash. --
select * from t1 where TransactionType = 'Withdrawal' and mode = 'Cash';

-- Show transactions from Mumbai or Delhi -- 
select * from t1 where city = "Mumbai" or city = "Delhi";

-- Show transactions that were not made through UPI.--
select * from t1 where mode not in ('UPI');

-- Show transactions with an amount between 5000 and 10000. --
select * from t1 where Amount between 5000 and 10000;

-- Show transactions from cities other than Pune, Mumbai and Delhi --
select * from t1 where city not in ('pune','mumbai','delhi');

--  Show transactions made in March 2026. --
select * from t1 where TransactionDate = '2026-03-01';

-- Show customers whose name starts with A. -- 
select * from t1 where CustomerName like "A%";

-- Show customers whose name ends with a. -- 
select * from t1 where CustomerName like "%A";

-- how customers whose second letter is a. --
select * from t1 where CustomerName like "%_A";

-- Show customers whose name contains sh. --
select * from t1 where CustomerName like "%sh%";

-- Show customers whose name does not start with A.--
select * from t1 where CustomerName not like "A%";

-- Show transactions where Remarks is empty (NULL).--
select * from t1 where remarks is null;

-- Use REGEXP to show customers whose name starts with A or P.--
select * from t1 where CustomerName regexp "^A" or "^p";

-- Use REGEXP to show customers whose name ends with a or i.--
select * from t1 where CustomerName regexp "A$" or "I$";

-- Show Deposits or Transfers above 5000 that were made through UPI or NEFT. --
select * from t1 where mode in('UPI','Cash') or Transactiontype = 'Deposit'and Amount >= 5000;
