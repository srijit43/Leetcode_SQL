-- IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
-- The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September). 
-- Additionally, it should count the number of employees who did not run any queries during this period.

-- Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.

-- SELECT * FROM queries LIMIT 10;

-- Select * from employees limit 10;

with cte as(
select count(distinct(q.query_id)) as unique_queries,e.employee_id
from employees as e
left JOIN
queries as q
on e.employee_id = q.employee_id
AND q.query_starttime >= '2023-07-01 00:00:00'
  AND q.query_starttime <= '2023-09-30 23:59:59'
group by e.employee_id
 )

Select coalesce(unique_queries,0) as unique_queries, count(employee_id) as employee_count
from cte 
group by unique_queries
order by count(employee_id) desc
