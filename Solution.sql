/*1-*/ 
SELECT first_name,surname FROM authors ;

/*2-*/
SELECT * FROM authors ORDER BY surname LIMIT 3 ; 

/*3-*/
SELECT * FROM authors WHERE location IS NOT NULL  ; 

/*4-*/
SELECT * FROM authors WHERE location != 'Nazareth' OR  location IS NULL ;

/*5-*/
SELECT * FROM authors WHERE surname LIKE '%Wistle';

/*6-*/
SELECT books.name , publishers.name FROM publishers INNER JOIN books ON books.publisher_id = publishers.id WHERE books.name = 'Python Made Easy';

/*7-*/
SELECT publishers.name , books.name FROM books INNER JOIN publishers ON publishers.id = books.publisher_id WHERE publishers.name = 'No Starch Press';

/*8-*/

/*9*/

/*10*/

/*11*/

/*12*/

/*13*/

/*14*/
