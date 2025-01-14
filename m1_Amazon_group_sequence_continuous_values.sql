-- Amazon scenario based question 2

-- Input table has group,seq. Find maximum and minimun numbers in sequence for each group


/*

CREATE TABLE Emp(
[Group]  varchar(20),
[Sequence]  int )

INSERT INTO Emp VALUES('A',1)
INSERT INTO Emp VALUES('A',2)
INSERT INTO Emp VALUES('A',3)
INSERT INTO Emp VALUES('A',5)
INSERT INTO Emp VALUES('A',6)
INSERT INTO Emp VALUES('A',8)
INSERT INTO Emp VALUES('A',9)
INSERT INTO Emp VALUES('B',11)
INSERT INTO Emp VALUES('C',1)
INSERT INTO Emp VALUES('C',2)
INSERT INTO Emp VALUES('C',3)

*/

-- whenever there is contuniuty take the min and max values

-- Select * from emp;

Select [Group],
Sequence,
row_number() over ( partition by [Group] order by sequence) as rank
from emp

Select [Group],
Sequence,
row_number() over ( partition by [Group] order by sequence) as rank,
sequence - row_number() over ( partition by [Group] order by sequence) as group_split
from emp

with cte as(
Select [Group],Sequence,
row_number() over ( partition by [Group] order by sequence) as rank,
sequence - row_number() over ( partition by [Group] order by sequence) as group_split
from emp)

Select [group],
min(sequence) as min_seq,
max(sequence) as max_seq
from cte

group by [group], group_split
order by [group]













