-- two input tables

-- DDL

/*DDL:
create table products_meesho
(
product_id varchar(20) ,
cost int
);
insert into products_meesho values ('P1',200),('P2',300),('P3',500),('P4',800);

create table customer_budget
(
customer_id int,
budget int
);

insert into customer_budget values (100,400),(200,800),(300,1500);*/

Select * from products_meesho;
Select * from customer_budget;

-- How many products can customer buy

with running_cost as (
select *,
sum(cost) over(order by cost asc) as running_cost
from products_meesho)

Select  
customer_id , budget, count(1) as products, string_agg(product_id,',') as list_of_products
from customer_budget as cb
left join
running_cost as r
on 
r.running_cost < cb.budget
group by customer_id,budget

