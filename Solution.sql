/*1-*/
SELECT first_name,
    surname
FROM authors;
/*2-*/
SELECT *
FROM authors
ORDER BY surname
LIMIT 3;
/*3-*/
SELECT *
FROM authors
WHERE location IS NOT NULL;
/*4-*/
SELECT *
FROM authors
WHERE location != 'Nazareth'
    OR location IS NULL;
/*5-*/
SELECT *
FROM authors
WHERE surname LIKE '%Wistle';
/*6-*/
SELECT books.name,
    publishers.name
FROM publishers
    INNER JOIN books ON books.publisher_id = publishers.id
WHERE books.name = 'Python Made Easy';
/*7-*/
SELECT publishers.name,
    books.name
FROM books
    INNER JOIN publishers ON publishers.id = books.publisher_id
WHERE publishers.name = 'No Starch Press';
/*8-*/
SELECT books.name,
    authors.first_name,
    authors.surname
FROM books
    INNER JOIN book_authors ON book_authors.book_id = books.id
    INNER JOIN authors ON authors.id = book_authors.author_id;
/*9*/
SELECT books.name
FROM books
    INNER JOIN book_authors ON book_authors.book_id = books.id
    JOIN authors ON authors.id = book_authors.author_id
WHERE authors.surname = 'Burns';
/*10*/
SELECT authors.first_name,
    authors.surname
FROM authors
    INNER JOIN book_authors ON book_authors.author_id = authors.id
    INNER JOIN books ON book_authors.author_id = books.id
GROUP BY authors.id
HAVING COUNT(authors.id) > 2;
/*11*/
/*12*/
/*13*/
/*14*/