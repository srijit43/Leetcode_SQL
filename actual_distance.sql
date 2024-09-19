--- Q3 : Find actual distance --- 

-- drop table car_travels;
/*create table car_travels
(
    cars                    varchar(40),
    days                    varchar(10),
    cumulative_distance     int
);
insert into car_travels values ('Car1', 'Day1', 50);
insert into car_travels values ('Car1', 'Day2', 100);
insert into car_travels values ('Car1', 'Day3', 200);
insert into car_travels values ('Car2', 'Day1', 0);
insert into car_travels values ('Car3', 'Day1', 0);
insert into car_travels values ('Car3', 'Day2', 50);
insert into car_travels values ('Car3', 'Day3', 50);
insert into car_travels values ('Car3', 'Day4', 100);*/

select * from car_travels;

select *,
lag(cumulative_distance,1,0) over(partition by cars order by days) as prev_day_odo,
abs(cumulative_distance - lag(cumulative_distance,1,0) over(partition by cars order by days)) as actual_distance
from car_travels
order by cars