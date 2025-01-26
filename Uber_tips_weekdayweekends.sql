--CREATE TABLE Transactions (
    
--    TransactionID INT,
--    TransactionDate DATE,
--    TotalAmount DECIMAL(10,2),
--    TipAmount DECIMAL(10,2)
--);

--INSERT INTO Transactions (TransactionID, TransactionDate, TotalAmount, TipAmount) VALUES
--(1, '2024-01-01', 50.00, 5.00),
--(2, '2024-01-02', 30.00, 3.00),
--(3, '2024-01-03', 100.00, 10.00),
--(4, '2024-01-04', 40.00, 4.00),
--(5, '2024-01-05', 60.00, 6.00),
--(6, '2024-01-06', 80.00, 16.00),
--(7, '2024-01-07', 90.00, 18.00),
--(8, '2024-01-08', 55.00, 5.50),
--(9, '2024-01-09', 75.00, 7.50),
--(10, '2024-01-10', 95.00, 9.50),
--(11, '2024-01-11', 110.00, 11.00),
--(12, '2024-01-12', 85.00, 8.50),
--(13, '2024-01-13', 120.00, 24.00),
--(14, '2024-01-14', 130.00, 26.00),
--(15, '2024-01-15', 45.00, 4.50),
--(16, '2024-01-16', 70.00, 7.00),
--(17, '2024-01-17', 150.00, 15.00),
--(18, '2024-01-18', 35.00, 3.50),
--(19, '2024-01-19', 200.00, 20.00),
--(20, '2024-01-20', 90.00, 18.00),
--(21, '2024-01-21', 95.00, 19.00),
--(22, '2024-01-22', 65.00, 6.50),
--(23, '2024-01-23', 140.00, 14.00),
--(24, '2024-01-24', 130.00, 13.00),
--(25, '2024-01-25', 85.00, 8.50),
--(26, '2024-01-26', 95.00, 9.50),
--(27, '2024-01-27', 110.00, 22.00),
--(28, '2024-01-28', 125.00, 25.00);

-- Select * from transactions

-- step 1: identify which is a weekday , which is a weekend
-- step 2: sum(tip amount) of weekend/total(weekend) and same for weekday

with week_cte as(
select transactionid,
transactionDate,
case when DATEPART(weekday,transactiondate) = 1 or DATEPART(weekday,transactiondate)=7 then 'weekend' else
'weekday' end as week_part,
totalamount,
tipamount
from
transactions),

cte_totals as(
Select 
week_part,
sum(case when week_part = 'weekend' then totalamount else 0 end) as weekend_total,
sum(case when week_part = 'weekday' then totalamount else 0 end) as weekday_total,
sum(case when week_part = 'weekend' then tipamount else 0 end) as weekend_tip,
sum(case when week_part = 'weekday' then tipamount else 0 end) as weekday_tip
from week_cte
group by week_part)

Select 
100.0 * (sum(weekday_tip) / sum(weekday_total)) as weekday_tip_pc,
100.0 * (sum(weekend_tip) / sum(weekend_total)) as weekend_tip_pc
from cte_totals