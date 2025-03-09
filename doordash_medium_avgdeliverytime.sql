-- Drop the table if it exists
DROP TABLE IF EXISTS doordash_deliveries;

-- Create the table
CREATE TABLE doordash_deliveries (
    delivery_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    delivery_start_time DATETIME NOT NULL,
    delivery_end_time DATETIME NOT NULL
);

-- Insert data with correct syntax
INSERT INTO doordash_deliveries (delivery_id, driver_id, delivery_start_time, delivery_end_time) VALUES
(1, 101, '2024-03-01 08:00:00', '2024-03-01 08:30:00'),
(2, 102, '2024-03-01 09:15:00', '2024-03-01 09:45:00'),
(3, 101, '2024-03-01 10:00:00', '2024-03-01 10:35:00'),
(4, 103, '2024-03-01 11:00:00', '2024-03-01 11:20:00'),
(5, 102, '2024-03-02 08:30:00', '2024-03-02 09:00:00'),
(6, 103, '2024-03-02 09:45:00', '2024-03-02 10:05:00'),
(7, 101, '2024-03-02 11:30:00', '2024-03-02 12:10:00');

-- Select * from doordash_deliveries;

-- driver_id, avg(delivery_time)

Select 
a.driver_id, avg(datediff(minute, a.delivery_start_time, b.delivery_end_time))
from doordash_deliveries as a
left join
doordash_deliveries as b
on
a.driver_id = b.driver_id
and
a.delivery_id = b.delivery_id
group by 
a.driver_id










