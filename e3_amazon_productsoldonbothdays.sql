-- Amazon Interview 

-- table has order from two days. Write a query to get products that got sold on both days and quantity sold
-- write query to get products sold on second day but not on first day

/*

CREATE TABLE Order_Tbl_e3(
 [ORDER_DAY] date,
 [ORDER_ID] varchar(10) ,
 [PRODUCT_ID] varchar(10) ,
 [QUANTITY] int ,
 [PRICE] int 
) 

INSERT INTO Order_Tbl_e3  VALUES ('2015-05-01','ODR1', 'PROD1', 5, 5)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-01','ODR2', 'PROD2', 2, 10)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-01','ODR3', 'PROD3', 10, 25)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-01','ODR4', 'PROD1', 20, 5)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-02','ODR5', 'PROD3', 5, 25)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-02','ODR6', 'PROD4', 6, 20)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-02','ODR7', 'PROD1', 2, 5)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-02','ODR8', 'PROD5', 1, 50)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-02','ODR9', 'PROD6', 2, 50)
INSERT INTO Order_Tbl_e3  VALUES ('2015-05-02','ODR10','PROD2', 4, 10)


*/

-- select * from order_tbl_e3

-- products that got sold on both days

select product_id, count(product_id) as count, count(distinct(order_day)) as days_ordered

from order_tbl_e3

group by product_id

having count(distinct(order_day)) > 1


-- product sold on day 2 but not day 1

Select product_id, order_day 
from
order_tbl_e3 where order_day = '2015-05-02'
and product_id not in (Select product_id from order_tbl_e3 where order_day = '2015-05-01')




