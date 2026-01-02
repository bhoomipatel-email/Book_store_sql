-- Retreieve all books in fiction genre

select   
count(*) as total_fiction_genre
from books
where genre= "fiction";  
  
    
-- Find books published after the year 1950

SELECT 
    *
FROM
    books
WHERE
    published_year > '1950';

select   
count(*) as total_published_year
from books
where published_year> "1950";  

--  List all customers from the Canada

SELECT 
    *
FROM
    buyers
WHERE
    country = 'canada';
    
-- Show orders placed in November 2023

select count(*) as orders_placed_november
from order_book_details
where order_date between "2023-11-01" AND '2023-11-30';

SELECT *
FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

--  Retrieve the total stock of books available

SELECT 
    SUM(stock) AS total_stock
FROM
    books;
    
-- Find the details of the most expensive book

SELECT 
    *
FROM
    books
ORDER BY price DESC
LIMIT 1;

-- Show all customers who ordered more than 1 quantity of a book

SELECT 
    *
FROM
    order_book_details
WHERE
    quantity > '1';
    
    
-- Retrieve all orders where the total amount exceeds $20

SELECT 
    *
FROM
    order_book_details
WHERE
    Total_Amount > '$20';
    
-- List all genres available in the Books table

SELECT DISTINCT
    genre
FROM
    books;

--  Find the book with the lowest stock

SELECT 
    *
FROM
    books
ORDER BY stock ASC;

--  Calculate the total revenue generated from all orders

SELECT 
    SUM(Total_Amount) AS Revenue_generated
FROM
    order_book_details
