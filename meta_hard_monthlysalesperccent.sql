/*CREATE TABLE early_sales_meta ( invoicedate DATETIME, invoiceno BIGINT, quantity BIGINT, stockcode NVARCHAR(50), unitprice FLOAT);

INSERT INTO early_sales_meta (invoicedate, invoiceno, quantity, stockcode, unitprice) VALUES ('2023-01-01 10:00:00', 1001, 5, 'A001', 20.0), ('2023-01-01 15:30:00', 1002, 3, 'A002', 30.0), ('2023-01-02 09:00:00', 1003, 10, 'A003', 15.0), ('2023-01-02 11:00:00', 1004, 2, 'A004', 50.0), ('2023-01-08 10:30:00', 1005, 4, 'A005', 25.0), ('2023-01-08 14:45:00', 1006, 7, 'A006', 18.0), ('2023-01-15 08:00:00', 1007, 6, 'A007', 22.0), ('2023-01-15 16:00:00', 1008, 8, 'A008', 12.0), ('2023-01-22 09:30:00', 1009, 3, 'A009', 40.0), ('2023-01-22 18:00:00', 1010, 5, 'A010', 35.0), ('2023-02-01 10:00:00', 1011, 9, 'A011', 20.0), ('2023-02-01 12:00:00', 1012, 2, 'A012', 60.0), ('2023-02-05 09:30:00', 1013, 4, 'A013', 25.0), ('2023-02-05 13:00:00', 1014, 6, 'A014', 18.0), ('2023-02-12 10:00:00', 1015, 7, 'A015', 22.0), ('2023-02-12 14:00:00', 1016, 5, 'A016', 28.0);*/

Select * from early_sales_meta

/*
In your output, include the week number, percentage sales for the first day of the week, and percentage sales for the last day of the week. Both proportions should be rounded to the nearest whole number.
*/

WITH WeeklySales AS (
 SELECT DATEPART( WEEK,invoicedate) AS week_no,
 SUM(quantity * unitprice) AS total_sales,
 SUM(CASE WHEN DATEPART( WEEKDAY,invoicedate) = 1 THEN quantity * unitprice ELSE 0 END) AS sunday_sales,
 SUM(CASE WHEN DATEPART( WEEKDAY,invoicedate) = 2 THEN quantity * unitprice ELSE 0 END) AS monday_sales
 FROM early_sales_meta
 WHERE YEAR(invoicedate) = 2023 AND MONTH(invoicedate) IN (1, 2)
 GROUP BY DATEPART( WEEK,invoicedate)
)
SELECT week_no,
 ROUND(monday_sales * 100 / total_sales, 0) AS monday_percentage, 
 ROUND(sunday_sales * 100 / total_sales, 0) AS sunday_percentage
FROM WeeklySales;








