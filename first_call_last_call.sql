Create Table Phone_Log(
Source_Phone_Nbr Bigint,
Destination_Phone_Nbr Bigint,
Call_Start_DateTime Datetime) ;

Insert into Phone_Log Values (2345,6789,'2012-07-01 10:00')
Insert into Phone_Log Values (2345,1234,'2012-07-01 11:00')
Insert into Phone_Log Values (2345,4567,'2012-07-01 12:00')
Insert into Phone_Log Values (2345,4567,'2012-07-01 13:00')
Insert into Phone_Log Values (2345,6789,'2012-07-01 15:00')
Insert into Phone_Log Values (3311,7890,'2012-07-01 10:00')
Insert into Phone_Log Values (3311,6543,'2012-07-01 12:00')
Insert into Phone_Log Values (3311,1234,'2012-07-01 13:00')

Select * from Phone_Log

-- Write a SQL query to flag the phone number from which the first and last called number is the same.

Select Source_Phone_Nbr,
Case when firstcall = lastcall then 'Y' else
'N' end as Flag
From
(
Select Source_Phone_Nbr,
max(case when rankfirst = 1 then Destination_Phone_Nbr END)as firstcall,
max(case when ranklast = 1 then Destination_Phone_Nbr END) as lastcall
FROM
(
Select Source_Phone_Nbr,Destination_Phone_Nbr,Call_Start_DateTime,
row_number() over(partition by Source_Phone_Nbr order by Call_Start_DateTime) as rankfirst,
row_number() over(partition by Source_Phone_Nbr order by Call_Start_DateTime desc) as ranklast
from
Phone_Log
) as A
group by Source_Phone_Nbr
) as B