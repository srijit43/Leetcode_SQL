-- Photoshop revenue analysis

-- scriot

/*
Create table adobe_trans
(
cust_id int,
product varchar(20),
amount int
)

Insert into adobe_trans values (123,'Photoshop',50)
Insert into adobe_trans values (123,'Premier Pro',100)
Insert into adobe_trans values (123,'After Effects',50)
Insert into adobe_trans values (234,'Premier Pro',100)
Insert into adobe_trans values (234,'Illustrator',200)
*/

-- Select * from adobe_trans;

-- give the total amount spent by those customers who bought photoshop

with cte as(
Select * from adobe_trans 
where cust_id in (Select distinct(cust_id) from adobe_trans where product = 'Photoshop')
)

Select cust_id, sum(amount) as revenue from cte where product != 'Photoshop'
group by cust_id




