-- FAANG well paid employee.

-- Find where employee earns more than manager

-- SELECT * FROM employee LIMIT 10;

with cte as(
SELECT e.employee_id, e.name, e.salary as emp_sal,
m.name as manager_name, m.salary as manager_sal
FROM
employee as e 
left JOIN
employee as m
on e.manager_id = m.employee_id)

select employee_id, name from cte where emp_sal > manager_sal