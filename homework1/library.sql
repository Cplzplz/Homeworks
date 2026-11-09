-- Task 1 Create Database
DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;


-- Task 2 Create Table authors
CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    birth_year INT CHECK (birth_year>1000)
);


-- Task 3 Create Table books
CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(30) NOT NULL,
    pages INT CHECK (pages>0),
    published_year INT NULL CHECK (published_year>1000),
    price DECIMAL(6,2) NOT NULL DEFAULT 0 CHECK(price>-1),
    copies INT NOT NULL DEFAULT 1 CHECK(copies>-1),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);


-- Task 4 Create Table members
CREATE TABLE members (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE CHECK (email like '%@%'),
    city VARCHAR(50) NOT NULL,
    birth_date DATE NULL,
    joined_on DATE NOT NULL, 
    CHECK (birth_date IS NULL OR joined_on>birth_date)
);


-- Task 5 Create Table loans
CREATE TABLE loans (
	id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE NULL,
    CHECK(return_date IS NULL OR return_date>=loan_date),
    FOREIGN KEY(book_id) REFERENCES books(id),
    FOREIGN KEY(member_id) REFERENCES members(id)
);


-- Task 6 Add a Column phone To members
ALTER TABLE members
ADD phone VARCHAR(20) NULL;


-- Task 7 Insert 8 Authors To authors Table
INSERT INTO authors (author_name,country,birth_year)
VALUES ('Ilia Chavchavadze','Georgia',1837),
('Nodar Dumbadze','Georgia',1928),
('Vazha-Pshavela','Georgia',1861),
('J.R.R. Tolkien','United Kingdom',1892),
('George Orwell','United Kingdom',1903),
('Agatha Christie','United Kingdom',1890),
('Jules Verne','France',1828),
('Mark Twain','USA',1835);


-- Task 8 Insert 8 Members To members Table
INSERT INTO members (first_name,last_name,email,city,birth_date,joined_on,phone) 
VALUES ('Nika','Beridze','nika.b@gmail.com','Tbilisi','2009-03-14','2025-09-01','555 12 34 56'),
('Ana','Kapanadze','ana.k@mail.ge','Batumi','2010-07-22','2025-09-15',NULL),
('Giorgi','Lomidze','giorgi.l@gmail.com','Kutaisi','2008-11-05','2025-10-02','599 34 56 78'),
('Mariam','Gelashvili','mariam.g@gmail.com','Tbilisi','2011-05-30','2026-01-20','551 45 67 89'),
('Luka','Tsiklauri','luka.t@gmail.com','Rustavi','2009-09-12','2026-02-11',NULL),
('Nino','Abashidze','nino.a@yahoo.com','Tbilisi','2010-01-25','2026-03-03','593 67 89 01'),
('Dato','Maisuradze','dato.m@gmail.com','Batumi','2008-12-01','2026-04-18','571 11 22 33'),
('Salome','Javakhishvili','salome.j@gmail.com','Zugdidi','2011-04-18','2026-09-09',NULL);


-- Task 9 Insert Into Tables books And loanes
INSERT INTO books (title, author_id, genre, pages, published_year, price, copies) VALUES
('The Hobbit', 4, 'Fantasy', 310, 1937, 24.90, 4),
('The Fellowship of the Ring', 4, 'Fantasy', 423, 1954, 32.50, 3),
('The Two Towers', 4, 'Fantasy', 352, 1954, 32.50, 2),
('1984', 5, 'Dystopia', 328, 1949, 19.90, 5),
('Animal Farm', 5, 'Dystopia', 112, 1945, 12.50, 6),
('Murder on the Orient Express', 6, 'Detective', 256, 1934, 15.00, 3),
('And Then There Were None', 6, 'Detective', 272, 1939, 15.00, 2),
('Around the World in Eighty Days', 7, 'Adventure', 240, 1872, 14.20, 3),
('Twenty Thousand Leagues Under the Seas', 7, 'Adventure', 448, 1870, 18.90, 2),
('The Adventures of Tom Sawyer', 8, 'Adventure', 274, 1876, 13.40, 4),
('Kacia-Adamiani?!', 1, 'Classic', 160, 1863, 10.00, 3),
('Otaraant Kvrivi', 1, 'Classic', 140, 1888, 9.50, 2),
('Me, Grandma, Iliko and Illarion', 2, 'Novel', 220, 1960, 11.00, 5),
('The Law of Eternity', 2, 'Novel', 304, 1978, 14.00, 3),
('Aluda Ketelauri', 3, 'Poetry', 64, 1888, 8.00, 2),
('Host and Guest', 3, 'Poetry', 72, 1893, 8.50, 1);


INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2026-01-10', '2026-01-24'),
(4, 2, '2026-01-12', '2026-01-30'),
(13, 3, '2026-01-15', '2026-02-01'),
(2, 1, '2026-02-02', '2026-02-20'),
(6, 4, '2026-02-05', '2026-02-19'),
(1, 6, '2026-02-10', '2026-02-28'),
(10, 3, '2026-03-01', '2026-03-15'),
(4, 6, '2026-03-04', '2026-03-20'),
(13, 4, '2026-03-10', '2026-03-25'),
(8, 7, '2026-04-20', '2026-05-02'),
(1, 2, '2026-05-05', '2026-05-19'),
(3, 1, '2026-05-12', '2026-06-01'),
(11, 6, '2026-06-03', '2026-06-17'),
(7, 4, '2026-07-08', '2026-07-22'),
(13, 1, '2026-09-14', '2026-09-30'),
(9, 3, '2026-10-01', NULL),
(1, 4, '2026-10-12', NULL),
(5, 7, '2026-10-15', NULL),
(14, 6, '2026-10-20', NULL),
(4, 1, '2026-10-28', NULL);


SELECT COUNT(*) FROM books;
SELECT COUNT(*) FROM loans;


-- Task 10 Add One More Book To The books Table With The Same Author
INSERT INTO books (title, author_id, genre, pages, published_year, price) VALUES 
('The Silmarillion', 4, 'Fantasy', 365, 1977, 20.00);

SELECT * FROM books
WHERE author_id=4;
-- QUESTION: which value did copies get, and why?
-- ANSWER: The copies go value 1, because value rows default value is 1 (default only works when we dont apply any value to it).


