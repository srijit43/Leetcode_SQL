Create Table SeatArrangement (
ID int,
StudentName Varchar(30)
)

Insert into SeatArrangement Values (1,'Emma')
Insert into SeatArrangement Values (2,'John')
Insert into SeatArrangement Values (3,'Sophia')
Insert into SeatArrangement Values (4,'Donald')
Insert into SeatArrangement Values (5,'Tom')

-- Write a SQL code to interchange seats with adjacent occupant

Select
Case when id%2<>0 and id = (Select count(*) as total from SeatArrangement) then id
	 when id%2<>0 then id+1
	 when id %2=0 then id-1 end as id,
	 Studentname
from SeatArrangement
order by id
