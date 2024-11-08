-- META interview

/*A table named “famous” has two columns called user id and follower id. 
It represents each user ID has a particular follower ID. These follower IDs are also users of hashtag#Facebook / hashtag#Meta.
Then, find the famous percentage of each user. 
Famous Percentage = number of followers a user has / total number of users on the platform.*/

/*CREATE TABLE meta_famous (user_id INT, follower_id INT);

INSERT INTO meta_famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13)*/

-- Select * from meta_famous

/*Select user_id, round(1.0 * count(follower_id)/(Select count(distinct(follower_id)) from meta_famous)*100,2,0) as popular_percent
from meta_famous
group by user_id*/

with distinct_users as
(Select  user_id as users from meta_famous
union
Select follower_id as users from meta_famous),

follower_count as
(Select user_id, count(follower_id) as followers
from meta_famous
group by user_id)

Select f.user_id,
round((f.followers * 100.0) / (Select count(*) from distinct_users),2) as famous_percentage
from follower_count as f;