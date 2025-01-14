-- Amazon interview practice 1

/*
CREATE TABLE [dbo].[Transaction_Tbl](
 [CustID] [int] ,
 [TranID] [int] ,
 [TranAmt] [float] ,
 [TranDate] [date] 
) 

INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20001, 10000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20002, 15000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20003, 80000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20004, 20000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30001, 7000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30002, 15000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30003, 22000, CAST('2020-04-25' AS Date))
*/

-- select * from [dbo].[Transaction_Tbl]

-- Transatcion_tbl Table has four columns CustID, TranID, TranAmt, and  TranDate. User has to display all these fields 
-- along with maximum TranAmt for each CustID and ratio of TranAmt and maximum TranAmt for each transaction.

with cte1 as
(Select CustID,tranid,tranamt  from [dbo].[Transaction_Tbl]),
cte2 as
(select custid, max(tranamt) as maxtran from [dbo].[Transaction_Tbl]
group by custid)

Select a.custid, a.tranamt, b.maxtran, (a.tranamt/b.maxtran) as ratio
from
cte1 as a
inner join
cte2 as b
on
a.custid = b.custid


