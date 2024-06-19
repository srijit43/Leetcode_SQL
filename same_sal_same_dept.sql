-- SQL query interview practice

/*CREATE TABLE [emp_salary]
(
    [emp_id] INTEGER  NOT NULL,
    [name] NVARCHAR(20)  NOT NULL,
    [salary] NVARCHAR(30),
    [dept_id] INTEGER
);


INSERT INTO emp_salary
(emp_id, name, salary, dept_id)
VALUES(101, 'sohan', '3000', '11'),
(102, 'rohan', '4000', '12'),
(103, 'mohan', '5000', '13'),
(104, 'cat', '3000', '11'),
(105, 'suresh', '4000', '12'),
(109, 'mahesh', '7000', '12'),
(108, 'kamal', '8000', '11');*/

-- write sql query to find all employee with same salary in same dept

with cte as (
select salary,dept_id
from emp_salary
group by salary, dept_id
having count(1) > 1)
select a.* from
emp_salary as a 
inner join cte
on a.dept_id = cte.dept_id
and a.salary = cte.salary
