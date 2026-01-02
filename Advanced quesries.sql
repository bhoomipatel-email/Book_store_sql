-- 1) Retrieve the total number of books sold for each genre

SELECT 
    books.genre,
    SUM(order_book_details.Quantity) AS Genre_quantity
FROM
    order_book_details
        JOIN
    books ON order_book_details.Book_ID = books.Book_ID
GROUP BY books.genre
ORDER BY genre_quantity DESC;


-- 2) Find the average price of books in the "Fantasy" genre

SELECT 
    ROUND(AVG(price), 0) AS average_price_fantasy
FROM
    books
WHERE
    genre = 'fantasy';
    
--     3) List customers who have placed at least 2 orders

SELECT 
    customer_id, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY customer_id
HAVING COUNT(order_id) >= 2;

-- 4) Find the most frequently ordered book

SELECT 
    order_book_details.Book_ID,
    books.Title,
    COUNT(order_book_details.Order_ID) AS book_count
FROM
    order_book_details
        JOIN
    books ON order_book_details.Book_ID = books.Book_ID
GROUP BY book_id , books.Title
ORDER BY book_count DESC
LIMIT 3;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 

SELECT 
    *
FROM
    books
WHERE
    genre = 'fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author

SELECT 
    books.author,
    SUM(order_book_details.Quantity) AS total_quantity_sold
FROM
    order_book_details
        JOIN
    books ON order_book_details.book_ID = books.Book_ID
GROUP BY books.author;

-- 7) List the cities where customers who spent over $300 are located

SELECT DISTINCT
    buyers.city, Total_Amount
FROM
    buyers
        JOIN
    order_book_details ON buyers.Customer_ID = order_book_details.Customer_ID
WHERE
    order_book_details.Total_Amount > 300;

-- 8) Find the customer who spent the most on orders

SELECT 
    buyers.Customer_ID,
    buyers.Name,
    SUM(order_book_details.Total_Amount) AS total_spent
FROM
    order_book_details
        JOIN
    buyers ON order_book_details.Customer_ID = buyers.Customer_ID
GROUP BY buyers.Customer_ID , buyers.Name
ORDER BY total_spent DESC
LIMIT 5;

-- 9) Calculate the stock remaining after fulfilling all orders

SELECT 
    books.book_ID,
    books.title,
    books.Stock,
    COALESCE(SUM(order_book_details.quantity), 0) AS order_quantity,
    books.Stock - COALESCE(SUM(order_book_details.quantity), 0) AS remaining_quantity
FROM
    books
        LEFT JOIN
    order_book_details ON books.Book_ID = order_book_details.Book_ID
GROUP BY books.book_ID
order by books.book_ID;

