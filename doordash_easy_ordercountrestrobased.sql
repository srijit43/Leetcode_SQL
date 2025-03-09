-- Drop tables if they exist
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS restaurants;

-- Create restaurants table
CREATE TABLE restaurants (
    restaurant_id INT,
    restaurant_name VARCHAR(255) NOT NULL
);

-- Insert sample data into restaurants table
INSERT INTO restaurants (restaurant_id, restaurant_name) VALUES
(1, 'Burger King'),
(2, 'KFC'),
(3, 'McDonald''s'),
(4, 'Pizza Hut'),
(5, 'Starbucks');

-- Create users table
CREATE TABLE users (
    user_id INT,
    user_name VARCHAR(255) NOT NULL
);

-- Insert sample data into users table
INSERT INTO users (user_id, user_name) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Bob Johnson'),
(104, 'Alice Anderson'),
(105, 'Emma Wilson');

-- Create orders table
CREATE TABLE orders (
    order_id INT,
    user_id INT,
    restaurant_id INT,
    order_date DATE
);

-- Insert sample data into orders table
INSERT INTO orders (order_id, user_id, restaurant_id, order_date) VALUES
(2001, 101, 1, '2024-02-01'),
(2002, 102, 2, '2024-02-02'),
(2003, 101, 3, '2024-02-03'),
(2004, 103, 2, '2024-02-04'),
(2005, 102, 1, '2024-02-05'),
(2006, 104, 4, '2024-02-06'),
(2007, 105, 5, '2024-02-07'),
(2008, 101, 1, '2024-02-08'),
(2009, 102, 2, '2024-02-09'),
(2010, 104, 5, '2024-02-10');

Select * from orders
Select * from users
Select * from restaurants

/*
As a DoorDash data analyst, your task is to understand the behavior and preferences of DoorDash users, which would be fundamental in improving the service. One of the essential measures of service quality and restaurant popularity is the number of orders each restaurant receives over time. Your task is to design a database consisting of restaurants, users, and orders.
*/

SELECT 
    r.restaurant_name, 
    COUNT(o.order_id) AS order_count
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY order_count DESC