/*

-- Create the Movies table with _aws suffix
CREATE TABLE Movies_aws (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100)
);

-- Insert data into the Movies_aws table
INSERT INTO Movies_aws (movie_id, title)
VALUES
    (1, 'Avengers'),
    (2, 'Frozen 2'),
    (3, 'Joker');

-- Create the Users table with _aws suffix
CREATE TABLE Users_aws (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert data into the Users_aws table
INSERT INTO Users_aws (user_id, name)
VALUES
    (1, 'Daniel'),
    (2, 'Monica'),
    (3, 'Maria'),
    (4, 'James');

-- Create the Movie_Rating table with _aws suffix
CREATE TABLE Movie_Rating_aws (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    PRIMARY KEY (movie_id, user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies_aws(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users_aws(user_id)
);

-- Insert data into the Movie_Rating_aws table
INSERT INTO Movie_Rating_aws (movie_id, user_id, rating, created_at)
VALUES
    (1, 1, 3, '2020-01-12'),
    (1, 2, 4, '2020-02-11'),
    (1, 3, 2, '2020-02-12'),
    (1, 4, 1, '2020-01-01'),
    (2, 1, 5, '2020-02-17'),
    (2, 2, 2, '2020-02-01'),
    (2, 3, 2, '2020-03-01'),
    (3, 1, 3, '2020-02-22'),
    (3, 2, 4, '2020-02-25');
*/

/*
Write the following SQL query:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return lexicographically smaller user name.

Find the movie name with the highest average rating in February 2020. In case of a tie, return lexicographically smaller movie name.

*/

Select * from movies_aws
Select * from users_aws
Select * from movie_rating_aws

WITH cte_user AS (
    SELECT 
        u.name as name,
        COUNT(m.rating) AS movies_rated
    FROM users_aws u
    LEFT JOIN movie_rating_aws AS m
        ON u.user_id = m.user_id
    GROUP BY u.name
    
),
cte_movie AS (
    SELECT 
        m.title as title, 
        ROUND(AVG(mr.rating * 1.0), 2) AS avg_rating
    FROM movies_aws AS m
    LEFT JOIN movie_rating_aws AS mr
        ON m.movie_id = mr.movie_id
    WHERE FORMAT(mr.created_at, 'yyyy-MM') = '2020-02'
    GROUP BY m.title
    
)

SELECT name 
FROM (
    SELECT TOP 1 name 
    FROM cte_user 
    ORDER BY movies_rated DESC, name
) AS top_user

UNION ALL

SELECT title 
FROM (
    SELECT TOP 1 title 
    FROM cte_movie 
    ORDER BY avg_rating DESC, title
) AS top_movie;
;





