-- Write a fibonacci series in SQL

with Fibonacci as(
Select 0 as FirstN,1 as SecondN,1 as Step -- anchor query
union all
Select SecondN,SecondN+FirstN,Step+1
From Fibonacci
where Step<10
)

-- Select * from Fibonacci

Select STRING_AGG(FirstN,',') within group(order by FirstN) as Fibonacci_nbrs from Fibonacci