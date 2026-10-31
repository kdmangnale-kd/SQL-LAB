use bank;

-- Generate Accounts Transaction Reports --
select a.AccountId, a.Accounttype, a.Balance, t.TransactionId, t.TransactionDate, t.Transactiontype, t.Amount from accounts a inner join transactions t on a.AccountId = t.AccountId;
-- Display All Accounts Including Those Without Transactions --
select a.AccountId, a.Accounttype, a.Balance, t.TransactionId, t.TransactionDate, t.Transactiontype, t.Amount from accounts a left join transactions t on a.AccountId = t.AccountId;
-- Generate Deposit Transaction Reports --
select a.AccountId, a.Accounttype, a.Balance, t.TransactionId, t.TransactionDate, t.Transactiontype, t.Amount from accounts a inner join transactions t on a.AccountId = t.AccountId where t.Transactiontype = "Deposit";
-- Generate High Balance Account Transaction Reports --
select a.AccountId, a.Accounttype, a.Balance, t.TransactionId, t.TransactionDate, t.Transactiontype, t.Amount from accounts a inner join transactions t on a.AccountId = t.AccountId where a.Balance > 30000 order by a.Balance desc;