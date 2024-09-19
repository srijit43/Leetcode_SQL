-- Display highest and lowest salary corresponding to each 
--- Q2: Display highest and lowest salary --- 
/*

SET IDENTITY_INSERT employee ON;

-- drop table if exists employee;
create table employee
(
	emp_id int,
	name varchar(100),
	dept varchar(100),
	salary int
);
insert into employee values(1, 'Alexander', 'Admin', 6500);
insert into employee values(2, 'Leo', 'Finance', 7000);
insert into employee values(3, 'Robin', 'IT', 2000);
insert into employee values(4, 'Ali', 'IT', 4000);
insert into employee values(5, 'Maria', 'IT', 6000);
insert into employee values(6, 'Alice', 'Admin', 5000);
insert into employee values(7, 'Sebastian', 'HR', 3000);
insert into employee values(8, 'Emma', 'Finance', 4000);
insert into employee values(9, 'John', 'HR', 4500);
insert into employee values(10, 'Kabir', 'IT', 8000);

select * from employee;
*/

with cte as
(
select *, rank() over(partition by dept order by salary desc) as rn
from employee
)

Select * from cte where rn = 1


with cte as
(
select *, rank() over(partition by dept order by salary asc) as rn
from employee
)

Select * from cte where rn = 1
