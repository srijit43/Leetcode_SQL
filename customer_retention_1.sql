-- Customer churn prediction

/*create table transactions(
order_id int,
cust_id int,
order_date date,
amount int
);
-- delete from transactions;
insert into transactions values 
(1,1,'2020-01-15',150)
,(2,1,'2020-02-10',150)
,(3,2,'2020-01-16',150)
,(4,2,'2020-02-25',150)
,(5,3,'2020-01-10',150)
,(6,3,'2020-02-20',150)
,(7,4,'2020-01-20',150)
,(8,5,'2020-02-20',150)
*/


-- Select * from transactions

-- I have to look for consecutive ordering for customer
-- join on cust_id and difference in order date as 1 month
-- inner join will not give january data

select month(tm.order_date) as month, count(distinct(lm.cust_id)) as customer_retained from
transactions as tm
left join
transactions as lm
on
tm.cust_id = lm.cust_id
and DATEDIFF(month, lm.order_date, tm.order_date) = 1
group by month(tm.order_date)

-- customer lost

select month(lm.order_date) as month, count(distinct(lm.cust_id)) as customer_lost from
transactions as lm
left join
transactions as tm
on
tm.cust_id = lm.cust_id
and DATEDIFF(month, lm.order_date, tm.order_date) = 1
where tm.cust_id is null
group by month(lm.order_date)