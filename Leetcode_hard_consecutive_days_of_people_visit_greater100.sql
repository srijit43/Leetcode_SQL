-- Leetcode hard Human traffic of stadium
-- The table has data of date, no 0f people who visited
-- Write a query to display 3 or more consecutive rows with traffic > 100

/*create table stadium_footfall (
id int,
visit_date date,
no_of_people int
);

insert into stadium_footfall
values (1,'2017-07-01',10)
,(2,'2017-07-02',109)
,(3,'2017-07-03',150)
,(4,'2017-07-04',99)
,(5,'2017-07-05',145)
,(6,'2017-07-06',1455)
,(7,'2017-07-07',199)
,(8,'2017-07-08',188);*/

-- Select * from stadium_footfall

with cte as (
Select *,
ROW_NUMBER() over(order by visit_date) as rn, 
id - ROW_NUMBER() over(order by visit_date) as grp
from 
stadium_footfall
where no_of_people >= 100)

Select id,visit_date,no_of_people from cte
where grp in
(
Select grp
from cte
group by grp
having count(1) >=3
)
