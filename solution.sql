SELECT FIRST_NAME , SURNAME FROM AUTHORS;

SELECT FIRST_NAME , SURNAME , LOCATION FROM AUTHORS ORDER BY SURNAME ;

SELECT FIRST_NAME , SURNAME , LOCATION FROM AUTHORS ORDER BY SURNAME LIMIT 3 ;

SELECT ID , FIRST_NAME , SURNAME , LOCATION FROM AUTHORS WHERE LOCATION IS NOT NULL;

SELECT ID , FIRST_NAME , SURNAME , LOCATION FROM AUTHORS WHERE LOCATION <> 'Nazareth' OR LOCATION IS NULL;

SELECT ID , FIRST_NAME , SURNAME , LOCATION FROM AUTHORS WHERE surname ~* '.*wistle';

 SELECT P.NAME FROM PUBLISHERS P INNER JOIN BOOKS B ON(B.PUBLISHER_ID = P.ID) WHERE B.NAME = 'Python Made Easy';

 SELECT P.NAME , B.NAME FROM PUBLISHERS P INNER JOIN BOOKS B ON(B.PUBLISHER_ID = P.ID) WHERE P.NAME = 'No Starch Press';

 SELECT B.NAME , A.FIRST_NAME , A.SURNAME FROM BOOK_AUTHORS BA INNER JOIN AUTHORS A ON(A.ID = BA.AUTHOR_ID) INNER JOIN BOOKS B ON(B.ID = BA.BOOK_ID) ORDER BY B.NAME;

 SELECT B.NAME FROM BOOKS B INNER JOIN BOOK_AUTHORS BA ON(BA.BOOK_ID = B.ID) INNER JOIN AUTHORS A ON(A.ID = BA.AUTHOR_ID) WHERE A.FIRST_NAME = 'Ted' AND SURNAME = 'Burns';

 SELECT A.FIRST_NAME , A.SURNAME FROM AUTHORS A JOIN BOOK_AUTHORS BA ON(BA.AUTHOR_ID = A.ID) JOIN BOOKS B ON(B.ID = BA.BOOK_ID) GROUP BY A.ID HAVING COUNT(A.ID) >= 3;

 SELECT P.NAME , COUNT(P.ID) FROM PUBLISHERS P JOIN BOOKS B ON(P.ID = B.PUBLISHER_ID) GROUP BY P.NAME , P.ID ORDER BY COUNT(P.ID) DESC;

 SELECT B.NAME , COUNT(BA.AUTHOR_ID) FROM BOOK_AUTHORS BA JOIN BOOKS B ON(B.ID = BA.BOOK_ID) GROUP BY B.NAME , B.RELEASE_DATE HAVING B.RELEASE_DATE > '01-Jan-96' ORDER BY C
 OUNT(BA.AUTHOR_ID) DESC;

 SELECT B.NAME , COUNT(BA.AUTHOR_ID) FROM BOOK_AUTHORS BA JOIN BOOKS B ON(B.ID = BA.BOOK_ID) GROUP BY B.NAME ORDER BY COUNT(BA.AUTHOR_ID) DESC LIMIT 1;

 SELECT B.NAME , COUNT(BA.AUTHOR_ID) FROM BOOK_AUTHORS BA JOIN BOOKS B ON(B.ID = BA.BOOK_ID) GROUP BY B.NAME ORDER BY COUNT(BA.AUTHOR_ID)  LIMIT 1;

 SELECT A.FIRST_NAME , A.SURNAME , COUNT(BA.BOOK_ID) FROM AUTHORS A JOIN BOOK_AUTHORS BA ON(A.ID = BA.AUTHOR_ID) GROUP BY A.ID ORDER BY COUNT(BA.BOOK_ID) DESC LIMIT 1;