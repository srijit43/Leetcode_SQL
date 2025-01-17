-- Amazon medium

/*
Drop table article_views
-- Step 1: Create the table
CREATE TABLE article_views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);

-- Step 2: Insert the provided data
INSERT INTO article_views (article_id, author_id, viewer_id, view_date) VALUES
(1, 3, 5, '2019-08-01'),
(3, 4, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');


-- Step 3: Verify the table data
SELECT * FROM article_views;
*/

/*
Write an SQL query to find all the people who viewed more than one article on the same date, sorted in ascending order by their id.
*/

with cte as(
Select viewer_id, view_date, count(distinct(article_id)) as articles_viewed
from
article_views
group by viewer_id, view_date
having count(distinct(article_id))>1)

Select viewer_id from cte