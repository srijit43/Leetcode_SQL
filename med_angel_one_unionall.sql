-- Angel One Data Science Interview

/*
CREATE TABLE angel_tickets (
    airline_number VARCHAR(10),
    origin VARCHAR(3),
    destination VARCHAR(3),
    oneway_round CHAR(1),
    ticket_count INT
);


INSERT INTO angel_tickets (airline_number, origin, destination, oneway_round, ticket_count)
VALUES
    ('DEF456', 'BOM', 'DEL', 'O', 150),
    ('GHI789', 'DEL', 'BOM', 'R', 50),
    ('JKL012', 'BOM', 'DEL', 'R', 75),
    ('MNO345', 'DEL', 'NYC', 'O', 200),
    ('PQR678', 'NYC', 'DEL', 'O', 180),
    ('STU901', 'NYC', 'DEL', 'R', 60),
    ('ABC123', 'DEL', 'BOM', 'O', 100),
    ('VWX234', 'DEL', 'NYC', 'R', 90);
*/

-- Find the busiest route
-- select * from angel_tickets

Select origin,destination,sum(ticket_count)
from
angel_tickets
group by origin,destination

-- we need to resolve the round trip so we do a union all with the same just flip source, dest and take only R

with flight_cte as(
Select origin,destination,oneway_round,ticket_count
from
angel_tickets
UNION ALL
SELECT destination,origin,oneway_round,ticket_count
FROM
angel_tickets
WHERE oneway_round = 'R')

Select origin,destination, sum(ticket_count) as tc
from 
flight_cte
group by origin,destination
order by sum(ticket_count) desc