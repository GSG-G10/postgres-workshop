BEGIN; 
SELECT first_name, surname FROM authors;

SELECT * FROM authors ORDER BY surname LIMIT 3 

SELECT * FROM authors WHERE location IS NOT NULL

SELECT * FROM authors WHERE location != 'Nazareth' OR location IS NULL; 

SELECT * FROM authors WHERE surname LIKE '%Wistle%' OR surname LIKE '%wistle%'


SELECT publishers.name FROM books JOIN publishers ON publishers.id = books.publisher_id WHERE books.name = 'Python Made Easy';  

SELECT publishers.name ,books.name FROM books JOIN publishers ON publishers.id = books.publisher_id WHERE publishers.name = 'No Starch Press';

SELECT books.name, authors.first_name,authors.surname FROM books JOIN book_authors ON book_authors.book_id = books.id JOIN authors ON authors.id = book_authors.author_id 


SELECT books.name FROM books JOIN book_authors ON book_authors.book_id = books.id JOIN authors ON authors.id = book_authors.author_id WHERE authors.surname = 'Burns'; 


SELECT a.first_name , a.surname , books.name from authors a inner join book_authors on book_authors.author_id = a.id inner join books ON books.id = book_authors.book_id group by a.id having count(a.id) >= 3 
 
 
 
 
 COMMIT;