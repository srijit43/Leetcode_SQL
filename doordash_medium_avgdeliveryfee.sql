/*CREATE TABLE deliveries (
    delivery_id INT,
    courier_id INT,
    start_point INT,
    end_point INT,
    delivery_fee DECIMAL(10,2),
    quantity INT,
    orderdate DATE
);

INSERT INTO deliveries (delivery_id, courier_id, start_point, end_point, delivery_fee, quantity, orderdate) VALUES
(1001, 501, 10, 15, 5.00, 3, '2022-01-01'),
(1002, 501, 5, 7, 2.00, 2, '2022-01-02'),
(1003, 501, 0, 3, 3.00, 1, '2022-01-03'),
(1004, 502, 18, 20, 2.00, 4, '2022-01-03'),
(1005, 503, 30, 35, 5.00, 1, '2022-01-03'),
(1006, 502, 12, 16, 4.00, 2, '2022-01-04'),
(1007, 503, 25, 30, 6.00, 3, '2022-01-05'),
(1008, 501, 8, 12, 3.50, 2, '2022-01-06'),
(1009, 502, 15, 18, 2.50, 1, '2022-01-07')*/

-- Select * from deliveries

/*You are the data analyst at DoorDash and it's your job to calculate the average distance travelled, rounded to the nearest whole number, and the total revenue for each courier id in the last month. The total revenue for each courier is calculated by summing all the delivery fee times the quantity of deliveries.

The courier fee is the absolute difference between the delivery's start point and end point, expressed as an integer with two decimal places. If the courier fee is greater than the delivery fee, the courier fee becomes the new delivery fee.*/

SELECT 
    courier_id,
    ROUND(AVG(ABS(start_point - end_point)), 0) AS average_distance,
    SUM( 
        CASE 
            WHEN ABS(start_point - end_point) > delivery_fee 
            THEN ABS(start_point - end_point) * quantity
            ELSE delivery_fee * quantity 
        END) AS total_revenue
FROM 
    deliveries

GROUP BY 
    courier_id;


