-- Amazon Question

/*
Drop table persons
-- Step 1: Create the table
CREATE TABLE persons (
    person_id INT,
    person_name VARCHAR(50),
    weight INT,
    turn INT
);

-- Step 2: Insert the data into the table
INSERT INTO persons (person_id, person_name, weight, turn) VALUES
(5, 'George Washington', 250, 1),
(3, 'John Adams', 350, 2),
(6, 'Thomas Jefferson', 400, 3),
(2, 'Will Johnliams', 200, 4),
(4, 'Barrack Obama', 175, 5),
(1, 'James Elephant', 500, 6);

-- Step 3: Verify the table data
SELECT * FROM persons;*/

-- The maximum weight the elevator can hold is 1000.

-- Write an SQL query to find the person_name of the last person who will fit in the elevator 
-- without exceeding the weight limit. It is guaranteed that the person who is first in the queue can fit in the elevator.

Select top 1
person_name
from persons a
where 
(select sum(weight) from persons 
where a.turn >= turn) <= 1000
order by turn desc

-- Another way

with cte as(
Select *, sum(weight) over (order by turn) as cum_weight
from persons)

 Select top 1 person_name from cte where cum_weight <= 1000
 order by turn desc





