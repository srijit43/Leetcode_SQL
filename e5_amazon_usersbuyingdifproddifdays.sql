-- Amazon Question 
-- Find users who bought different product on different dates

/*
create table purchase_history
(userid int
,productid int
,purchasedate date
);
SET DATEFORMAT dmy;
insert into purchase_history values
(1,1,'23-01-2012')
,(1,2,'23-01-2012')
,(1,3,'25-01-2012')
,(2,1,'23-01-2012')
,(2,2,'23-01-2012')
,(2,2,'25-01-2012')
,(2,4,'25-01-2012')
,(3,4,'23-01-2012')
,(3,1,'23-01-2012')
,(4,1,'23-01-2012')
,(4,2,'25-01-2012')
;
*/

-- select * from purchase_history

-- we need users who bought on two days and whose product count matches their distinct product count

with cte as(
Select 
userid, count(distinct(purchasedate)) as dates, count(productid) as product_count,
count(distinct(productid)) as distinct_product
from
purchase_history
group by userid)

Select userid from cte where dates>1 and product_count = distinct_product








