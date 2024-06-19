Create Table Inventory(
ProdName Varchar(20),
ProductCode Varchar(15),
Quantity int,
InventoryDate Date)

-- INSERT Scripts:

Insert Into Inventory values('Keyboard','K1001',20,'2020-03-01');
Insert Into Inventory values('Keyboard','K1001',30,'2020-03-02');
Insert Into Inventory values('Keyboard','K1001',10,'2020-03-03');
Insert Into Inventory values('Keyboard','K1001',40,'2020-03-04');
Insert Into Inventory values('Laptop','L1002',100,'2020-03-01');
Insert Into Inventory values('Laptop','L1002',60,'2020-03-02');
Insert Into Inventory values('Laptop','L1002',40,'2020-03-03');
Insert Into Inventory values('Monitor','M5005',30,'2020-03-01');
Insert Into Inventory values('Monitor','M5005',20,'2020-03-02');

Select * from Inventory

Select *,
sum(quantity) over (partition by productcode order by Inventorydate) as cmltv_freq
from Inventory