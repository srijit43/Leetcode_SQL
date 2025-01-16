-- Amazon medium

/*
Create table calls_m
(
from_id int,
to_id int,
duration int
)

Insert into calls_m values (1,2,59)
Insert into calls_m values (2,1,11)
Insert into calls_m values (1,3,20)
Insert into calls_m values (3,4,200)
Insert into calls_m values (3,4,200)
Insert into calls_m values (4,3,499)

*/

-- Select * from calls_m

-- Write an SQL query to report the number of calls and the total call duration between each pair 
-- of distinct persons (person1, person2) where person1 < person2.

SELECT 
    LEAST(from_id, to_id) AS person1,
    GREATEST(from_id, to_id) AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM 
    calls_m
WHERE 
    from_id != to_id
GROUP BY 
    LEAST(from_id, to_id),
    GREATEST(from_id, to_id)
ORDER BY 
    person1, person2;




