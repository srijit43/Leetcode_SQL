-- Create the Scores_AWS table
/*
CREATE TABLE scores_aws (
    player_name NVARCHAR(50),
    gender CHAR(1),
    day DATE,
    score_points INT
);

-- Insert data into the Scores_AWS table
INSERT INTO scores_aws (player_name, gender, day, score_points)
VALUES 
    ('Aron', 'F', '2020-01-01', 17),
    ('Alice', 'F', '2020-01-07', 23),
    ('Bajrang', 'M', '2020-01-07', 7),
    ('Khali', 'M', '2019-12-25', 11),
    ('Slaman', 'M', '2019-12-30', 13),
    ('Joe', 'M', '2019-12-31', 3),
    ('Jose', 'M', '2019-12-18', 2),
    ('Priya', 'F', '2019-12-31', 23),
    ('Priyanka', 'F', '2019-12-30', 17);
*/

Select * from scores_aws

/*

Write an SQL query to find the total score for each gender at each day.

Order the result table by gender and day

*/

select gender, day,
    (select sum(score_points) total 
     from Scores_aws b
     where gender='F' and b.day<=a.day) total
from Scores_aws a
where gender='F'

union

select gender, day,
    (select sum(score_points) total 
     from Scores_aws b
     where gender='M' and b.day<=a.day) total
from Scores_aws a
where gender='M'
order by gender, day





