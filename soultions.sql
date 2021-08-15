1-SELECT first_name , surname FROM authors;
2-SELECT *  FROM authors ORDER BY surname LIMIT 3 
3-SELECT *  FROM authors WHERE location !='';
4-SELECT *  FROM authors WHERE location !='Nazareth' OR location IS NULL;
5-SELECT *  FROM authors WHERE surname LIKE '%Wistle%' OR surname LIKE '%wistle%';
6-SELECT publishers.name FROM publishers INNER JOIN books ON books.publisher_id = publishers.id WHERE books.name = 'Python Made Easy'; 
7-SELECT publishers.name ,books.name  FROM publishers INNER JOIN books ON books.publisher_id = publishers.id WHERE publishers.name = 'No S
 tarch Press';