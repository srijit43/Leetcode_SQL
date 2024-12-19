-- Calculate the average net earnings per order grouped by weekday (in text format, e.g., Monday) and hour from customer_placed_order_datetime. 
-- The net earnings are computed as: order_total + tip_amount - discount_amount - refunded_amount. Round the result to 2 decimals.

/*CREATE TABLE doordash_delivery 
(consumer_id BIGINT, customer_placed_order_datetime DATETIME, delivered_to_consumer_datetime DATETIME, delivery_region NVARCHAR(255),
discount_amount BIGINT, driver_at_restaurant_datetime DATETIME, driver_id INT, is_asap INT, is_new INT, order_total FLOAT,  
placed_order_with_restaurant_datetime DATETIME, refunded_amount FLOAT, restaurant_id BIGINT, tip_amount FLOAT);

INSERT INTO doordash_delivery 
(consumer_id, customer_placed_order_datetime, delivered_to_consumer_datetime, delivery_region, discount_amount, driver_at_restaurant_datetime, driver_id, is_asap, is_new, order_total, placed_order_with_restaurant_datetime, refunded_amount, restaurant_id, tip_amount)
VALUES 
(1, '2024-01-15 10:30:00', '2024-01-15 11:00:00', 'Region A', 5, '2024-01-15 10:40:00', 101, 1, 1, 50.00, '2024-01-15 10:25:00', 0, 201, 5.00), 
(2, '2024-01-15 12:15:00', '2024-01-15 12:45:00', 'Region B', 10, '2024-01-15 12:20:00', 102, 1, 0, 40.00, '2024-01-15 12:10:00', 5.00, 202, 3.00),
(3, '2024-01-16 08:45:00', '2024-01-16 09:15:00', 'Region C', 0, '2024-01-16 08:50:00', 103, 0, 1, 30.00, '2024-01-16 08:40:00', 0, 203, 2.00), 
(4, '2024-01-16 19:20:00', '2024-01-16 19:50:00', 'Region D', 8, '2024-01-16 19:30:00', 104, 1, 0, 60.00, '2024-01-16 19:15:00', 0, 204, 4.00),
(5, '2024-01-17 15:10:00', '2024-01-17 15:40:00', 'Region E', 12, '2024-01-17 15:20:00', 105, 1, 0, 70.00, '2024-01-17 15:05:00', 0, 205, 6.00),
(6, '2024-01-17 11:30:00', '2024-01-17 12:00:00', 'Region F', 3, '2024-01-17 11:40:00', 106, 0, 1, 45.00, '2024-01-17 11:25:00', 5.00, 206, 2.00),
(7, '2024-01-18 21:15:00', '2024-01-18 21:45:00', 'Region G', 6, '2024-01-18 21:20:00', 107, 1, 0, 55.00, '2024-01-18 21:10:00', 0, 207, 3.50), 
(8, '2024-01-19 14:45:00', '2024-01-19 15:15:00', 'Region H', 0, '2024-01-19 14:50:00', 108, 1, 1, 35.00, '2024-01-19 14:40:00', 0, 208, 2.50), 
(9, '2024-01-20 13:30:00', '2024-01-20 14:00:00', 'Region I', 7, '2024-01-20 13:40:00', 109, 1, 0, 65.00, '2024-01-20 13:25:00', 0, 209, 4.00),
(10, '2024-01-21 09:20:00', '2024-01-21 09:50:00', 'Region J', 15, '2024-01-21 09:30:00', 110, 0, 0, 80.00, '2024-01-21 09:15:00', 0, 210, 10.00);*/

-- Select * from  doordash_delivery;


Select DATENAME(weekday,customer_placed_order_datetime) as weekday,
DATEPART(hour, customer_placed_order_datetime) as hour_of_order,
round(avg(order_total + tip_amount - discount_amount - refunded_amount),2) as average_earnings
from
doordash_delivery
group by DATENAME(weekday,customer_placed_order_datetime),
DATEPART(hour, customer_placed_order_datetime)
order by weekday, hour_of_order