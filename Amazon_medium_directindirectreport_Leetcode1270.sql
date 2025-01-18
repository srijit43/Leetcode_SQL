-- Amazon Medium
/*
-- Create the Employees table
CREATE TABLE Employees_amz2 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

-- Insert data into the Employees table
INSERT INTO Employees_amz2 (employee_id, employee_name, manager_id)
VALUES
    (1, 'Boss', 1),
    (3, 'Alice', 3),
    (2, 'Bob', 1),
    (4, 'Daniel', 2),
    (7, 'Luis', 4),
    (8, 'Jhon', 3),
    (9, 'Angela', 8),
    (77, 'Robert', 1);
*/

-- Select * from Employees_amz2

-- Write an SQL query to find employee_id of all employees that directly or indirectly report 
-- their work to the head of the company.

-- The indirect relation between managers will not exceed 3 managers as the company is small.


WITH RecursiveReports AS (
    -- Base case: Employees who directly report to the head of the company (employee_id = 1)
    SELECT 
        e.employee_id,
        e.employee_name,
        e.manager_id
    FROM 
        Employees_amz2 AS e
    WHERE 
        e.manager_id = 1
	and
		e.employee_id != e.manager_id

    UNION ALL

    -- Recursive case: Employees who report to those who directly or indirectly report to the head
    SELECT 
        e.employee_id,
        e.employee_name,
        e.manager_id
    FROM 
        Employees_amz2 AS e
    INNER JOIN 
        RecursiveReports AS r
    ON 
        e.manager_id = r.employee_id
)
-- Select the result
SELECT DISTINCT 
    employee_id,
    employee_name
FROM 
    RecursiveReports
	option (maxrecursion 2000)
	;

