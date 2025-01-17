-- Amazon medium

-- Amazon Medium

/*
CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(2),
    state VARCHAR(10),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date) 
VALUES
    (121, 'US', 'approved', 1000, '2018-12-18'),
    (122, 'US', 'declined', 2000, '2018-12-19'),
    (123, 'US', 'approved', 2000, '2019-01-01'),
    (124, 'DE', 'approved', 2000, '2019-01-07');

Select * from transactions*/

-- Write an SQL query to find for each month and country, 
-- the number of transactions and their total amount, the number of approved transactions and their total amount.

select 
concat(datepart(year,trans_date),'-',datepart(month,trans_date))
as month, country, 
count(id) as trans_count,
sum(case when state='approved' then 1  else 0 end) as approved_count,
sum(amount) as trans_total_amount,
sum(case when state='approved' then amount  else 0 end) as approved_total_amount
from transactions
group by concat(datepart(year,trans_date),'-',datepart(month,trans_date))
, country