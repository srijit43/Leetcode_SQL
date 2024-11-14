-- LeetCode employee, department, max_sal by department
-- Use cte to make join, cte to implement DR, select statement

/* Write your T-SQL query statement below */
with cte as(
Select e.*, d.name as department
from employee e
left join
department d
on 
e.departmentID = d.id),
max_sal as
(Select department, name, salary,
dense_rank() over(partition by department order by salary desc) as dr
from cte
)

Select department, name as Employee, salary from max_sal where dr = 1
