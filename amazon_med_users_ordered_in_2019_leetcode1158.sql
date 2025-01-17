-- Create Users_med table
/*
CREATE TABLE Users_med (
    user_id INT,
    join_date DATE,
    favorite_brand VARCHAR(50)
);

-- Insert data into Users_med table
INSERT INTO Users_med (user_id, join_date, favorite_brand) VALUES
(1, '2018-01-01', 'Lenovo'),
(2, '2018-02-09', 'Samsung'),
(3, '2018-01-19', 'LG'),
(4, '2018-05-21', 'HP');

-- Create Orders_med table
CREATE TABLE Orders_med (
    order_id INT,
    order_date DATE,
    item_id INT,
    buyer_id INT,
    seller_id INT
);

-- Insert data into Orders_med table
INSERT INTO Orders_med (order_id, order_date, item_id, buyer_id, seller_id) VALUES
(1, '2019-08-01', 4, 1, 2),
(2, '2018-08-02', 2, 1, 3),
(3, '2019-08-03', 3, 2, 3),
(4, '2018-08-04', 1, 4, 2),
(5, '2018-08-04', 1, 3, 4),
(6, '2019-08-05', 2, 2, 4);

-- Create Items_med table
CREATE TABLE Items_med (
    item_id INT,
    item_brand VARCHAR(50)
);

-- Insert data into Items_med table
INSERT INTO Items_med (item_id, item_brand) VALUES
(1, 'Samsung'),
(2, 'Lenovo'),
(3, 'LG'),
(4, 'HP');

-- Verify the data
SELECT * FROM Users_med;
SELECT * FROM Orders_med;
SELECT * FROM Items_med;
*/

-- Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

select user_id as buyer_id, join_date, 
    sum(case when order_id is not null then 1 else 0 end) as orders_in_2019
from users_med as u
left join orders_med as o
on u.user_id = o.buyer_id 
and year(order_date) = 2019
group by user_id, join_date
order by buyer_id







