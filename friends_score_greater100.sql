/* Write a SQL query to find person who has friends whose total marks > 100 */
/*
Select * from friends
Select * from Persons
*/

with CTE as(
Select f.PersonID,count(f.friendid) as number_of_friends,sum(p.score) as friend_score from friends as f
inner join
persons as p
on f.friendid = p.personid
group by f.PersonID
having sum(p.score) > 100
)

Select p.name,c.* from persons as p
inner join
CTE as c
on p.personid = c.personid