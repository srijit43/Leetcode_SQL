-- Amazon medium

-- Creating Teams table
/*
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL
);

-- Inserting data into Teams table
INSERT INTO Teams (team_id, team_name) VALUES
(10, 'Leetcode FC'),
(20, 'NewYork FC'),
(30, 'Atlanta FC'),
(40, 'Chicago FC'),
(50, 'Toronto FC');

-- Creating Matches table
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    host_team INT NOT NULL,
    guest_team INT NOT NULL,
    host_goals INT NOT NULL,
    guest_goals INT NOT NULL,
    FOREIGN KEY (host_team) REFERENCES Teams(team_id),
    FOREIGN KEY (guest_team) REFERENCES Teams(team_id)
);

-- Inserting data into Matches table
INSERT INTO Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES
(1, 10, 20, 3, 0),
(2, 30, 10, 2, 2),
(3, 10, 50, 5, 1),
(4, 20, 30, 1, 0),
(5, 50, 30, 1, 0);*/

Select * from teams
Select * from matches

-- Write an SQL query that selects the team_id, team_name and num_points of each team in the tournament after all described matches. Result table should be ordered by num_points (decreasing order). In case of a tie, order the records by team_id (increasing order).

select t.team_id, t.team_name,
    isnull(sum(case when t.team_id = m.host_team and m.host_goals > m.guest_goals then 3
    when t.team_id = m.host_team and m.host_goals = m.guest_goals then 1
    when t.team_id = m.guest_team and m.host_goals < m.guest_goals then 3
    when t.team_id = m.guest_team and m.host_goals = m.guest_goals then 1
    else 0 end), 0) as num_points
from Matches m
right join Teams t
on m.host_team = t.team_id or m.guest_team = t.team_id
group by team_id, team_name
order by num_points desc, team_id