mrayyes@mrayyes-OMEN:~/Desktop/W6/postgres-workshop$ pgcli
Server: PostgreSQL 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
Version: 2.2.0
Chat: https://gitter.im/dbcli/pgcli
Home: http://pgcli.com
mrayyes>  


                                                                                                          
mrayyes> psql --file=data.sql                                                                             
syntax error at or near "psql"
LINE 1: psql --file=data.sql
        ^

Time: 0.002s
mrayyes> data.sql                                                                                         
syntax error at or near "data"
LINE 1: data.sql
        ^

Time: 0.002s
mrayyes> pgcli --file=data.sql                                                                            
syntax error at or near "pgcli"
LINE 1: pgcli --file=data.sql
        ^

Time: 0.001s
mrayyes>  


mrayyes>  

mrayyes> \i data.sql                                                                   
You're about to run a destructive command.
Do you want to proceed? (y/n): y
BEGIN
NOTICE:  table "authors" does not exist, skipping
NOTICE:  table "books" does not exist, skipping
NOTICE:  table "publishers" does not exist, skipping
NOTICE:  table "book_authors" does not exist, skipping

DROP TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
+------+
| id   |
|------|
| 1    |
| 2    |
| 3    |
| 4    |
| 5    |
| 6    |
| 7    |
| 8    |
+------+
INSERT 0 8
+------+
| id   |
|------|
| 1    |
| 2    |
| 3    |
| 4    |
+------+
INSERT 0 4
+------+
| id   |
|------|
| 1    |
| 2    |
| 3    |
| 4    |
| 5    |
| 6    |
| 7    |
| 8    |
:...skipping...
BEGIN
NOTICE:  table "authors" does not exist, skipping
NOTICE:  table "books" does not exist, skipping
NOTICE:  table "publishers" does not exist, skipping
NOTICE:  table "book_authors" does not exist, skipping

DROP TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
+------+
| id   |
|------|
| 1    |
| 2    |
| 3    |
| 4    |
| 5    |
| 6    |
| 7    |
| 8    |
+------+
INSERT 0 8
+------+
| id   |
|------|
| 1    |
| 2    |
| 3    |
| 4    |
+------+
INSERT 0 4
+------+
| id   |
|------|
| 1    |
| 2    |
| 3    |
| 4    |
| 5    |
| 6    |
| 7    |
| 8    |
| 9    |
| 10   |
+------+
INSERT 0 10
INSERT 0 26
COMMIT
~
~
~
~
~
~
~
~
~
Time: 2.534s (2 seconds), executed in: 2.534s (2 seconds)
mrayyes> SELECT * FROM authors WHERE first_name = "Sharon"                                                     
column "Sharon" does not exist
LINE 1: SELECT * FROM authors WHERE first_name = "Sharon"
                                                 ^

Time: 0.002s
mrayyes> SELECT * FROM authors WHERE first_name = 'Sharon'                                                     
+------+--------------+-----------+------------+
| id   | first_name   | surname   | location   |
|------+--------------+-----------+------------|
| 1    | Sharon       | Smith     | Nazareth   |
+------+--------------+-----------+------------+
SELECT 1
Time: 0.031s

                                  
mrayyes> SELECT first_name , surname FROM authors            
+--------------+---------------+
| first_name   | surname       |
|--------------+---------------|
| Sharon       | Smith         |
| Ted          | Burns         |
| Stephen      | Wistle        |
| Amanda       | Bertwistle    |
| David        | Grewal        |
| John         | White         |
| Paul         | Hallam-Wistle |
| Paul         | Jones         |
+--------------+---------------+
SELECT 8
Time: 0.035s
mrayyes> SELECT * From authors ORDER BY surname              
+------+--------------+---------------+------------+
| id   | first_name   | surname       | location   |
|------+--------------+---------------+------------|
| 4    | Amanda       | Bertwistle    | Nazareth   |
| 2    | Ted          | Burns         | London     |
| 5    | David        | Grewal        | <null>     |
| 7    | Paul         | Hallam-Wistle | London     |
| 8    | Paul         | Jones         | Nazareth   |
| 1    | Sharon       | Smith         | Nazareth   |
| 6    | John         | White         | London     |
| 3    | Stephen      | Wistle        | <null>     |
+------+--------------+---------------+------------+
SELECT 8
Time: 0.034s
mrayyes> SELECT surname  
 FROM authors 
 ORDER BY surname 
 LIMIT 3                                                     
+------------+
| surname    |
|------------|
| Bertwistle |
| Burns      |
| Grewal     |
+------------+
SELECT 3                                         

Time: 0.002s
mrayyes> SELECT * FROM authors WHERE location IS NOT NULL;   
+------+--------------+---------------+------------+
| id   | first_name   | surname       | location   |
|------+--------------+---------------+------------|
| 1    | Sharon       | Smith         | Nazareth   |
| 2    | Ted          | Burns         | London     |
| 4    | Amanda       | Bertwistle    | Nazareth   |
| 6    | John         | White         | London     |
| 7    | Paul         | Hallam-Wistle | London     |
| 8    | Paul         | Jones         | Nazareth   |
+------+--------------+---------------+------------+
SELECT 6
Time: 0.034s

mrayyes> SELECT * FROM authors WHERE location NOT IN ('N
 azareth') OR location IS NULL;                         
+------+--------------+---------------+------------+
| id   | first_name   | surname       | location   |
|------+--------------+---------------+------------|
| 2    | Ted          | Burns         | London     |
| 3    | Stephen      | Wistle        | <null>     |
| 5    | David        | Grewal        | <null>     |
| 6    | John         | White         | London     |
| 7    | Paul         | Hallam-Wistle | London     |
+------+--------------+---------------+------------+
SELECT 5
Time: 0.030s

mrayyes> SELECT * FROM authors WHERE surname LIKE '%Wist
 le%'                                                   
+------+--------------+---------------+------------+
| id   | first_name   | surname       | location   |
|------+--------------+---------------+------------|
| 3    | Stephen      | Wistle        | <null>     |
| 7    | Paul         | Hallam-Wistle | London     |
+------+--------------+---------------+------------+
SELECT 2
Time: 0.032s


mrayyes> SELECT * FROM authors WHERE LOWER(surname) LIKE
  LOWER('%Wistle%');                                    
+------+--------------+---------------+------------+
| id   | first_name   | surname       | location   |
|------+--------------+---------------+------------|
| 3    | Stephen      | Wistle        | <null>     |
| 4    | Amanda       | Bertwistle    | Nazareth   |
| 7    | Paul         | Hallam-Wistle | London     |
+------+--------------+---------------+------------+
SELECT 3
Time: 0.031s


mrayyes> SELECT publishers.name FROM publishers INNER JO
 IN books ON books.publisher_id = publishers.id WHERE bo
 oks.name = 'Python Made Easy';                         
+-----------------+
| name            |
|-----------------|
| No Starch Press |
+-----------------+
SELECT 1
Time: 0.029s

mrayyes> SELECT publishers.name ,books.name FROM publishers INNER JOIN books
  ON books.publisher_id = publishers.id WHERE publishers.name ='No Starch Pr
 ess';                                                                      
+-----------------+-----------------------------------+
| name            | name                              |
|-----------------+-----------------------------------|
| No Starch Press | Python Made Easy                  |
| No Starch Press | JavaScript: The Really Good Parts |
+-----------------+-----------------------------------+
SELECT 2
Time: 0.029s

