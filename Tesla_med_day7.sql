-- Tesla medium question

/*
You are given a table of product launches by company by year. Write a query to count the net 
difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. 
Output the name of the companies and a net difference of net products 
released for 2020 compared to the previous year.

By solving this, you'll learn how to handle aggregation function. Give it a try!

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:
CREATE TABLE car_launches(year int, company_name varchar(15), product_name varchar(30));

INSERT INTO car_launches VALUES
(2019,'Toyota','Avalon'),(2019,'Toyota','Camry'),
(2020,'Toyota','Corolla'),(2019,'Honda','Accord'),
(2019,'Honda','Passport'),(2019,'Honda','CR-V'),
(2020,'Honda','Pilot'),(2019,'Honda','Civic'),
(2020,'Chevrolet','Trailblazer'),(2020,'Chevrolet','Trax'),
(2019,'Chevrolet','Traverse'),(2020,'Chevrolet','Blazer'),
(2019,'Ford','Figo'),(2020,'Ford','Aspire'),
(2019,'Ford','Endeavour'),(2020,'Jeep','Wrangler')
*/

-- Select * from car_launches

with cte as
(
Select company_name,
SUM(case when year = 2020 then 1 else 0 end) as prod_2020,
SUM(case when year = 2019 then 1 else 0 end) as prod_2019
from car_launches
where year in (2019,2020)
group by company_name)

Select company_name,
(prod_2020 - prod_2019) as net_diff
from cte
order by net_diff desc




