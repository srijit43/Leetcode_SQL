create table OrderStatus
(
Quote_Id varchar(5),
Order_Id varchar(5),
Order_Status Varchar(20)
)

Insert into OrderStatus Values ('A','A1','Delivered') 
Insert into OrderStatus Values ('A','A2','Delivered') 
Insert into OrderStatus Values ('A','A3','Delivered') 
Insert into OrderStatus Values ('B','B1','Submitted') 
Insert into OrderStatus Values ('B','B2','Delivered') 
Insert into OrderStatus Values ('B','B3','Created') 
Insert into OrderStatus Values ('C','C1','Submitted') 
Insert into OrderStatus Values ('C','C2','Created') 
Insert into OrderStatus Values ('C','C3','Submitted') 
Insert into OrderStatus Values ('D','D1','Created')

Select * from OrderStatus

With CTE_Order as
(
Select distinct Quote_Id,Order_Status
from OrderStatus
),
CTE_list AS
(
Select Quote_ID,STRING_AGG(Order_Status,',') AS List_Status from CTE_order
group by Quote_ID
)

Select Quote_ID, Case when CHARINDEX('Delivered',List_Status) = 1 and CHARINDEX(',',List_Status)=0 then 'Completed'
                      when CHARINDEX('Delivered',List_Status) > 1 and CHARINDEX(',',List_Status)>0 then 'In Delivery'
					  when CHARINDEX('Submitted',List_Status) > 1 and CHARINDEX(',',List_Status)>0 and CHARINDEX('Delivered',List_Status) = 0 then 'Awaiting for Submission'
					  else 'Awaiting for Entry' end as Quote_Status from CTE_list