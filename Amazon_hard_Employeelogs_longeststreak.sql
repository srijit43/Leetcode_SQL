--1. You are given a table EmployeeLogs with columns EmployeeID, LoginTime, LogoutTime, and Date. Write a query to calculate the longest continuous working streak (consecutive days without missing a login) for each employee.


-- 

--CREATE TABLE EmployeeLogs (
--    EmployeeID INT,
--    LoginTime TIME,
--    LogoutTime TIME,
--    Date_work DATE
--);

--INSERT INTO EmployeeLogs (EmployeeID, LoginTime, LogoutTime, Date_work) VALUES
--(1, '08:00:00', '16:00:00', '2024-01-01'),
--(1, '08:15:00', '16:30:00', '2024-01-02'),
--(1, '08:10:00', '16:20:00', '2024-01-03'),
--(1, '08:30:00', '17:00:00', '2024-01-05'), -- Gap on 2024-01-04 (breaks streak)
--(1, '08:20:00', '16:45:00', '2024-01-06'),
--(2, '09:00:00', '17:30:00', '2024-01-01'),
--(2, '09:05:00', '17:40:00', '2024-01-02'),
--(2, '09:10:00', '17:35:00', '2024-01-04'), -- Gap on 2024-01-03 (breaks streak)
--(2, '09:00:00', '17:45:00', '2024-01-05'),
--(2, '09:15:00', '17:50:00', '2024-01-06'),
--(2, '09:20:00', '17:55:00', '2024-01-07');

-- select * from EmployeeLogs

-- step 1: find date before and datediff 
-- step 2: if datediff > 1 streak break else continued
-- step 3: return sequence with longest streak

WITH cte_attendance AS (
    SELECT
        EmployeeID,
        Date_work,
        LAG(Date_work) OVER (PARTITION BY EmployeeID ORDER BY Date_work) AS last_work_day
    FROM EmployeeLogs
),
cte_flag AS (
    SELECT 
        EmployeeID, 
        Date_work, 
        last_work_day,
        CASE WHEN DATEDIFF(day, last_work_day, Date_work) = 1 THEN 1 ELSE 0 END AS attendance_flag
    FROM cte_attendance
),
cte_streak AS (
    SELECT 
        EmployeeID, 
        Date_work, 
        SUM(CASE WHEN attendance_flag = 0 THEN 1 ELSE 0 END) 
        OVER (PARTITION BY EmployeeID ORDER BY Date_work) AS streak_id
    FROM cte_flag
)

select * from cte_streak

SELECT 
    EmployeeID, 
    MAX(streak_count) AS longest_streak 
	from 
	(
    SELECT 
        EmployeeID, 
        streak_id, 
        COUNT(*) AS streak_count
    FROM cte_streak
    GROUP BY EmployeeID, streak_id
) t
GROUP BY EmployeeID;


-- alternate better approach

WITH cte_numbered AS (
    SELECT 
        EmployeeID, 
        Date_work, 
        ROW_NUMBER() OVER (PARTITION BY EmployeeID ORDER BY Date_work) 
        - DATEDIFF(DAY, '2000-01-01', Date_work) AS streak_group
    FROM EmployeeLogs
)

SELECT 
    EmployeeID, 
    MAX(streak_count) AS longest_streak
FROM (
    SELECT 
        EmployeeID, 
        streak_group, 
        COUNT(*) AS streak_count
    FROM cte_numbered
    GROUP BY EmployeeID, streak_group
) t
GROUP BY EmployeeID;







