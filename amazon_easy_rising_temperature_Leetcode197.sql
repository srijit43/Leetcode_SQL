-- Amazon easy

-- Create the table
/*
CREATE TABLE Weather (
    id INT,
    recordDate DATE NOT NULL,
    Temperature INT NOT NULL
);

-- Insert data into the table
INSERT INTO Weather (id, recordDate, Temperature)
VALUES 
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);
*/

-- Select * from weather

with cte as(
Select *,
lag(temperature) over(order by id) as previous_day_temp

from
weather)

-- Select * from cte

Select id, recordDate from cte where previous_day_temp < temperature


-- another way

SELECT w1.id AS Id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(DAY, w2.recordDate, w1.recordDate) = 1
AND w1.Temperature > w2.Temperature;