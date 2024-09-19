/*Create table cars
(
id int,
model varchar(20),
color varchar(20),
brand varchar(20)
)

Insert into cars values (1,'Leaf','black','Nissan')
Insert into cars values (2,'Rogue','white','Nissan')
Insert into cars values (3,'Model Y','black','Tesla')
Insert into cars values (4,'Roadster','red','Tesla')
Insert into cars values (5,'Ioniq 5','black','Hyundai')
Insert into cars values (6,'Ioniq 5','black','Hyundai')
Insert into cars values (7,'Elantra','white','Hyundai')*/

-- Select * from cars
-- Query 1 ( delete duplicate records)

delete from cars
where id not in
(Select min(id) from cars
group by model, brand)


delete from cars 
where id in (Select max(id) from cars
group by model, brand
having count(1) > 1)