-- Task 11 Try to add a loan for the member with id 99
-- INSERT INTO loans (book_id, member_id, loan_date, return_date)
-- VALUES (1, 99, '2026-11-08', NULL);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`library`.`loans`, CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`))
-- Foreign key of loans that references the id of a member cannot access any members ,because no member has id equal to 99.


-- Task 12 Update dato's Location To Kutaisi
UPDATE members 
SET city='Kutaisi'
WHERE id=7;


-- Task 13 Make All Fantasy Books 10% More Expensive
UPDATE books
SET price=price*1.10
WHERE genre='Fantasy';


-- Task 14 set the loan date 
UPDATE loans
SET return_date='2026-11-05'
WHERE id=16;


-- Task 15 Delete the book that was added in task 10
DELETE FROM books
WHERE id=17;
-- QUESTION: why would DELETE FROM books WHERE id = 1; (The Hobbit) fail?
-- ANSWER: Because foreign key from loans is still connected to it, therefore making it unable to delete book with that id.


-- Task 16 Show only the title and pages of every book
SELECT title,pages FROM books;


-- Task 17 Only show fantasy books
SELECT title FROM books 
WHERE genre='Fantasy';


-- Task 18 Show the title and pages of books with more than 400 pages, the longest first.
SELECT title,pages FROM books
WHERE pages>400
ORDER BY pages DESC;


-- Task 19 Show the first name and city of members who live in Tbilisi or Kutaisi.
SELECT first_name FROM members
WHERE city IN ('Tbilisi','Kutaisi');


-- Task 20 Show the title and year of books published between 1900 and 1999.
SELECT title,published_year FROM books
WHERE published_year BETWEEN 1900 AND 1999;


-- Task 21 Show the authors whose name starts with J, and the books whose title contains 'the' anywhere (two queries).
SELECT author_name FROM authors
WHERE author_name LIKE 'J%';

SELECT title FROM books
WHERE title like '%the%';


-- Task 22 Show the members who have no phone number.
SELECT * FROM members
WHERE phone IS NULL;


-- Task 23 Show all loans that are not returned yet.
SELECT * FROM loans
WHERE return_date IS NULL;


-- Task 24 Show the 3 cheapest books (title and price).
SELECT title,price FROM books
ORDER BY price ASC
LIMIT 3;


-- Task 25 Show every genre the library has, each only once, in alphabetical order.
SELECT DISTINCT genre FROM books -- we can also use group by, but this is better for easy selects without duplicates
ORDER BY genre ASC;


-- Task 26 For every book show the title, price, copies, and a new column stock_value = price × copies (the value of all its copies). Most valuable first.
SELECT title,price,copies,price*copies AS stock_value FROM books
ORDER BY stock_value DESC;


-- Task 27 Show the members who joined in 2026 as one column full_name (first and last name together), with their joined_on date.
SELECT CONCAT(first_name,' ',last_name) as full_name,joined_on FROM members
WHERE joined_on>='2026-01-01' AND joined_on<'2027-01-01';


-- Task 28 How many different books does the library have, how many copies are there in total, and what is the average price (rounded to 2 decimals)? One query.
SELECT COUNT(*) AS different_books, SUM(copies) AS total_copies,ROUND(AVG(price),2) AS average_price FROM books;


-- Task 29 Show the cheapest price, the highest price and the oldest publishing year. One query.
SELECT MIN(price) AS cheapest_price,MAX(price) AS highest_price,MIN(published_year) AS oldest_publishing_year FROM books;


-- Task 30 How many books are there in each genre? The biggest genre first.\
SELECT genre, COUNT(*) AS book_count FROM books
GROUP BY genre
ORDER BY book_count DESC;


-- Task 31 Show the average number of pages per genre (rounded), but only the genres where the average is above 250.
SELECT genre, ROUND(AVG(pages)) AS average_number_of_pages FROM books
GROUP BY genre
HAVING AVG(pages)>250;


-- Task 32 How many members live in each city? Show only the cities with at least 2 members. 
SELECT city, COUNT(*) AS residents FROM members
GROUP BY city
HAVING residents>=2;


-- Task 33 For every member_id, how many loans did they make? The most active member first.
SELECT member_id, COUNT(*) AS loan_amount FROM loans
GROUP BY member_id
ORDER BY loan_amount DESC;


-- Task 34 Which 3 book_ids were borrowed most often, and how many times?
SELECT book_id, COUNT(*) AS borrow_amount FROM loans
GROUP BY book_id
ORDER BY borrow_amount DESC
LIMIT 3;


-- Task 35 How many loans were made in each month of 2026? (Hint: MONTH(loan_date).) Only count loans that are already returned.
SELECT MONTH(loan_date) AS months, COUNT(*) AS loan_amount FROM loans
WHERE loan_date>='2026-01-01' AND loan_date<'2027-01-01' AND return_date IS NOT NULL
GROUP BY MONTH(loan_date)
ORDER BY MONTH(loan_date);


-- Task 36 Show the title and price of the books that are more expensive than the average book.
SELECT title,price FROM books
WHERE price>(SELECT AVG(price) FROM books);


-- Task 37 Show the titles of all books by George Orwell. Don't write his id yourself: find it with a subquery on authors.
SELECT title FROM books
WHERE author_id=(SELECT id FROM authors WHERE author_name='George Orwell');


-- Task 38 Show the names of the members who have never borrowed a book.
SELECT CONCAT(first_name,' ',last_name) AS full_name FROM members
WHERE id NOT IN(SELECT member_id FROM loans);


-- Task 39 Show the titles of the books that are at a member's home right now (their loan is not returned).
SELECT title FROM books
WHERE id IN(SELECT book_id FROM loans WHERE return_date IS NULL);


-- Task 40 Show the names of the authors whose books were borrowed by at least one member from Tbilisi. (You need a subquery inside a subquery.)
SELECT author_name FROM authors
WHERE id IN
(SELECT author_id FROM books 
WHERE id IN
(SELECT book_id FROM loans 
WHERE member_id IN
(SELECT id FROM members 
WHERE city='Tbilisi')));


-- Bonus 1 Show the title of the book that was borrowed most often. One query, no ids written by hand.
SELECT title FROM books
WHERE id=(SELECT book_id FROM loans 
GROUP BY book_id 
ORDER BY COUNT(*) DESC 
LIMIT 1);


-- Bonus 2 For every genre, show the book with the most pages (genre, title, pages). Hint: the subquery can use the genre of the row the outer query is looking at.
SELECT genre,title,pages FROM books b1
WHERE pages=(
SELECT MAX(pages)
FROM books b2
WHERE b2.genre=b1.genre);