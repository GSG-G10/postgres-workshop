-- 1
select first_name, surname
from authors

-- 2
select *
from authors
order by surname limit 3

-- 3
select *
from authors
where location is not null

-- 4
select *
from authors
where location != 'Nazareth' or location is null

-- 5
select *
from authors
where surname like '%wistle%'

-- 5 bonus
select *
from authors
where lower(surname) like '%wistle%'


-- 6
select name
from publishers
where id = (select publisher_id from books where name = 'Python Made Easy')


-- 7
select publishers.name, books.name
from publishers
         inner join books ON books.publisher_id = publishers.id
where publishers.name = 'No Starch Press'


-- 8
select books.name, authors.first_name, authors.surname
from books
         inner join book_authors ON book_authors.book_id = books.id
         inner join authors ON authors.id = book_authors.author_id
order by books.name


-- 9
select books.name
from books
         inner join book_authors ON book_authors.book_id = books.id
         inner join authors ON authors.id = book_authors.author_id
where authors.first_name = 'Ted'

-- 10
select authors.first_name, authors.surname
from authors
         inner join book_authors ON book_authors.author_id = authors.id
group by authors.first_name, authors.surname
having count(book_authors.book_id) >= 3

-- 11
select publishers.name, count(books.publisher_id) as counter
from publishers
         inner join books ON books.publisher_id = publishers.id
group by publishers.name
order by counter desc

-- 12
select books.name, count(book_authors.author_id) as counter
from books
         inner join book_authors ON book_authors.book_id = books.id
group by books.name
order by counter desc


-- 13 highest
select books.name, count(book_authors.author_id) as counter
from books
         inner join
     book_authors ON book_authors.book_id = books.id
group by books.name
order by counter desc limit 1

-- 13 lowest
select books.name, count(book_authors.author_id) as counter
from books
         inner join book_authors ON book_authors.book_id = books.id
group by books.name
order by counter limit 1

--14
select authors.first_name, authors.surname, count(book_authors.author_id) as counter
from authors
         inner join book_authors ON book_authors.author_id = authors.id
group by authors.first_name, authors.surname
order by counter desc limit 1