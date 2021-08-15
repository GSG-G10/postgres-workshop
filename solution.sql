-- q1
SELECT first_name, surname FROM authors;
-- q2
SELECT * FROM authors ORDER BY surname limit 3;
-- q3
SELECT * FROM authors WHERE location IS NOT NULL;
-- q4
SELECT * FROM authors WHERE  location <> 'Nazareth' OR location IS NULL;
-- q5
SELECT * FROM authors WHERE surname ilike '%wistle';
-- 2 solutions for question 6 
SELECT publishers.name FROM publishers WHERE id = (SELECT publisher_id FROM books WHERE books.name = 'Python Made Easy');
select name from publisher inner join books on publisers.id = books.publisher_id where books.name = 'python made easy';
-- q7
SELECT books.name  FROM books WHERE publisher_id = (SELECT id FROM publishers WHERE name = 'No Starch Press');
-- q8
SELECT books.name, first_name, surname FROM authors INNER JOIN book_authors INNER JOIN books ON book_id = books.id  ON author_id = authors.id;
--  q9
SELECT books.name FROM books INNER JOIN book_authors INNER JOIN authors ON authors.id = book_authors.author_id ON books.id = book_authors.book_id  WHER
 E authors.first_name = 'Ted' AND authors.surname = 'Burns';
--  q10
select a.first_name , a.surname from authors a INNER JOIN book_authors on book_authors.author_id = a.id INNER JOIN books ON book_authors.book_id = book
 s.id group by a.id having count(a.id) >2;

SELECT A.first_name, A.surname
from authors A
where 2 < (
SELECT count(B.id)
FROM books B INNER JOIN book_authors AB
ON B.id = AB.book_id
WHERE AB.author_id = A.id
) 
