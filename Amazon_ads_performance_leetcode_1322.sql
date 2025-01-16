-- Ad analysis Leetcode 1332

-- Amazon ads performance

/*

Create table ads
(
ad_id int,
user_id int,
action varchar(10)
)

Insert into ads values (1,1,'clicked')
Insert into ads values (2,2,'clicked')
Insert into ads values (3,3,'viewed')
Insert into ads values (5,5,'ignored')
Insert into ads values (1,7,'ignored')
Insert into ads values (3,5,'clicked')
Insert into ads values (1,4,'viewed')
Insert into ads values (2,11,'viewed')
Insert into ads values (1,2,'clicked')
*/

-- select * FROM ADS


WITH cte AS (
    SELECT ad_id, 
           CASE 
               WHEN action IN ('clicked') THEN 1
			   WHEN action in ('viewed') THEN 0
               ELSE NULL
           END AS counter
    FROM Ads
)

SELECT ad_id, 
       ROUND(SUM(counter) * 1.0 / COUNT(counter), 2) AS rate
FROM cte
GROUP BY ad_id;