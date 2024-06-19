-- Missing ID from table

Create Table Sample_Table(
ID int)

Insert into Sample_Table Values (1)
Insert into Sample_Table Values (4)
Insert into Sample_Table Values (7)
Insert into Sample_Table Values (8)

Select * from Sample_Table

With CTE_A As
(
Select MAX(ID) as Maximum from Sample_Table
),
CTE_B AS
(
Select Min(ID) as Id from Sample_Table
union all
Select B.ID+1 from CTE_A A 
INNER Join
CTE_B B
ON 
B.ID<A.MAXIMUM
)
Select B.ID from CTE_B as B
left join
Sample_Table as C
on B.ID = C.ID
where C.ID is null