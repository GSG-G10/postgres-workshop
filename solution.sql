--Q1
SELECT * FROM authors;

--Q2
SELECT authors.first_name , authors.surname FROM authors;

--Q3
SELECT authors.id , first_name , surname FROM authors ORDER BY surname LIMIT 3;

--Q4
SELECT * FROM authors WHERE location != 'NULL' ;

--Q5
SELECT * FROM authors WHERE location != 'Nazareth' OR location IS NULL;

--Q6
SELECT * FROM authors where lower(surname) like lower ('%Wistle%') ;

--Q7
SELECT publishers.name FROM publishers INNER JOIN books ON books.publisher_id = publishers.id WHERE books.name='Python Made Easy';

--Q8
SELECT publishers.name FROM publishers INNER JOIN books ON books.publisher_id = publishers.id WHERE publishers.name='No Starch Press';

--Q9
SELECT publishers.name ,books.name FROM publishers INNER JOIN books ON books.publisher_id = publishers.id WHERE publishers.name='No Starch Press';

--Q10
-- SELECT books.name, first_name, surname FROM authors INNER JOIN book_authors INNER JOIN books ON book_id = books.id  ON author_id = authors.id;

-- SELECT name FROM books WHERE books.id IN (SELECT book_authors.book_id FROM book_authors INNER JOIN authors ON book_id , authors.id = author_id )

