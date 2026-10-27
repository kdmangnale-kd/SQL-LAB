use bank;

select * from transactions;

select transactiontype, amount, row_number() over() from transactions;
select transactiontype, amount, row_number() over(order by amount) from transactions;
select transactiontype, amount, row_number() over(order by amount desc) from transactions;
select transactiontype, amount, row_number() over(partition by transactiontype order by amount) from transactions;


select transactiondate, amount, transactiontype from transactions;

select transactiondate, amount, transactiontype, lag(amount) over(order by transactiondate) from transactions;
select transactiondate, amount, transactiontype, lag(amount) over(partition by transactiontype order by transactiondate) from transactions;

select transactiondate, amount, transactiontype, lead(amount) over(order by transactiondate) from transactions;
select transactiondate, amount, transactiontype, lead(amount) over(partition by transactiontype order by transactiondate) from transactions;


create table n(
name varchar(20),
marks int);

select * from n;

insert into n value('A',78),('B',56),('C',56),('D',79),('E',78),('F',80);

select name,marks,rank() over(order by marks desc) from n;
select name,marks,dense_rank() over(order by marks desc) from n;

select name, marks, row_number() over(order by marks desc) as r_row, rank() over(order by marks desc) as r_rank, dense_rank() over(order by marks desc) as den_rank from n;

select name,marks, sum(marks) over(order by marks) as sum_marks from n;
select name,marks, avg(marks) over(order by marks) as avg_marks from n;


select * from loans;

Select LoanId, CustomerId, LoanAmount, rank() over(order by LoanAmount desc) as l_rank from loans;
Select LoanId, CustomerId, LoanAmount, dense_rank() over(order by LoanAmount desc) as d_rank from loans;
Select LoanId, CustomerId, LoanAmount, row_number() over(order by LoanAmount desc) as l_rank from loans;
Select LoanId, CustomerId, LoanAmount, row_number() over(partition by CustomerId order by LoanAmount desc) as p_row from loans;
Select LoanId, CustomerId, LoanAmount, sum(LoanAmount) over(order by LoanAmount desc) as r_total from loans;
Select LoanId, CustomerId, LoanAmount, lag(LoanAmount) over(order by LoanAmount desc) as p_loanamount from loans;
Select LoanId, CustomerId, LoanAmount, lead(LoanAmount) over(order by LoanAmount desc) as p_loanamount from loans;