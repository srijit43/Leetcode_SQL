-- Amazon medium Leetcode 1264

/*
-- Create Friendship Table
CREATE TABLE Friendship (
    user1_id INT NOT NULL,
    user2_id INT NOT NULL
);

-- Insert data into Friendship Table
INSERT INTO Friendship (user1_id, user2_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(2, 5),
(6, 1);

-- Create Likes Table
CREATE TABLE Likes (
    user_id INT NOT NULL,
    page_id INT NOT NULL
);

-- Insert data into Likes Table
INSERT INTO Likes (user_id, page_id) VALUES
(1, 88),
(2, 23),
(3, 24),
(4, 56),
(5, 11),
(6, 33),
(2, 77),
(3, 77),
(6, 88);
*/

Select * from friendship
Select * from likes

-- Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. It should not recommend pages you already liked.

-- Return result table in any order without duplicates.

with cte_friends as(
select user2_id as friends
from
friendship
where user1_id = 1
union all
Select user1_id
from friendship
where user2_id = 1),
cte_pages as (
Select c.friends, l.page_id
from cte_friends c
left join
likes l
on 
c.friends = l.user_id)

Select distinct(page_id) from cte_pages
where page_id not in
(Select page_id from likes where user_id = 1)











