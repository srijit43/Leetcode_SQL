# Write your MySQL query statement below
-- manager with atleast 5 direct report

Select 
e.name
from Employee e
inner join 
Employee m
on e.id = m.managerID
where m.managerID is not null
group by m.managerID
having count(m.managerID)>=5