-- Let us create table and insert data
/*CREATE TABLE employees_tbl (eid INT, ename VARCHAR(50), gender VARCHAR(10))

INSERT INTO employees_tbl VALUES (1, 'John Doe', 'Male'),(2, 'Jane Smith', 'Female'),
(3, 'Michael Johnson', 'Male'),(4, 'Emily Davis', 'Female'),(5, 'Robert Brown', 'Male'),
(6, 'Sophia Wilson', 'Female'),(7, 'David Lee', 'Male'),(8, 'Emma White', 'Female'),
(9, 'James Taylor', 'Male'),(10, 'William Clark', 'Male')*/

-- Find male and female percentage

Select * from employees_tbl

Select gender, count(gender) as total, 
100 * count(gender) / (select count(*) from employees_tbl) as gender_percentage
from employees_tbl
group by gender


