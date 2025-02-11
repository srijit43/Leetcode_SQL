/*CREATE TABLE players_results ( match_date DATETIME, match_result VARCHAR(1), player_id BIGINT);

INSERT INTO players_results (match_date, match_result, player_id) VALUES ('2023-01-01', 'W', 1), ('2023-01-02', 'W', 1), ('2023-01-03', 'L', 1), ('2023-01-04', 'W', 1), ('2023-01-01', 'L', 2), ('2023-01-02', 'W', 2), ('2023-01-03', 'W', 2), ('2023-01-04', 'W', 2), ('2023-01-05', 'L', 2), ('2023-01-01', 'W', 3), ('2023-01-02', 'W', 3), ('2023-01-03', 'W', 3), ('2023-01-04', 'W', 3), ('2023-01-05', 'L', 3);*/

-- Select * from  players_results


with cte as(
select *, ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY match_date) - ROW_NUMBER() OVER(PARTITION BY player_id,match_result ORDER BY match_date) as grp from players_results),

cte1 as(
select player_id, count(*) as streak_length from cte where match_result='W'
 group by player_id, grp),
 cte2 as(
select player_id,max(streak_length) as max from cte1 group by player_id )

select player_id,cte2.max from cte2 order by max desc
