--- Q6 : IPL Matches --- 

-- drop table teams;
/*create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders');
insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');*/
;

-- Select * from teams

-- When one team plays naother team just once or twice

-- once
with cte as(
select row_number() over(order by team_name) as id, t.*
from teams t)

Select home.team_name as home, away.team_name as away
from cte as home
join
cte as away
on home.id < away.id
-- or home.id > away.id
order by home

-- 10C2 = 45 ( So correct)

-- soln 2 twice facing

with cte as(
select row_number() over(order by team_name) as id, t.*
from teams t)

Select home.team_name as home, away.team_name as away
from cte as home
join
cte as away
on home.id <> away.id
-- or home.id > away.id
order by home