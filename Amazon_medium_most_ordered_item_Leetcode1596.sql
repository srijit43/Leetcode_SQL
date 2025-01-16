-- Amazon medium

/*

-- Create Customers table
CREATE TABLE Customers_amazon (
    customer_id int,
    name VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers_amazon (customer_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Tom'),
(4, 'Jerry'),
(5, 'John');

-- Create Orders table
CREATE TABLE Orders_amazon (
    order_id INT,
    order_date DATE,
    customer_id INT,
    product_id INT
);

-- Insert data into Orders table
INSERT INTO Orders_amazon (order_id, order_date, customer_id, product_id) VALUES
(1, '2020-07-31', 1, 1),
(2, '2020-07-30', 2, 2),
(3, '2020-08-29', 3, 3),
(4, '2020-07-29', 4, 1),
(5, '2020-06-10', 1, 2),
(6, '2020-08-01', 2, 1),
(7, '2020-08-01', 3, 3),
(8, '2020-08-03', 1, 2),
(9, '2020-08-07', 2, 3),
(10, '2020-07-15', 1, 2);

-- Create Products_amazon table
CREATE TABLE Products_amazon (
    product_id INT,
    product_name VARCHAR(50),
    price INT
);

-- Insert data into Products table
INSERT INTO Products_amazon (product_id, product_name, price) VALUES
(1, 'keyboard', 120),
(2, 'mouse', 80),
(3, 'screen', 600),
(4, 'hard disk', 450);


*/

Select * from customers_amazon
Select * from orders_amazon
Select * from products_amazon

-- Write an SQL query to find the most frequently ordered product(s) for each customer.
-- The result table should have the product_id and product_name for each customer_id who ordered at least one order.

/*
with cte as (
Select c.customer_id, o.product_id
from customers_amazon as c
right join
orders_amazon as o
on 
c.customer_id = o.customer_id),
cte_2 as
(
Select c1.customer_id, c1.product_id,p.product_name
from cte as c1
left join
products_amazon as p
on c1.product_id = p.product_id)

Select customer_id, max(product_id),product_name from cte_2
group by customer_id, product_name

Select customer_id, product_id, product_name from cte_2
group by customer_id, product_name, product_id
order by count(product_id) desc*/

with cte as(
Select o.customer_id, p.product_id,p.product_name,count(p.product_id) as count_items
from orders_amazon o
left join
products_amazon p
on o.product_id = p.product_id
group by o.customer_id, p.product_id,p.product_name)

SELECT 
    customer_id,
    product_id,
    product_name
FROM (
    SELECT 
        customer_id,
        product_id,
        product_name,
        dense_rank() OVER (PARTITION BY customer_id ORDER BY count_items DESC) AS rnk
    FROM 
        cte
) AS ranked_items
WHERE rnk = 1;







-- Another way


SELECT customer_id, product_id, product_name
FROM (
    SELECT O.customer_id, O.product_id, P.product_name, 
    RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(O.product_id) DESC) AS rnk
    FROM Orders_amazon O
    JOIN Products_amazon P
    ON O.product_id = P.product_id  
    GROUP BY o.customer_id, o.product_id, P.product_name
) temp
WHERE rnk = 1 
ORDER BY customer_id, product_id

