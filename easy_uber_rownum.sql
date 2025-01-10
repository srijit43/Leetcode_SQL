-- Assume you are given the table below on Uber transactions made by users. 
-- Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

with cte as
(SELECT * , row_number()
OVER(PARTITION BY user_id order by transaction_date)
as rownum FROM transactions)

select user_id, spend, transaction_date from cte where rownum = 3;