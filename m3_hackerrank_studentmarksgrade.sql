-- Hacker rank brilliant query 
-- we have grades table with grade, min_mark(lb), max_mark(ub) and students with name, id,name and marks
-- display the names of only the students who got 8 or higher

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select
case when g.grade >= 8 then s.name 
else NULL
END AS Names
, g.grade, s.marks

from students s
inner join grades g
on  g.max_mark >= s.marks and  s.marks  >= g.min_mark
order by g.grade desc,  s.name asc, s.marks asc;