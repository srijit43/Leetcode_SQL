-- Tournament winners
/*
create table players
(player_id int,
group_id int)

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int)

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);
*/

-- Select * from players
-- Select * from matches

-- which player has max score in each group. Write SQL query to find winner in each group
-- in case score is tied player with lowest id wins

With player_scores as (
Select first_player as player_id, first_score as score from matches
union all
Select second_player, second_score from matches)
,final_scores as
( Select p.group_id, ps.player_id, sum(score) as score
from player_scores as ps
inner join
players as p
on ps.player_id = p.player_id
group by p.group_id, ps.player_id)
, final_ranking as
(
Select *, rank() over(partition by group_id order by score desc, player_id asc) as rn
from final_scores)

Select * from final_ranking where rn = 1
)



