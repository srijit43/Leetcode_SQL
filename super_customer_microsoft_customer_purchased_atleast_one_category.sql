#Super customer who has purchased one product atleast from each available product categroy

-- Customer who has purchased atleast one product from each category of products
-- Drop table if exists MS_products
/*Create table MS_products(
prod_id int,
prod_category varchar(20),
prod_name varchar(20)
)

Insert into MS_products values (1,'Analytics','Azure Databricks')
Insert into MS_products values (2,'Analytics','Azure Stream')
Insert into MS_products values (3,'Containers','Azure Kubernetes')
Insert into MS_products values (4,'Containers','Azure Service Fabric')
Insert into MS_products values (5,'Compute','Virtual machines')
Insert into MS_products values (6,'Compute','Azure Functions')*/

/*Create table Customers_MS
(
customer_id int,
prod_id int,
amount int
)

Insert into Customers_MS values (1,1,1000)
Insert into Customers_MS values (2,2,2000)
Insert into Customers_MS values (3,1,1100)
Insert into Customers_MS values (4,1,1000)
Insert into Customers_MS values (7,3,4000)
Insert into Customers_MS values (6,4,2000)
Insert into Customers_MS values (1,5,1500)
Insert into Customers_MS values (2,5,2000)
Insert into Customers_MS values (7,6,5000)
Insert into Customers_MS values (7,1,2000)*/

-- Select * from MS_products
-- Select * from Customers_MS

-- We should have result as customer_id 7 ( has purchased 1 product from each category)

-- Solution

-- step 1 ( which column to join)

with cte as(
Select c.*, p.prod_category
from customers_ms as c
left join
ms_products as p
on c.prod_id = p.prod_id)

select customer_id
from cte
group by  customer_id
having count(distinct(prod_category)) = (Select count(distinct(prod_category)) from ms_products)




