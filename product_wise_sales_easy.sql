/*create table products_cc (pid int, pname varchar(50), price int)
insert into products_cc values (1, 'A', 1000),(2, 'B', 400),(3, 'C', 500);

create table transcations_cc (pid int, sold_date DATE, qty int, amount int)
insert into transcations_cc values (1, '2024-02-01', 2, 2000),(1, '2024-03-01', 4, 4000),
(1, '2024-03-15', 2, 2000),(3, '2024-04-24', 3, 1500),(3, '2024-05-16', 5, 2500);*/

-- Find product wise total sales and also those products with no sales

-- Select * from products_cc
-- Select * from transcations_cc


Select p.pid,p.pname, year(t.sold_date) as sold_year, month(t.sold_date) as sold_month, isnull(sum(t.amount),0) as total_sales
from products_cc as p
left join
transcations_cc as t
on p.pid = t.pid
group by p.pid,p.pname, year(t.sold_date) , month(t.sold_date)

