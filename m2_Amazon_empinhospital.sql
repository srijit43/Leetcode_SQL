-- Amazon question

-- Amazon medium
-- write a sql query to find total number of people present in hospital

/*

create table hospital ( emp_id int
, action varchar(10)
, time datetime);

insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital values ('5', 'out', '2019-12-22 09:40:00');


*/

-- Select * from hospital

-- we can do problem using logic in time should be greater than out time

with cte as(
Select emp_id,
max(case when action = 'in' then time end) as intime,
max(case when action = 'out' then time end) as outtime
from hospital
group by emp_id)

Select * from cte where intime > outtime or outtime is null