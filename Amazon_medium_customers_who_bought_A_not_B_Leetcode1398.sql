-- Amazon question

-- Create Customers table
/*
CREATE TABLE Customers_amz2 (
    customer_id INT,
    customer_name VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers_amz2 (customer_id, customer_name) VALUES
(1, 'Daniel'),
(2, 'Diana'),
(3, 'Elizabeth'),
(4, 'Jhon');

-- Create Orders table
CREATE TABLE Orders_amz2 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert data into Orders table
INSERT INTO Orders_amz2 (order_id, customer_id, product_name) VALUES
(10, 1, 'A'),
(20, 1, 'B'),
(30, 1, 'D'),
(40, 1, 'C'),
(50, 2, 'A'),
(60, 3, 'A'),
(70, 3, 'B'),
(80, 3, 'D'),
(90, 4, 'C');
*/

Select * from orders_amz2
Select * from customers_amz2

-- Write an SQL query to report the customer_id and customer_name of customers who bought products “A”, “B” 
-- but did not buy the product “C” since we want to recommend them to purchase this product.

SELECT 
    a.customer_id, 
    a.customer_name
FROM 
    customers_amz2 a
JOIN 
    orders_amz2 b 
ON 
    a.customer_id = b.customer_id
GROUP BY 
    a.customer_id, a.customer_name
HAVING 
    SUM(CASE WHEN b.product_name = 'A' THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN b.product_name = 'B' THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN b.product_name = 'C' THEN 1 ELSE 0 END) = 0;