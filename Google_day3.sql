-- Google question

-- You are analyzing a social network dataset at Google. 
-- Your task is to find mutual friends between two users, Karl and Hans. 
-- There is only one user named Karl and one named Hans in the dataset.

/*CREATE TABLE google_users(user_id INT, user_name varchar(30));
INSERT INTO google_users VALUES (1, 'Karl'), (2, 'Hans'), (3, 'Emma'), (4, 'Emma'), (5, 'Mike'), (6, 'Lucas'), (7, 'Sarah'), (8, 'Lucas'), (9, 'Anna'), (10, 'John');

CREATE TABLE google_friends(user_id INT, friend_id INT);
INSERT INTO google_friends VALUES (1,3),(1,5),(2,3),(2,4),(3,1),(3,2),(3,6),(4,7),(5,8),(6,9),(7,10),(8,6),(9,10),(10,7),(10,9);*/

Select * from google_users
Select * from google_friends;


WITH karl_id AS (
    SELECT user_id 
    FROM google_users 
    WHERE user_name = 'Karl'
),
hans_id AS (
    SELECT user_id 
    FROM google_users 
    WHERE user_name = 'Hans'
),

-- Step 2: Get friends of Karl
friends_of_karl AS (
    SELECT friend_id 
    FROM google_friends 
    WHERE user_id = (SELECT user_id FROM karl_id)
),

-- Step 3: Get friends of Hans
friends_of_hans AS (
    SELECT friend_id 
    FROM google_friends 
    WHERE user_id = (SELECT user_id FROM hans_id)
)

-- Step 4: Find mutual friends
SELECT gu.user_name AS mutual_friend
FROM friends_of_karl fk
JOIN friends_of_hans fh ON fk.friend_id = fh.friend_id
JOIN google_users gu ON gu.user_id = fk.friend_id;

