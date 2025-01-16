-- Amazon  Gameplay analysis I Leetcode 511, game play analysis II 512

/*

Create table Activity_amz
(
player_id int,
device_id int,
event_date datetime,
games_played int
)

Insert into Activity_amz values (1,2,'2016-03-01',5)
Insert into Activity_amz values (1,2,'2016-05-02',6)
Insert into Activity_amz values (2,3,'2017-06-25',1)
Insert into Activity_amz values (3,1,'2016-03-02',0)
Insert into Activity_amz values (3,4,'2018-07-03',5)


*/

-- Select * from Activity_amz

-- Write an SQL query to report the first login date for each player.

Select
player_id, min(event_date) as first_login
from
activity_amz
group by player_id


-- Write an SQL query to report the device that is first logged in for each player.

SELECT a.player_id, a.device_id
FROM activity_amz a
JOIN (
    SELECT player_id, MIN(event_date) AS min_event_date
    FROM activity_amz
    GROUP BY player_id
) b ON a.player_id = b.player_id AND a.event_date = b.min_event_date;

