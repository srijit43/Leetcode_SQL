CREATE TABLE in_app_purchases_AWS ( created_at DATETIME, price BIGINT, product_id BIGINT, quantity BIGINT, user_id BIGINT);

INSERT INTO in_app_purchases_AWS (created_at, price, product_id, quantity, user_id) VALUES('2024-12-01 10:00:00', 500, 101, 1, 1),  ('2024-12-02 11:00:00', 700, 102, 1, 1),('2024-12-01 12:00:00', 300, 103, 1, 2), ('2024-12-03 14:00:00', 400, 103, 1, 2),('2024-12-02 09:30:00', 200, 104, 1, 3), ('2024-12-04 15:30:00', 600, 105, 2, 3),('2024-12-01 08:00:00', 800, 106, 1, 4), ('2024-12-05 18:00:00', 500, 107, 1, 4),('2024-12-06 16:00:00', 700, 108, 1, 5); 

-- Select * from in_app_purchases_AWS

/*
You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.
*/

with purchase_rank as (
select 
user_id, product_id, price, created_at,
dense_rank() over(partition by user_id order by created_at) as dr
from
in_app_purchases_AWS)


Select a.user_id
from
purchase_rank as a
join
purchase_rank as b
on a.user_id = b.user_id
and
a.dr != b.dr
and datediff(day, a.created_at,b.created_at) > 0
and a.product_id <> b.product_id

