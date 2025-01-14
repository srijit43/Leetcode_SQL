-- Amazon Interview easy

-- Student table has student and his marks in 3 years, display students who only improved

/*

CREATE TABLE Student(
[Student_Name]  varchar(30),
[Total_Marks]  int ,
[Year]  int)

INSERT INTO Student VALUES('Srijit',90,2010)
INSERT INTO Student VALUES('Rohan',80,2010)
INSERT INTO Student VALUES('Sourav',70,2010)
INSERT INTO Student VALUES('Srijit',90,2011)
INSERT INTO Student VALUES('Rohan',85,2011)
INSERT INTO Student VALUES('Sourav',65,2011)
INSERT INTO Student VALUES('Srijit',80,2012)
INSERT INTO Student VALUES('Rohan',80,2012)
INSERT INTO Student VALUES('Sourav',90,2012)



*/

-- select * from student

with cte as(
Select
student_name,
year,
total_marks,
lag(total_marks) over (partition by student_name order by year) as prev_year_marks
from
student)
, cte2 as
(
Select *, 
case when total_marks >=prev_year_marks then 1 else 0 end as flag
from cte
)

select student_name, year, total_marks, prev_year_marks from cte2 where flag = 1












