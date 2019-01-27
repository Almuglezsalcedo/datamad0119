#Challenge 1 Step 1

SELECT
t.title_id, 
au.au_id, 
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 sales_royalty
from titles t
inner join titleauthor ta on ta.title_id = t.title_id
inner join authors au on ta.au_id = au.au_id
inner join sales s on s.title_id=t.title_id;

#Challenge 1 Step 2

SELECT  
title_id,
au_id, 
SUM(sales_royalty) 'aggregated_royalty'
FROM
(SELECT
t.title_id, 
au.au_id, 
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 sales_royalty
from titles t
inner join titleauthor ta on ta.title_id = t.title_id
inner join authors au on ta.au_id = au.au_id
inner join sales s on s.title_id=t.title_id) as s1

GROUP BY title_id, au_id;

#Challenge 1 Step 3

SELECT  DISTINCT(au_id), aggregated_royalty 'Profit'
FROM
(SELECT  
title_id,
au_id, 
SUM(sales_royalty) 'aggregated_royalty'
FROM
(SELECT
t.title_id, 
au.au_id, 
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 sales_royalty
from titles t
inner join titleauthor ta on ta.title_id = t.title_id
inner join authors au on ta.au_id = au.au_id
inner join sales s on s.title_id=t.title_id) as s1

GROUP BY title_id, au_id) as s2


ORDER BY aggregated_royalty DESC
LIMIT 3;

#Challenge 2 Step 1

CREATE TEMPORARY TABLE sum1
SELECT
t.title_id, 
au.au_id, 
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 sales_royalty
from titles t
inner join titleauthor ta on ta.title_id = t.title_id
inner join authors au on ta.au_id = au.au_id
inner join sales s on s.title_id=t.title_id;

#Challenge 2 Step 2

CREATE TEMPORARY TABLE sum2
SELECT  
title_id,
au_id, 
SUM(sales_royalty) 'aggregated_royalty'
FROM sum1
GROUP BY title_id, au_id;

#Challenge 2 Step 3

SELECT  DISTINCT(au_id), aggregated_royalty 'Profit'
FROM sum2

ORDER BY aggregated_royalty DESC
LIMIT 3;

#Challenge 3

CREATE TABLE most_profiting_authors
SELECT  DISTINCT(au_id), aggregated_royalty 'Profit'
FROM sum2
ORDER BY aggregated_royalty DESC
LIMIT 3;