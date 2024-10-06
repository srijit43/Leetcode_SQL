
/* Install and purchasing an app ( spotify) 
CREATE table activity
(
user_id varchar(20),
event_name varchar(20),
event_date date,
country varchar(20)
);
delete from activity;
insert into activity values (1,'app-installed','2022-01-01','India')
,(1,'app-purchase','2022-01-02','India')
,(2,'app-installed','2022-01-01','USA')
,(3,'app-installed','2022-01-01','USA')
,(3,'app-purchase','2022-01-03','USA')
,(4,'app-installed','2022-01-03','India')
,(4,'app-purchase','2022-01-03','India')
,(5,'app-installed','2022-01-03','SL')
,(5,'app-purchase','2022-01-03','SL')
,(6,'app-installed','2022-01-04','Pakistan')
,(6,'app-purchase','2022-01-04','Pakistan');

*/

Select * from activity

/* Find total active users each day*/

Select event_date, count(distinct(user_id)) as total_user_activity
from
activity
group by event_date


/* find total active users each week, week number*/

select datepart(week, event_date) as week_no , count(distinct(user_id)) as active_users
from activity
group by
datepart(week, event_date)

/* date wise activity of users who installed and purchased the app on the same day*/

with cte as(
Select user_id, event_date, 
case when count(distinct(event_name)) = 2 then user_id else null end as new_user
from activity
group by user_id, event_date
)

Select event_date, count(new_user) as same_day_buyers from cte
group by event_date



/* %of paid users in India , USA and other countries */

with country_wise_users as(
Select 
case when country in ('USA','India') then country else 'Others' end as country_new,
count(distinct(user_id)) as User_by_country
from 
activity
where event_name = 'app-purchase'
group by case when country in ('USA','India') then country else 'Others' end),
 total as (select sum(User_by_country) as total_users from country_wise_users)

select country_new,  (User_by_country*1.0/ total_users) * 100 as perc_users
from country_wise_users, total


/* find users where there is 1 day gap between installation and purchase */
-- select * from activity

with prev_data as(
select *,
lag(event_name,1) over (partition by user_id order by event_date) as previous_day_event,
lag(event_date,1) over (partition by user_id order by event_date) as previous_day
from 
activity)

Select * from prev_data
where event_name = 'app-purchase'
and previous_day_event = 'app-installed'
and datediff(day,previous_day, event_date) = 1





/* also 






