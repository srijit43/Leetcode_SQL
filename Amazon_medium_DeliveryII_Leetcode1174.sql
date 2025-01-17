-- Amazon Medium

-- Create the Delivery table
/*
CREATE TABLE Delivery (
    delivery_id INT,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Insert data into the Delivery table
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 2, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-12'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 3, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13'),
(7, 4, '2019-08-09', '2019-08-09');

-- Verify the data
SELECT * FROM Delivery;*/

/*
If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise 
it’s called scheduled.

The first order of a customer is the order with the earliest order date that customer made. It is guaranteed that a customer 
has exactly one first order.

Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
*/

WITH cte AS (
    -- Ranking orders per customer and calculating the urgency
SELECT 
*, 
RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS r,
CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS urgency
FROM Delivery
),
urgency_flag AS (
SELECT 
delivery_id, urgency,        
CASE WHEN urgency = 'immediate' THEN 1 ELSE 0 END AS flag
FROM 
cte 
WHERE r = 1
)

SELECT 
ROUND(100.0 * SUM(flag) / COUNT(*), 2) AS immediate_percentage
FROM 
urgency_flag;



