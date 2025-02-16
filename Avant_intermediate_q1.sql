select * from customers
select * from payments
select * from loans
select * from loan_applications

-- Total Loan disbursed per month
select 
datepart(month, disbursement_date) as month, sum(approved_amount) amount_per_month
from loans
group by datepart(month, disbursement_date)
order by datepart(month, disbursement_date)


-- calculate default rate

SELECT 
    COUNT(DISTINCT CASE WHEN status = 'default' THEN loan_id END) * 100.0 / COUNT(DISTINCT loan_id) AS default_rate
FROM loans;

-- Find customers who have missed payment multiple times
with cte1 as(
Select 
b.loan_id, b.customer_id, a.status
from
payments as a
left join
loans as b
on a.loan_id = b.loan_id),

cte2 as(
Select 
a.customer_id, 
case when b.status = 'on-time' then 0 else 1 end as defaulter
from customers as a
join
cte1 as b
on a.customer_id = b.customer_id)

Select customer_id , concat(100.0 * avg(defaulter),'','%') as missed_deadline
from cte2
group by customer_id
having avg(defaulter) = 1




