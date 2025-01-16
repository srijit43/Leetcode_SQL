-- Amazon medium
/*
CREATE TABLE Seat (
    id INT PRIMARY KEY,
    student VARCHAR(50)
);

INSERT INTO Seat (id, student) VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');*/

-- Select * from Seat
-- Write an SQL query to swap the seat id of every two consecutive students. 
-- If the number of students is odd, the id of the last student is not swapped.


SELECT
    s1.id, COALESCE(s2.student, s1.student) AS student
FROM
    seat s1
        LEFT JOIN
    seat s2 ON ((s1.id + 1) ^ 1) - 1 = s2.id
ORDER BY s1.id;