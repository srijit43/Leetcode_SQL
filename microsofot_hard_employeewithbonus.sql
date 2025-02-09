/*CREATE TABLE employee_details_ms 
(id BIGINT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), age BIGINT, sex VARCHAR(10), email VARCHAR(100), address VARCHAR(100), city VARCHAR(50), department VARCHAR(50), employee_title VARCHAR(50), manager_id BIGINT, salary BIGINT, target BIGINT, bonus BIGINT);

INSERT INTO employee_details_ms (id, first_name, last_name, age, sex, email, address, city, department, employee_title, manager_id, salary, target, bonus)VALUES (1, 'John', 'Doe', 30, 'Male', 'john.doe@example.com', '123 Elm St', 'New York', 'IT', 'Engineer', 101, 70000, 80000, 5000),(2, 'Jane', 'Smith', 28, 'Female', 'jane.smith@example.com', '456 Oak St', 'Los Angeles', 'HR', 'Manager', 102, 75000, 90000, NULL),(3, 'Alice', 'Johnson', 35, 'Female', 'alice.johnson@example.com', '789 Pine St', 'Chicago', 'Finance', 'Analyst', 103, 80000, 95000, NULL),(4, 'Bob', 'Brown', 40, 'Male', 'bob.brown@example.com', '321 Maple St', 'Boston', 'IT', 'Director', 104, 120000, 130000, NULL),(5, 'Charlie', 'Davis', 25, 'Male', 'charlie.davis@example.com', '654 Cedar St', 'Seattle', 'Marketing', 'Specialist', 105, 50000, 60000, NULL);

CREATE TABLE bonus_ms (worker_ref_id BIGINT, bonus_amount BIGINT, bonus_date DATETIME);

INSERT INTO bonus_ms (worker_ref_id, bonus_amount, bonus_date) VALUES (1, 5000, '2024-01-15'),(1, 3000, '2024-02-20'),(3, 2000, '2024-03-10'),(5, 1000, '2024-04-05');*/

Select * from employee_details_ms
Select * from bonus_ms

/*
	Find the number of employees who received the bonus and who didn't. Bonus values in employee table are corrupted so you should use values from the bonus table. Be aware of the fact that employee can receive more than one bonus. Output value inside has_bonus column (1 if they had bonus, 0 if not) along with the corresponding number of employees for each.
*/

Select 
case when b.worker_ref_id is not null then 1 else 0 end as has_bonus,
count(distinct e.id) as employee_count
from employee_details_ms as e
left join
bonus_ms as b
on
e.id = b.worker_ref_id

group by 
case when b.worker_ref_id is not null then 1 else 0
END
