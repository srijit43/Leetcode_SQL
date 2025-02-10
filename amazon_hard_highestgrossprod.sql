/*CREATE TABLE online_retails (country VARCHAR(10),customerid FLOAT,description VARCHAR(10),invoicedate DATETIME,invoiceno VARCHAR(10),quantity BIGINT,stockcode VARCHAR(10),unitprice FLOAT);

INSERT INTO online_retails (country, customerid, description, invoicedate, invoiceno, quantity, stockcode, unitprice) VALUES ('USA', 12345, 'Product A', '2025-01-01 12:00:00', 'INV001', 5, 'A123', 10.50), ('UK', 67890, 'Product B', '2025-01-02 14:30:00', 'INV002', 2, 'B456', 20.75), ('Canada', 11223, 'Product C', '2025-01-03 16:45:00', 'INV003', 10, 'C789', 15.00);*/

Select * from online_retails

/*
Find the best selling item for each month (no need to separate months by year) where the biggest total invoice was paid. The best selling item is calculated using the formula (unitprice * quantity). Output the month, the description of the item along with the amount paid.
*/

WITH MonthlySales AS (
 SELECT 
 MONTH(invoicedate) AS sale_month,
 description,
 SUM(unitprice * quantity) AS total_amount
 FROM online_retails
 GROUP BY MONTH(invoicedate), description
),
RankedSales AS (
 SELECT 
 sale_month,
 description,
 total_amount,
 RANK() OVER (PARTITION BY sale_month ORDER BY total_amount DESC) AS rank_by_month
 FROM MonthlySales
)
SELECT 
 sale_month,
 description,
 total_amount AS highest_invoice_amount
FROM RankedSales
WHERE rank_by_month = 1;