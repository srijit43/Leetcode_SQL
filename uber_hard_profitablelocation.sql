/*CREATE TABLE cust_signups_uber (location VARCHAR(100), plan_id BIGINT, signup_id BIGINT PRIMARY KEY, signup_start_date DATETIME, signup_stop_date DATETIME);

INSERT INTO cust_signups_uber (location, plan_id, signup_id, signup_start_date, signup_stop_date) VALUES  ('New York', 101, 1, '2025-01-01', '2025-01-31'), ('San Francisco', 102, 2, '2025-01-05', '2025-02-05'), ('Los Angeles', 103, 3, '2025-01-10', '2025-01-20'), ('New York', 104, 4, '2025-02-01', '2025-02-28'), ('Los Angeles', 105, 5, '2025-01-15', '2025-01-25');

CREATE TABLE cust_transactions_uber (amt FLOAT, signup_id BIGINT, transaction_id BIGINT PRIMARY KEY, transaction_start_date DATETIME);

INSERT INTO cust_transactions_uber (amt, signup_id, transaction_id, transaction_start_date) VALUES (100.50, 1, 1001, '2025-01-10'), (200.75, 1, 1002, '2025-01-20'), (150.00, 2, 1003, '2025-01-15'), (300.00, 3, 1004, '2025-01-12'), (400.00, 4, 1005, '2025-02-15'), (250.00, 5, 1006, '2025-01-20');
*/
-- Select * from cust_signups_uber
-- Select * from cust_transactions_uber

/*
Find the most profitable location. Write a query that calculates the average signup duration and average transaction amount for each location, and then compare these two measures together by taking the ratio of the average transaction amount and average duration for each location.
*/

with cte as(
select
a.location, a.plan_id,a.signup_id,a.signup_start_date,a.signup_stop_date,
b.amt, b.transaction_start_date
from
cust_signups_uber a
left join
cust_transactions_uber b
on a.signup_id = b.signup_id)
, cte2 as
(
select location, amt as amt,datediff(day,signup_start_date, signup_stop_date) as signup_duration from cte
)
,cte3 as
(
select location, avg(amt) as avg_amount, avg(signup_duration) as avg_duration from cte2
group by location
)

Select location, avg_amount, 
case when avg_duration > 0 then avg_amount/avg_duration else 0 end as ratio from cte3

