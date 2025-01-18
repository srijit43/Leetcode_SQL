-- Amazon Easy
/*
-- Create the table
CREATE TABLE stock_transactions (
    stock_name VARCHAR(50),
    operation VARCHAR(10),
    operation_day INT,
    price INT
);

-- Insert data into the table
INSERT INTO stock_transactions (stock_name, operation, operation_day, price)
VALUES
    ('Leetcode', 'Buy', 1, 1000),
    ('Corona Masks', 'Buy', 2, 10),
    ('Leetcode', 'Sell', 5, 9000),
    ('Handbags', 'Buy', 17, 30000),
    ('Corona Masks', 'Sell', 3, 1010),
    ('Corona Masks', 'Buy', 4, 1000),
    ('Corona Masks', 'Sell', 5, 500),
    ('Corona Masks', 'Buy', 6, 1000),
    ('Handbags', 'Sell', 29, 7000),
    ('Corona Masks', 'Sell', 10, 10000);
*/

-- Select * from stock_transactions

SELECT 
    stock_name, 
    SUM(CASE 
            WHEN operation = 'Sell' THEN price 
            ELSE -price 
        END) AS capital_gain_loss
FROM 
    stock_transactions
GROUP BY 
    stock_name;