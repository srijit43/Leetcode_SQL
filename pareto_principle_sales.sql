-- Select * from superstore_orders

-- Select sum(sales) * 0.8 from superstore_orders
-- 1837760.68823996

with product_wise_sales as
(
Select product_id, sum(sales) as prod_sales 
from superstore_orders
group by product_id
),
calc_sales as
(
select product_id, prod_sales,
sum(prod_sales) over(order by prod_sales desc rows between unbounded preceding and 0 preceding) as running_sales,
0.8 * sum(prod_sales) over() as total_sales
from product_wise_sales
)
Select * from calc_sales where running_sales <= total_sales