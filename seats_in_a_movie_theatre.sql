-- Write seats in a movie theatre

With CTE_alphabet as
(
Select CHAR(ASCII('A')) as letter
union all
Select CHAR(ASCII(letter)+1) from CTE_alphabet where letter<>'L'
),
CTE_Seat as
(
Select 1 as Nmbr
union all
Select Nmbr+1 from CTE_Seat where Nmbr<10
),
CTE_final as
(
Select letter,letter+trim(Str(Nmbr)) as seat_no from CTE_alphabet cross join cte_seat
)
Select letter as row,String_agg(Seat_no,',') within group(order by letter) as seats from cte_final
group by letter