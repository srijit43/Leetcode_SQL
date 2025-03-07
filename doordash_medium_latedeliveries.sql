/*CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_placed DATETIME NOT NULL,
    eta_predicted DATETIME NOT NULL,
    actual_eta DATETIME NOT NULL
);

INSERT INTO deliveries (delivery_id, order_placed, eta_predicted, actual_eta)
VALUES 
(1, '2024-03-01 18:30:00', '2024-03-01 19:00:00', '2024-03-01 21:30:00'),
(2, '2024-03-02 12:15:00', '2024-03-02 12:45:00', '2024-03-02 13:00:00'),
(3, '2024-03-03 20:00:00', '2024-03-03 20:45:00', '2024-03-03 22:15:00'),
(4, '2024-03-04 17:10:00', '2024-03-04 17:40:00', '2024-03-04 18:20:00'),
(5, '2024-03-05 19:25:00', '2024-03-05 19:55:00', '2024-03-05 22:00:00'),
(6, '2024-03-06 14:45:00', '2024-03-06 15:15:00', '2024-03-06 15:45:00'),
(7, '2024-03-07 21:00:00', '2024-03-07 21:30:00', '2024-03-07 23:00:00'),
(8, '2024-03-08 16:30:00', '2024-03-08 17:00:00', '2024-03-08 19:00:00'),
(9, '2024-03-09 11:00:00', '2024-03-09 11:30:00', '2024-03-09 12:00:00'),
(10, '2024-03-10 22:00:00', '2024-03-10 22:30:00', '2024-03-11 01:00:00'),
(11, '2024-03-11 13:10:00', '2024-03-11 13:40:00', '2024-03-11 14:10:00'),
(12, '2024-03-12 17:50:00', '2024-03-12 18:20:00', '2024-03-12 20:50:00'),
(13, '2024-03-13 20:05:00', '2024-03-13 20:35:00', '2024-03-13 23:30:00'),
(14, '2024-03-14 09:30:00', '2024-03-14 10:00:00', '2024-03-14 10:20:00'),
(15, '2024-03-15 15:45:00', '2024-03-15 16:15:00', '2024-03-15 18:30:00');*/

Select * from deliveries
/*
1. give a result column if actual - pred >= 20 mins
2. count all deliveries
3. count(late)/count(*)
*/

SELECT 
    (COUNT(CASE WHEN DATEDIFF(MINUTE, eta_predicted, actual_eta) > 60 THEN 1 END) * 100.0 / COUNT(*)) AS late_delivery_percentage
FROM deliveries;


WITH orders_dd AS (
    SELECT 
        FORMAT(order_placed, 'yyyy-MM') AS year_month,
        delivery_id,
        CASE 
            WHEN DATEDIFF(MINUTE, eta_predicted, actual_eta) > 20 THEN 1 
            ELSE 0 
        END AS extremely_late
    FROM deliveries
)

SELECT 
    year_month,
    CAST(SUM(extremely_late) AS FLOAT) / COUNT(DISTINCT delivery_id) * 100 AS perc_extremely_late
FROM orders_dd
GROUP BY year_month;




