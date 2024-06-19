-- In a trade stock table , find all pairs of stocks that have taken place in matter of 10secs
-- and with a price difference>10%

Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)

-- Select * from trade_tbl

With Trade_CTE as(
Select TRADE_ID,trade_timestamp,Trade_Stock,Quantity,Price
from Trade_tbl
)
Select A.Trade_ID as First_trade,
B.TRADE_ID as Second_trade,
A.Trade_Timestamp,
FLOOR(ABS(((B.Price-A.price)/A.price)*100)) as Price_diff
from Trade_CTE as A
inner join
Trade_CTE AS B
on a.TRADE_ID < b.TRADE_ID
where DATEDIFF(Second,B.Trade_Timestamp,A.Trade_Timestamp)<10
and ABS(((B.Price-A.price)/A.price)*100)>=10
order by 1