-- Write a SQL query to find nth occurence of a day from a given date
-- If given day is monday then 2, tuesday then 3....

declare @today_date date;
declare @n int;
set @today_date = '2024-06-19';
set @n = 4;

select DATEADD(week,@n-1,dateadd(day, 4 - datepart(weekday,@today_date), @today_date))

