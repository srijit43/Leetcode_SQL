/*CREATE TABLE cust_tracking (cust_id VARCHAR(50), state BIGINT, timestamp DATETIME);

INSERT INTO cust_tracking (cust_id, state, timestamp) VALUES ('101', 1, '2024-01-10 08:00:00'), ('101', 0, '2024-01-10 10:30:00'), ('101', 1, '2024-01-10 14:00:00'), ('101', 0, '2024-01-10 15:45:00'), ('102', 1, '2024-01-10 09:15:00'), ('102', 0, '2024-01-10 12:00:00'), ('103', 1, '2024-01-10 07:00:00'), ('103', 0, '2024-01-10 09:30:00'), ('103', 1, '2024-01-10 13:00:00'), ('103', 0, '2024-01-10 16:00:00');

Select * from cust_tracking*/

-- How many hours was each user active on a day

WITH log_in AS (
    SELECT 
        c.*, 
        ROW_NUMBER() OVER (PARTITION BY c.cust_id ORDER BY timestamp) AS rnk 
    FROM cust_tracking c 
    WHERE state = 1
), 
log_off AS (
    SELECT 
        c.*, 
        ROW_NUMBER() OVER (PARTITION BY c.cust_id ORDER BY timestamp) AS rnk 
    FROM cust_tracking c 
    WHERE state = 0
) 
SELECT 
    a.cust_id, 
    CAST(SUM(DATEDIFF(SECOND, a.timestamp, b.timestamp)) / 3600.0 AS DECIMAL(10,2)) AS active_hours
FROM log_in a 
JOIN log_off b 
ON a.cust_id = b.cust_id AND a.rnk = b.rnk 
GROUP BY a.cust_id;

