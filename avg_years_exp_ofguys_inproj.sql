-- Average years of experience of guys in a project

Select p.project_id, round(sum(e.experience_years)/count(e.employee_id),2) as average_years
from project as p
left join 
employee as e
on p.employee_id = e.employee_id
group by p.project_id