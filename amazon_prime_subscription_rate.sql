-- Amazon subscription rate by product action
-- Identify how many prime subscriptions happen based on the product launched by amazon. Pay, Music or whatever
-- within 30 days of signing up

/* Logic in this problem is see which user has utilized an amazon service(Music/pay) and subscribed from Prime(P)
and if the purchase date - sign up date < 30 then return the user */

/*create table users_amz
(
user_id integer,
name varchar(20),
join_date date
);
insert into users_amz
values (1, 'Jon', CAST('2-14-20' AS date)), 
(2, 'Jane', CAST('2-14-20' AS date)), 
(3, 'Jill', CAST('2-15-20' AS date)), 
(4, 'Josh', CAST('2-15-20' AS date)), 
(5, 'Jean', CAST('2-16-20' AS date)), 
(6, 'Justin', CAST('2-17-20' AS date)),
(7, 'Jeremy', CAST('2-18-20' AS date));

create table events_amz
(
user_id integer,
type varchar(10),
access_date date
);

insert into events_amz values
(1, 'Pay', CAST('3-1-20' AS date)), 
(2, 'Music', CAST('3-2-20' AS date)), 
(2, 'P', CAST('3-12-20' AS date)),
(3, 'Music', CAST('3-15-20' AS date)), 
(4, 'Music', CAST('3-15-20' AS date)), 
(1, 'P', CAST('3-16-20' AS date)), 
(3, 'P', CAST('3-22-20' AS date));

*/

-- Select * from users_amz
-- Select * from events_amz

Select count(distinct u.user_id) as total_users,
count(distinct case when DATEDIFF(day, u.join_date,e.access_date)<=30 then u.user_id end),
1.0 * count(distinct case when DATEDIFF(day, u.join_date,e.access_date)<=30 then u.user_id end)/count(distinct u.user_id)* 100
from users_amz as u 
left join events_amz as e
on u.user_id = e.user_id and e.type = 'P'

where u.user_id in 
( Select user_id from events_amz where type = 'Music')