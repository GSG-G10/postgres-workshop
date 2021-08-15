-- 1-
SELECT first_name, surname FROM authors;

-- 2- 
SELECT * FROM authors ORDER BY surname LIMIT 3;

-- 3
SELECT * from authors WHERE location IS NOT NULL;

-- 4
SELECT * from authors WHERE location != 'Nazareth' OR location IS NULL; 

-- 5
 SELECT * FROM authors WHERE surname LIKE '%Wistle%'; 
 SELECT * FROM authors WHERE lower(surname) LIKE '%wistle%';
 SELECT * FROM authors WHERE upper(surname) LIKE '%WISTLE%';

-- 6
SELECT publishers.name FROM publishers INNER JOIN books ON publishers.id = books.publisher_id WHERE books.name = 'Python Made Easy'; 

-- 7
SELECT publishers.name, books.name FROM publishers INNER JOIN books ON publishers.id = books.publisher_id WHERE publishers.name = 'No Starch Press';    

-- 8
SELECT books.name, authors.first_name, authors.surname FROM books INNER JOIN book_authors ON books.id = book_authors.book_id INNER JOIN authors ON book_authors.author_id = authors.id ORDER BY books.name;

-- 9
SELECT books.name FROM books INNER JOIN book_authors ON books.id = book_authors.book_id INNER JOIN authors ON book_authors.author_id = authors.id WHERE authors.first_name = 'Ted';

-- 10
SELECT authors.first_name, authors.surname 
FROM authors                         
INNER JOIN book_authors 
ON authors.id = book_authors.author_id 
GROUP BY authors.surname, authors.first_name 
HAVING COUNT(book_authors.author_id) > 2;

-- 11
SELECT publishers.name, COUNT(books.publisher_id) 
FROM publishers                         
INNER JOIN books
ON books.publisher_id = publishers.id 
GROUP BY publishers.name ORDER BY COUNT(books.publisher_id) DESC;

-- 12
SELECT books.name, COUNT(book_authors.book_id) 
FROM books                        
INNER JOIN book_authors
ON books.id = book_authors.book_id WHERE books.release_date > '01-Jan-96' 
GROUP BY books.name ORDER BY COUNT(book_authors.book_id) DESC;