CREATE DATABASE ADHARSHA;
USE ADHARSHA;

----------#Create Tables (Library Management System)----PROJECT#------------
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(50)
);
INSERT INTO authors VALUES
(1,'J K Rowling','UK'),
(2,'George Orwell','UK'),
(3,'Chetan Bhagat','India'),
(4,'Dan Brown','USA'),
(5,'Paulo Coelho','Brazil');
SELECT * FROM AUTHORS;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    category VARCHAR(50),
    price INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
INSERT INTO books VALUES
(101,'Harry Potter',1,'Fantasy',500),
(102,'1984',2,'Dystopian',300),
(103,'Animal Farm',2,'Political',250),
(104,'Half Girlfriend',3,'Romance',200),
(105,'Da Vinci Code',4,'Thriller',450),
(106,'The Alchemist',5,'Philosophy',350);
SELECT * FROM BOOKS;

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    join_date DATE,
    city VARCHAR(50)
);
INSERT INTO members VALUES
(1,'Rahul','2023-01-10','Delhi'),
(2,'Ayesha','2023-02-15','Mumbai'),
(3,'John','2023-03-20','London'),
(4,'Priya','2023-04-25','Bangalore');
SELECT * FROM MEMBERS;

CREATE TABLE issues (
    issue_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
INSERT INTO issues VALUES
(1,101,1,'2023-05-01','2023-05-10'),
(2,102,2,'2023-05-05',NULL),
(3,104,3,'2023-05-07','2023-05-14'),
(4,106,4,'2023-05-10',NULL);
SELECT * FROM ISSUES;

##----SECTION 1: Basic SQL (Warm-up)##----------

#QUESTION-NUMBER--1------------------------------------------

#QUESTION---Display all books in the library

SELECT * FROM BOOKS;

#QUESTION---2---Display only book title and price
SELECT TITLE FROM BOOKS;

#QUESTION---3---Find books with price greater than 300

SELECT * FROM BOOKS WHERE PRICE>300;

#QUESTION---4---List all members from Delhi

SELECT * FROM MEMBERS WHERE CITY IN ('DELHI');

#QUESTION---5---Sort books by price (highest first)

SELECT * FROM BOOKS;
SELECT * FROM BOOKS WHERE PRICE ORDER BY PRICE DESC;

#QUESTION------SECTION 2: Filtering & Conditions
#QUESTION----6. Find books in Fantasy or Romance category
SELECT * FROM BOOKS;

SELECT * FROM BOOKS WHERE CATEGORY IN("FANTASY","ROMANCE");

#QUESTION-------7-----Find books priced between 200 and 400

SELECT * FROM BOOKS WHERE PRICE BETWEEN 200 AND 300;

#QUESTION-------8-----Find issued books not yet returned
SELECT * FROM ISSUES;

SELECT * FROM ISSUES WHERE RETURN_DATE IS NULL;

#QUESTION-------9-----Find members who joined after Feb 2023
SELECT * FROM MEMBERS ;
SELECT * FROM members  WHERE join_date > '2023-02-01';

#QUESTION-------10-----ECTION 3: Aggregate Functions-------------
#QUESTION-----------10----Count total number of books

SELECT * FROM BOOKS;
SELECT COUNT(BOOK_ID) FROM BOOKS;
SELECT COUNT(*) FROM BOOKS;

#QUESTION-----------11----Find average book price
SELECT * FROM BOOKS;
SELECT AVG(PRICE) FROM BOOKS;

#QUESTION-----------12----Find highest and lowest priced book

SELECT MAX(PRICE) FROM BOOKS;

SELECT MIN(PRICE) FROM BOOKS;

#QUESTION--------------13---Count number of books per category

SELECT CATEGORY,COUNT(*) FROM BOOKS GROUP BY CATEGORY;

#QUESTION--------------14---SECTION 4: GROUP BY & HAVING
#QUESTION--------------14---Categories having more than 1 book

SELECT CATEGORY ,COUNT(*) FROM BOOKS GROUP BY CATEGORY HAVING COUNT(*)>1;

#QUESTION--------------15----Cities with more than 1 library member

SELECT CITY,COUNT(*) FROM MEMBERS GROUP BY CITY HAVING COUNT(*)>1;


#-------SECTION 5: JOINS (🔥 MOST IMPORTANT)----------------------

#QUESTION------16------Display books with their author names

SELECT * FROM BOOKS;
SELECT * FROM AUTHORS;

SELECT BOOKS.BOOK_ID,
BOOKS.TITLE,
AUTHORS.AUTHOR_ID,
AUTHORS.AUTHOR_NAME FROM BOOKS
INNER JOIN AUTHORS
ON BOOKS.AUTHOR_ID=AUTHORS.AUTHOR_ID;

#QUESTION------17------Display issued books with member names

SELECT * FROM ISSUES;
SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;

SELECT members.member_name, books.title, issues.issue_date
FROM issues 
JOIN members  ON issues.member_id = members.member_id
JOIN books  ON issues.book_id = books.book_id;

#QUESTION------18----. Find books that were never issued--
SELECT b.title
FROM books b
LEFT JOIN issues i ON b.book_id = i.book_id
WHERE i.book_id IS NULL;


#QUESTION------19----.SECTION 6: Subqueries (Interview Favorite ⭐)

#question----Find the most expensive book

select * from books where price =(select max(price) from books); 

#QUESTION------20--Find members who issued at least one book

SELECT * FROM MEMBERS WHERE MEMBER_ID IN (SELECT MEMBER_ID FROM MEMBERS);


#QUESTION----------21----Find authors who have written books

SELECT * FROM AUTHORS;
SELECT * FROM BOOKS;

SELECT * FROM BOOKS WHERE AUTHOR_ID IN (SELECT AUTHOR_ID FROM BOOKS);

#QUESTION----------22----SECTION 7: CASE WHEN (Business Logic)
#QUESTION --------------23------Categorize books by price

SELECT title, price,
CASE
    WHEN price < 250 THEN 'Cheap'
    WHEN price BETWEEN 250 AND 400 THEN 'Medium'
    ELSE 'Expensive'
END AS price_category
FROM books;
#QUESTIONS-------SECTION 8: Date Functions
#QUESTIONS-----24---Calculate number of days a book was issued

SELECT issue_id,
DATEDIFF(return_date, issue_date) AS days_issued
FROM issues
WHERE return_date IS NOT NULL;

#QUESTION---25-----Find books issued in May

SELECT *
FROM issues
WHERE MONTH(issue_date) = 5;


#QUESTION-----26--------Most popular author (by issues)

SELECT a.author_name, COUNT(*) AS issue_count
FROM issues i
JOIN books b ON i.book_id = b.book_id
JOIN authors a ON b.author_id = a.author_id
GROUP BY a.author_name
ORDER BY issue_count DESC
LIMIT 1;


#QUESTION-----30---Rank books by price

SELECT title, price,
RANK() OVER (ORDER BY price DESC) AS price_rank
FROM books;


#QUESTION--------31-----Books not returned yet with member name

SELECT m.member_name, b.title
FROM issues i
JOIN members m ON i.member_id = m.member_id
JOIN books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL;
















