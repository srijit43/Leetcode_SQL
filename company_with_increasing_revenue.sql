-- Find company whose revenue increased every year

/*create table company_revenue 
(
company varchar(100),
year int,
revenue int
)

insert into company_revenue values 
('ABC1',2000,100),('ABC1',2001,110),('ABC1',2002,120),('ABC2',2000,100),('ABC2',2001,90),('ABC2',2002,120)
,('ABC3',2000,500),('ABC3',2001,400),('ABC3',2002,600),('ABC3',2003,800);*/

-- Solution should be generuc

-- Select * from company_revenue
with cte as(
Select *,
lag(revenue,1,0) over(partition by company order by year) as prev_revenue,
revenue - lag(revenue,1,0) over(partition by company order by year) as rev_diff,
count(1) over(partition by company) as cnt
from company_revenue)

Select distinct(company) from cte where company not in (Select company from cte where rev_diff<0)