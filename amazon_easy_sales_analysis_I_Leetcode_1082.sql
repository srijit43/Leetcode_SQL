-- Amazon easy question 

-- Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

/*

Create table prod_e2
(
pod_id int,
prod_name varchar(20),
unit_price int
)

Insert into prod_e2 values (1,'S8',12000)
Insert into prod_e2 values (2,'G4',9000)
Insert into prod_e2 values (3,'Iphone',16000)

-- Drop table sales_e2

Create table sales_e2
(
seller_id int,
prod_id int,
buyer_id int,
sale_date datetime,
quantity int
)

Insert into sales_e2 values (1,1,1,'2019-01-21',2)
Insert into sales_e2 values (1,2,2,'2019-02-21',1)
Insert into sales_e2 values (2,2,3,'2019-04-21',1)
Insert into sales_e2 values (3,3,4,'2019-06-21',2)

*/

Select * from prod_e2
Select * from sales_e2

-- Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.


with cte as (
Select s.seller_id, p.pod_id, s.quantity, p.unit_price, (s.quantity * p.unit_price) AS total_price
from
sales_e2 s
left join
prod_e2 p
on
s.prod_id = p.pod_id)

Select seller_id, sum(total_price) as total_sales
from cte
group by seller_id
order by total_sales desc

-- Write a query to find products only sold during first quarter

-- select * from sales_e2 

SELECT s.prod_id
FROM sales_e2 s
LEFT JOIN prod_e2 p
ON s.prod_id = p.pod_id
GROUP BY s.prod_id
HAVING MIN(s.sale_date) >= CAST('2019-01-01' AS DATE) AND
       MAX(s.sale_date) <= CAST('2019-03-31' AS DATE)
