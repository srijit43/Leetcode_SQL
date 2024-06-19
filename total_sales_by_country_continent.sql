-- We have continent and countries and sales. Display continent, country with highest sales and sales amount(total)

Create Table SalesInfo(
Continents varchar(30),
Country varchar(30),
Sales Bigint
)

Insert into SalesInfo Values('Asia','India',50000)
Insert into SalesInfo Values('Asia','India',70000)
Insert into SalesInfo Values('Asia','India',60000)
Insert into SalesInfo Values('Asia','Japan',10000)
Insert into SalesInfo Values('Asia','Japan',20000)
Insert into SalesInfo Values('Asia','Japan',40000)
Insert into SalesInfo Values('Asia','Thailand',20000)
Insert into SalesInfo Values('Asia','Thailand',30000)
Insert into SalesInfo Values('Asia','Thailand',40000)
Insert into SalesInfo Values('Europe','Denmark',40000)
Insert into SalesInfo Values('Europe','Denmark',60000)
Insert into SalesInfo Values('Europe','Denmark',10000)
Insert into SalesInfo Values('Europe','France',60000)
Insert into SalesInfo Values('Europe','France',30000)
Insert into SalesInfo Values('Europe','France',40000)

Select * from SalesInfo

-- Write the SQL query solution

With CTE_TS as
(
Select Continents,Country, SUM(Sales) as Total_sales
from SalesInfo
group by Continents, Country
),
CTE_Rnk AS
(
Select Continents, Country,Total_sales, DENSE_RANK() over(partition by Continents order by Total_sales desc) as DR
from CTE_TS
)
Select Continents, Country, Total_sales from CTE_Rnk where DR=1