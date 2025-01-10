-- Medium Snapchat

-- Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.

-- Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.

/*Notes:

Calculate the following percentages:
time spent sending / (Time spent sending + Time spent opening)
Time spent opening / (Time spent sending + Time spent opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.*/


-- SELECT * FROM activities LIMIT 5;
-- Select * from age_breakdown limit 5;

with cte as(
Select user_id, 
SUM(case when activity_type = 'open' then time_spent else 0 end) as time_opening,
SUm(case when activity_type = 'send' then time_spent else 0 end) as time_sending
from activities
group by user_id)

SELECT age_bucket,
ROUND(100.0*time_sending/(time_sending + time_opening),2) as send_perc,
ROUND(100.0*time_opening/(time_sending + time_opening),2)  as open_perc
FROM cte as c 
INNER JOIN
age_breakdown a
on c.user_id = a.user_id
ORDER BY age_bucket;