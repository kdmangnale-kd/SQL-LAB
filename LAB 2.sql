create database bank;
use bank;

create table accounts(
AccountID int,
Accounttype varchar(20),
balance float);

create table transactions(
TransactionID int,
TransactionDate date,
Amount float,
Transactiontype varchar(20));

create table branches(
BranchId int,
BranchName varchar(100),
Branchaddress varchar(200),
BranchPhone varchar(15));

create table accountbranches(
AssignmentDate date);

create table loans(
LoanId int,
LoanAmount float,
InterestRate float,
StartDate date,
EndDate date);

create table customers(
CustomerId int,
FirstName varchar(20),
LastName varchar(20),
Email varchar(100),
Phone varchar(20),
DateofBirth date);

select * from accounts;
select * from transactions;
select * from branches;
select * from accountbranches;
select * from loans;
select * from customers;

alter table accounts add constraint ck check(balance >= 1000);

drop table accountbranches;

alter table customers add constraint p primary key(CustomerId);
alter table customers modify FirstName varchar(20) not null;
alter table customers add constraint u unique(Email);

alter table accounts add customerid int;
alter table accounts drop customerid;
alter table accounts add constraint fk_a foreign key (customerid) references customers(CustomerId);

alter table loans add Customerid int;
alter table loans add constraint fk_l foreign key (Customerid) references customers(CustomerId);

alter table transactions add Accountid int;
alter table accounts add constraint k primary key(AccountId);
alter table transactions add constraint fk_t foreign key (Accountid) references accounts(AccountID);

alter table accounts add Branchid int;
alter table branches add constraint m primary key(BranchId);
alter table accounts add constraint fk_aa foreign key(Branchid) references branches(BranchId);

