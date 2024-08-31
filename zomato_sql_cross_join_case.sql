/*CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(255) NOT NULL
);

INSERT INTO orders (order_id, item) VALUES
(1, 'Chow Mein'),
(2, 'Pizza'),
(3, 'Veg Nuggets'),
(4, 'Paneer Butter Masala'),
(5, 'Spring Rolls'),
(6, 'Veg Burger'),
(7, 'Paneer Tikka');*/

-- Select * from orders

with CTE_order_count as(
Select count(order_id) total_orders
from
orders)


Select 
case when order_id % 2 !=0 and order_id!= total_orders
then order_id + 1
when order_id%2 !=0 and order_id = total_orders
then order_id
else
order_id - 1 end as corrected_order_id,
item
from orders
cross join
CTE_order_count
order by corrected_order_id




