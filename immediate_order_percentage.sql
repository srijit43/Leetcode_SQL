-- Find all immediate orders and display as immediate_percentage from food orders
# Write your MySQL query statement below
-- pref_date = order_date then immediate, else scheduled
-- count(immediate)/count(all) gives percentage ( Mistake made since count(only first order dates))

/*Select
round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)/
count(1) * 100,2) as immediate_percentage
from
Delivery*/


SELECT Round(Sum(CASE
                   WHEN order_date = customer_pref_delivery_date THEN 1
                   ELSE 0
                 END) * 100.0 / Count(delivery_id), 2) AS immediate_percentage
FROM   delivery
WHERE  ( customer_id, order_date ) IN (SELECT customer_id,
                                              Min(order_date)
                                       FROM   delivery
                                       GROUP  BY customer_id)

-- Note that you were taking all the dates but we need the min order date 