#Challenge 1

SELECT 
au.au_id as 'AUTHOR ID', 
au.au_lname AS 'LAST NAME',
au.au_fname AS 'FIRST NAME', 
t.title AS 'TITLE',
pub.pub_name AS 'PUBLISHER'

FROM authors au

INNER JOIN titleauthor ta ON au.au_id=ta.au_id
INNER JOIN titles t ON t.title_id=ta.title_id
INNER JOIN publishers pub ON pub.pub_id=t.pub_id

ORDER BY au.au_id;

#Challenge 2

SELECT 
au.au_id AS 'AUTHOR ID',
au.au_lname AS 'LAST NAME', 
au.au_fname AS 'FIRST NAME', 
pub.pub_name AS 'PUBLISHER',
COUNT(t.title_id) AS 'TITLE COUNT'

FROM authors au
INNER JOIN titleauthor ta ON au.au_id=ta.au_id
INNER JOIN titles t ON ta.title_id=t.title_id
INNER JOIN publishers pub ON t.pub_id=pub.pub_id

GROUP BY au.au_id, pub.pub_name
ORDER BY au.au_id DESC, pub.pub_name DESC;

# Challenge 3

SELECT 
au.au_id AS 'AUTHOR ID',
au.au_lname AS 'LAST NAME', 
au.au_fname AS 'FIRST NAME', 
sum(s.qty) AS 'TOTAL'

FROM authors au
INNER JOIN titleauthor ta ON au.au_id=ta.au_id
INNER JOIN sales s ON ta.title_id=s.title_id

GROUP BY au.au_id
ORDER BY sum(s.qty) DESC
LIMIT 3;

#Challenge 4

# PREGUNTA PORFA!! ¿POR QUE NO PUEDO HACER INNER JOIN CON TITLE AUTHOR (las dos tablas tienen mismo numero de autores asi q no me dejaría ninguno fuera...)Y LEFT JOIN CON SALES EN LUGAR DE LEFT JOIN PARA LAS DOS TABLAS??

SELECT 
au.au_id AS 'AUTHOR ID',
au.au_lname AS 'LAST NAME', 
au.au_fname AS 'FIRST NAME', 
IFNULL(sum(s.qty),0) 'TOTAL'

FROM authors au
LEFT JOIN titleauthor ta ON au.au_id=ta.au_id
LEFT JOIN sales s ON ta.title_id=s.title_id

GROUP BY au.au_id
ORDER BY sum(s.qty) DESC;




