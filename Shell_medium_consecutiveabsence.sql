/*In a table EmployeeAttendance with columns EmployeeID, Date, and Status (values: ‘Present’, ‘Absent’), write a query to find employees with the highest consecutive absences in the last quarter.
*/

-- Create the EmployeeAttendance table
/*CREATE TABLE EmployeeAttendance (
    EmployeeID INT,
    Date DATE,
    Status VARCHAR(10)
);

-- Insert sample data
INSERT INTO EmployeeAttendance (EmployeeID, Date, Status) VALUES
(1, '2024-10-01', 'Absent'),
(1, '2024-10-02', 'Absent'),
(1, '2024-10-03', 'Present'),
(1, '2024-10-04', 'Absent'),
(1, '2024-10-05', 'Present'),
(2, '2024-10-01', 'Present'),
(2, '2024-10-02', 'Absent'),
(2, '2024-10-03', 'Absent'),
(2, '2024-10-04', 'Present'),
(2, '2024-10-05', 'Absent'),
(3, '2024-10-01', 'Absent'),
(3, '2024-10-02', 'Present'),
(3, '2024-10-03', 'Absent'),
(3, '2024-10-04', 'Absent'),
(3, '2024-10-05', 'Present'),
(4, '2024-10-01', 'Present'),
(4, '2024-10-02', 'Present'),
(4, '2024-10-03', 'Present'),
(4, '2024-10-04', 'Absent'),
(4, '2024-10-05', 'Absent');
Insert  into EmployeeAttendance values (4, '2024-11-05', 'Absent');)
*/

Select * from EmployeeAttendance;

-- Approach: 

/*Select employeeID, datepart(month,Date), count(*) as no_of_days
from
EmployeeAttendance
where Status = 'Absent' and datepart(month,Date) in ('10','11','12')
group by employeeID, datepart(month,Date)*/

Select * from employeeAttendance
-- streak 
with cte as(
Select 
employeeID, date, 
status,
(row_number() over (partition by employeeID order by date)) - (row_number() over (partition by employeeID,status order by date)) as x
from
EmployeeAttendance)

-- select * from cte

Select top 1 employeeID, status, max(x)
from cte where status = 'Absent'
group by employeeID, status
order by max(x) desc

-- Solution 48 - 61



Select 
employeeID, date, 
status,
(row_number() over (partition by employeeID,status order by date))
from EmployeeAttendance


Select * from EmployeeAttendance
where date = '2024-10-04'