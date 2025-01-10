-- Your team at JPMorgan Chase is preparing to launch a new credit card, and to gain some insights, you're analyzing how many credit cards were issued each month.

-- Write a query that outputs the name of each credit card and the difference in the number of issued cards between the month with 
-- the highest issuance cards and the lowest issuance. Arrange the results based on the largest disparity.

SELECT a.card_name,max(a.issued_amount) - min(b.issued_amount) as difference
from monthly_cards_issued as a 
inner JOIN
monthly_cards_issued as b 
on a.card_name = b.card_name
group by a.card_name
order by max(a.issued_amount) - min(b.issued_amount) desc;