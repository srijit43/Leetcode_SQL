/*CREATE TABLE fb_users (city_id BIGINT, device BIGINT, id BIGINT PRIMARY KEY, joined_at DATETIME, name VARCHAR(255));

INSERT INTO fb_users (city_id, device, id, joined_at, name) VALUES(101, 1, 1, '2019-06-15', 'Alice'),(102, 2, 2, '2020-03-10', 'Bob'),(103, 1, 3, '2018-11-25', 'Charlie'),(104, 3, 4, '2017-09-05', 'David'),(105, 1, 5, '2019-01-20', 'Eve'),(106, 2, 6, '2020-01-05', 'Frank');

CREATE TABLE fb_comments (body VARCHAR(MAX),created_at DATETIME,user_id BIGINT,FOREIGN KEY (user_id) REFERENCES fb_users(id));

INSERT INTO fb_comments (body, created_at, user_id) VALUES ('Great post!', '2020-01-01 10:00:00', 1), ('Interesting article', '2020-01-02 12:30:00', 1), ('Thanks for sharing!', '2020-01-05 08:20:00', 2), ('Nice update', '2020-01-08 15:45:00', 3), ('Good job', '2020-01-12 14:00:00', 3), ('Helpful content', '2020-01-14 09:00:00', 3), ('Loved it!', '2020-01-18 11:10:00', 5), ('Noted', '2020-01-20 17:40:00', 6), ('Cool!', '2020-01-22 08:55:00', 6), ('Agreed', '2020-01-25 19:30:00', 6), ('Well written', '2020-01-28 20:45:00', 1), ('Informative', '2020-01-30 13:50:00', 5), ('Awesome', '2019-12-31 23:59:00', 2);*/

Select * from fb_users
Select * from fb_comments

/*
Write a query to calculate the distribution of comments by the count of users that joined Meta/Facebook between 2018 and 2020, for the month of January 2020.
*/

WITH CommentCounts AS (
    SELECT 
        vu.id,
        COUNT(fc.body) AS comment_count
    FROM fb_users vu
    JOIN fb_comments fc 
        ON vu.id = fc.user_id
        AND fc.created_at >= '2020-01-01'
        AND fc.created_at < '2020-02-01'
        AND fc.created_at >= vu.joined_at
    WHERE YEAR(vu.joined_at) BETWEEN 2018 AND 2020
    GROUP BY vu.id
)
SELECT 
    comment_count, 
    COUNT(*) AS user_count
FROM CommentCounts
GROUP BY comment_count
ORDER BY comment_count ASC;
