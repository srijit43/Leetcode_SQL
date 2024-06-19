create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);


-- select * from customer_orders


insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;


with first_visit as(
Select customer_id, min(order_date) as first_visit_date
from customer_orders
group by customer_id),
visit_flag as
(
Select 
co.*,
case when co.order_date = fv.first_visit_date then 1 else 0 end as first_visit_flag,
case when co.order_date != fv.first_visit_date then 1 else 0 end as repeat_visit_flag
from customer_orders as co
inner join first_visit as fv
on co.customer_id = fv.customer_id
)

Select order_date, sum(first_visit_flag) as new_customer, sum(repeat_visit_flag) as old_customer
from visit_flag
group by order_date

