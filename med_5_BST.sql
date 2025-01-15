-- SQL Medium
-- Find a BST

/*
Enter your query here.
*/

select N,
       case when P is null then 'Root'
            when (select count(*) from BST where P = B.N) > 0 then  
            'Inner'
            else 'Leaf'
       end
from BST as B 
order by N
;