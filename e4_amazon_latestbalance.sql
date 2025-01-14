-- Amazon interview get latest balance. ( most recent )

/*

create table transaction_table (
Account_num int, transaction_time datetime, Trans_id int identity(1001, 1),
balance int)

insert into transaction_table( account_Num, Transaction_time, Balance)
values 
(550, '2020-05-12 05:29:44.120', 2000),
(550, '2020-05-15 10:29:25.630', 8000),
(460, '2020-03-15 11:29:23.620', 9000),
(460, '2020-04-30 11:29:57.320',7000),
(460, '2020-04-30 12:32:44.233', 5000),
(640, '2020-02-18 06:29:34.420', 5000),
(640, '2020-02-18 06:29:37.120', 9000);


*/

-- select * from transaction_table

-- give me the latest balance. Find maximum transaction time ( date column) 

SELECT a.account_Num, b.transaction_time, a.trans_id, a.balance
FROM transaction_table AS a
INNER JOIN (
    SELECT account_Num, MAX(transaction_time) AS transaction_time
    FROM transaction_table
    GROUP BY account_Num
) AS b
ON a.account_Num = b.account_Num AND a.transaction_time = b.transaction_time;









