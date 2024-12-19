-- You work for a multinational company that wants to calculate total sales across all their countries they do business in.
-- You have 2 tables, one is a record of sales for all countries and currencies the company deals with, and the other holds currency
-- exchange rate information. Calculate the total sales, per quarter, for the first 2 quarters in 2020, and report the sales in USD currency.

/*

CREATE TABLE sf_exchange_rate_gms 
( date DATE, exchange_rate FLOAT, source_currency VARCHAR(10), target_currency VARCHAR(10));

INSERT INTO sf_exchange_rate_gms  (date, exchange_rate, source_currency, target_currency) 
VALUES ('2020-01-15', 1.1, 'EUR', 'USD'), 
('2020-01-15', 1.3, 'GBP', 'USD'), 
('2020-02-05', 1.2, 'EUR', 'USD'), 
('2020-02-05', 1.35, 'GBP', 'USD'),
('2020-03-25', 1.15, 'EUR', 'USD'), 
('2020-03-25', 1.4, 'GBP', 'USD'), 
('2020-04-15', 1.2, 'EUR', 'USD'), 
('2020-04-15', 1.45, 'GBP', 'USD'), 
('2020-05-10', 1.1, 'EUR', 'USD'), 
('2020-05-10', 1.3, 'GBP', 'USD'), 
('2020-06-05', 1.05, 'EUR', 'USD'),
('2020-06-05', 1.25, 'GBP', 'USD');

CREATE TABLE sf_sales_amount_gms  ( currency VARCHAR(10), sales_amount BIGINT, sales_date DATE);

INSERT INTO sf_sales_amount_gms  
(currency, sales_amount, sales_date) 
VALUES ('USD', 1000, '2020-01-15'), 
('EUR', 2000, '2020-01-20'), 
('GBP', 1500, '2020-02-05'),
('USD', 2500, '2020-02-10'), 
('EUR', 1800, '2020-03-25'),
('GBP', 2200, '2020-03-30'),
('USD', 3000, '2020-04-15'), 
('EUR', 1700, '2020-04-20'), 
('GBP', 2000, '2020-05-10'),
('USD', 3500, '2020-05-25'), 
('EUR', 1900, '2020-06-05'), 
('GBP', 2100, '2020-06-10');

*/
/*
Select * from sf_exchange_rate_gms
Select * from sf_sales_amount_gms
*/

Select 
datepart(quarter, sales_date) as sales_quarter,
sum(sa.sales_amount * er.exchange_rate) as sales_USD
from 
sf_sales_amount_gms as sa
join
sf_exchange_rate_gms as er
on 
sa.currency = er.source_currency
and er.target_currency = 'USD'
and cast(sa.sales_date as date) = cast(er.date as date)
where
sa.sales_date > = '2020-01-01' and sa.sales_date < '2020-07-01'
group by datepart(quarter, sales_date);








