-- Amazon medium restuarant growth

-- Create Customer table
/*
CREATE TABLE Customer_restro (
    customer_id INT,
    name VARCHAR(50),
    visited_on DATE,
    amount INT
);

-- Insert data into Customer_restro table
INSERT INTO Customer_restro (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110),
(1, 'Jhon', '2019-01-10', 130),
(3, 'Jade', '2019-01-10', 150);*/

-- Select * from customer_restro

-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

-- Write an SQL query to compute the moving average of how much the customer paid in a seven days
-- window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

WITH DaySums AS (
    -- Calculate the total amount for each day
    SELECT 
        visited_on, 
        SUM(amount) AS day_sum 
    FROM 
        Customer_restro 
    GROUP BY 
        visited_on
)
SELECT 
    a.visited_on AS visited_on, 
    SUM(b.day_sum) AS amount,
    ROUND(AVG(b.day_sum), 2) AS average_amount
FROM 
    DaySums a
JOIN 
    DaySums b 
ON 
    DATEDIFF(DAY, a.visited_on, b.visited_on) BETWEEN 0 AND 6
GROUP BY 
    a.visited_on
HAVING 
    COUNT(b.visited_on) = 7;

	-- another way

SELECT a.visited_on AS visited_on, SUM(b.day_sum) AS amount,
       ROUND(AVG(b.day_sum), 2) AS average_amount
FROM
  (SELECT visited_on, SUM(amount) AS day_sum FROM Customer_restro GROUP BY visited_on ) a,
  (SELECT visited_on, SUM(amount) AS day_sum FROM Customer_restro GROUP BY visited_on ) b
WHERE DATEDIFF(DAY,a.visited_on, b.visited_on) BETWEEN 0 AND 6
GROUP BY a.visited_on
HAVING COUNT(b.visited_on) = 7