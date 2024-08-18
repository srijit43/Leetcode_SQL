-- Query quality and percentage
# Write your MySQL query statement below
-- Dog, quality, poor_query_percentage

SELECT query_name, 
    ROUND((SUM(rating/position)/COUNT(query_name)),2) AS quality,            
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100,2) AS poor_query_percentage 
FROM Queries 
where query_name is not null
GROUP BY query_name