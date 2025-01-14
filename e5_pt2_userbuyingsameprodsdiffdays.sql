 -- Amazon question

 -- Find user who bought same product on different days

 /*

Create table purchases
 (
 user_id int,
 product_id int,
 quantity int,
 purchase_date datetime

 )

 Insert into purchases values (536, 3223, 5, '2019-12-22 09:00:00')
 Insert into purchases values (837, 2456, 5, '2019-12-23 09:00:00')
 Insert into purchases values (536, 3223, 10, '2019-12-24 09:00:00')
 Insert into purchases values (536, 1111, 15, '2019-12-24 09:00:00')
 Insert into purchases values (837, 2452, 20, '2019-12-26 09:00:00')

 */

-- Select * from purchases

-- we need to select people who brought on different days but same products
-- a person buying same product for two different days will have a mismatch in count and count distinct product

with cte as(
select 
user_id,
count(distinct(purchase_date)) as distinct_day,
count(product_id) as count_prods,
count(distinct(product_id)) as count_dist_prods
from
purchases
group by user_id)

Select user_id from cte where distinct_day>1 and count_prods != count_dist_prods