-- project employees

/*
Create table projects_e1
(
project_id int,
emp_id int
)

Insert into projects_e1 values (1,1)
Insert into projects_e1 values (1,2)
Insert into projects_e1 values (1,3)
Insert into projects_e1 values (2,3)
Insert into projects_e1 values (2,4)
Insert into projects_e1 values (3,4)
Insert into projects_e1 values (3,5)

Create table emp_e1(
emp_id int,
emp_name varchar(20),
experience int
)

Insert into emp_e1 values (1,'Srijit',5)
Insert into emp_e1 values (2,'Rohan',6)
Insert into emp_e1 values (3,'Parna',4)
Insert into emp_e1 values (4,'Rounak',7)
Insert into emp_e1 values (5,'Sayak',21)
*/

-- write sql query to find project with most employees

Select * from projects_e1
Select * from emp_e1

select top 1
project_id, count(emp_id) as total_resources from projects_e1
group by project_id
order by count(emp_id) desc

-- Making this a bit more challenging. Find which project has more experience

with cte as(
select 
p.project_id , e.emp_name, e.experience
from
projects_e1 as p
left join
emp_e1 as e
on
p.emp_id = e.emp_id)


Select 
top 1
project_id, sum(experience) as total_years_exp
from cte
group by project_id
order by sum(experience) desc

-- display the highest experience employee from each project

with cte as(
select 
p.project_id , e.emp_name, e.experience
from
projects_e1 as p
left join
emp_e1 as e
on
p.emp_id = e.emp_id),

cte2 as(
Select project_id, emp_name, experience, DENSE_RANK() over(partition by project_id order by experience desc) as dr
from cte )

Select project_id, emp_name, experience from cte2 where dr = 1
order by experience desc






