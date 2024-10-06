/* employees have different billing rates listed. This is an example of SCD. */

/*create table billings 
(
emp_name varchar(10),
bill_date date,
bill_rate int
);
delete from billings;
insert into billings values
('Sachin','01-JAN-1990',25)
,('Sehwag' ,'01-JAN-1989', 15)
,('Dhoni' ,'01-JAN-1989', 20)
,('Sachin' ,'05-Feb-1991', 30)
;

create table HoursWorked 
(
emp_name varchar(20),
work_date date,
bill_hrs int
);
insert into HoursWorked values
('Sachin', '01-JUL-1990' ,3)
,('Sachin', '01-AUG-1990', 5)
,('Sehwag','01-JUL-1990', 2)
,('Sachin','01-JUL-1991', 4)*/

-- Select * from billings
-- Select * from hoursworked


with date_range as(
Select *,lead(dateadd(day,-1,bill_date), 1, '9999-12-31')
over (partition by emp_name order by bill_date asc) as bill_date_end
from billings)
Select hw.emp_name, sum(dr.bill_rate * hw.bill_hrs)
from date_range as dr
inner join hoursworked hw
on hw.emp_name = dr.emp_name
and
hw.work_date between
dr.bill_date and dr.bill_date_end
group by hw.emp_name








