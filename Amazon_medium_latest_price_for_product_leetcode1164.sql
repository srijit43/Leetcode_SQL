-- Amazon medium

/*

CREATE TABLE Products_amz3 (
    product_id INT,
    new_price INT,
    change_date DATE
);

INSERT INTO Products_amz3 (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');


*/

-- Select * from products_amz3

-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Select distinct(product_id) from products_amz3
Select * from products_amz3 where change_date < = '2019-08-16'







WITH cte AS (
    SELECT 
        product_id, 
        new_price AS price, 
        change_date
    FROM 
        products_amz3
    WHERE 
        change_date <= '2019-08-16'
),
recent_prices AS (
    SELECT 
        product_id, 
        COALESCE(MAX(price), 10) AS recent_price
    FROM 
        cte
    GROUP BY 
        product_id
)
SELECT 
    p.product_id, 
    COALESCE(r.recent_price, 10) AS price_on_date
FROM 
    (SELECT DISTINCT product_id FROM products_amz3) p
LEFT JOIN 
    recent_prices r
ON 
    p.product_id = r.product_id;

-- Another way

-- Default price for products with no changes before 2019-08-16
SELECT DISTINCT product_id, 
       10 AS price
FROM products_amz3
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'

UNION

-- Prices for products with the most recent change on or before 2019-08-16
SELECT p2.product_id, 
       p2.new_price
FROM products_amz3 p2
INNER JOIN (
    SELECT product_id, 
           MAX(change_date) AS recent_date
    FROM products_amz3
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
) recent_changes
ON p2.product_id = recent_changes.product_id 
   AND p2.change_date = recent_changes.recent_date;

