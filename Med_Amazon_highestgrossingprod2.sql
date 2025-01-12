-- Amazon medium
/*
Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

*/


with cte1 as(
select 
product, category, (sum(spend)) as net_spend,
rank() over(partition by category order by sum(spend) desc) as r
FROM
product_spend
WHERE CAST(transaction_date AS TEXT) LIKE '%2022%'
group by product, category
)

Select category,product, net_spend from cte1 where r<=2

