-- medium Faang

/*
As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying high earners in each department. 
A 'high earner' within a department is defined as an employee with a salary ranking among the top three salaries within that department.

You're tasked with identifying these high earners across all departments. Write a query to display the employee's name along with their department name and salary. In case of duplicates, sort the results of department name in ascending order, 
then by salary in descending order. If multiple employees have the same salary, then order them alphabetically.

*/

with cte1 as(
SELECT
employee_id, name, department_id,salary,dense_rank() over (PARTITION by department_id order by salary desc) as dr
FROM
employee),
cte2 AS
(
Select c1.*, d.department_name
from cte1 as c1
left JOIN
department as d 
on c1.department_id = d.department_id
)

Select department_name, name, salary from cte2 where dr<=3
order by
department_name,
salary DESC,
name