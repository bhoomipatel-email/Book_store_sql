📚 Online Book Store Sales Analysis using SQL

📌 Project Title - Online Book Store Performance & Revenue Analysis using SQL

🧾 Project Overview -
This project analyzes online book store sales data using SQL to extract meaningful business insights related to revenue, customer behavior, book performance, and inventory trends. The analysis is structured to mirror real-world business intelligence use cases, making it highly suitable for Data Analyst, Business Analyst, Product Analyst, and Consulting roles.
The project progresses from basic SQL queries to advanced analytical techniques, including joins, subqueries, and trend-based analysis.

🎯 Project Objectives

The primary objectives of this project are to:

* Analyze overall sales and revenue performance
* Identify top-performing books, authors, and genres
* Understand customer purchasing behavior
* Perform category-wise and time-based analysis
* Demonstrate strong SQL querying and analytical thinking
* Build a portfolio-ready SQL project aligned with industry expectations

  🗂 Dataset Overview

The project uses three relational tables:

* Books – Book details such as title, author, genre, price, and stock
* Customers– Customer demographic information
* Orders – Order transactions including quantity, date, and total amount

🔹 BASIC SQL QUERIES

 1️⃣ Retrieve all books in the *Fiction* genre

```sql
SELECT COUNT(*) AS total_fiction_books
FROM books
WHERE genre = 'Fiction';
```

---

 2️⃣ Find books published after the year 1950

```sql
-- View book details
SELECT *
FROM books
WHERE published_year > 1950;

-- Count of books published after 1950
SELECT COUNT(*) AS total_books_after_1950
FROM books
WHERE published_year > 1950;
```

---

 3️⃣ List all customers from Canada

```sql
SELECT *
FROM buyers
WHERE country = 'Canada';
```

---

4️⃣ Show orders placed in November 2023

```sql
-- Count of orders
SELECT COUNT(*) AS orders_placed_november
FROM order_book_details
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- Order details
SELECT *
FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';
```

---

 5️⃣ Retrieve the total stock of books available

```sql
SELECT SUM(stock) AS total_stock
FROM books;
```

---

 6️⃣ Find the details of the most expensive book

```sql
SELECT *
FROM books
ORDER BY price DESC
LIMIT 1;
```

---

 7️⃣ Show all orders where more than one quantity of a book was ordered

```sql
SELECT *
FROM order_book_details
WHERE quantity > 1;
```

---

 8️⃣ Retrieve all orders where the total amount exceeds $20

```sql
SELECT *
FROM order_book_details
WHERE total_amount > 20;
```

---

9️⃣ List all genres available in the Books table

```sql
SELECT DISTINCT genre
FROM books;
```

---

 🔟 Find the book with the lowest stock

```sql
SELECT *
FROM books
ORDER BY stock ASC
LIMIT 1;
```

---

 1️⃣1️⃣ Calculate the total revenue generated from all orders

```sql
SELECT SUM(total_amount) AS revenue_generated
FROM order_book_details;
```

---

🔹 Advanced SQL QUERIES


1️⃣ Retrieve the total number of books sold for each genre

```sql
SELECT 
    books.genre,
    SUM(order_book_details.Quantity) AS Genre_quantity
FROM order_book_details
JOIN books 
    ON order_book_details.Book_ID = books.Book_ID
GROUP BY books.genre
ORDER BY Genre_quantity DESC;
```

---

 2️⃣ Find the average price of books in the "Fantasy" genre

```sql
SELECT 
    ROUND(AVG(price), 0) AS average_price_fantasy
FROM books
WHERE genre = 'fantasy';
```

---

 3️⃣ List customers who have placed at least 2 orders

```sql
SELECT 
    customer_id, 
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >= 2;
```

---

 4️⃣ Find the most frequently ordered book

```sql
SELECT 
    order_book_details.Book_ID,
    books.Title,
    COUNT(order_book_details.Order_ID) AS book_count
FROM order_book_details
JOIN books 
    ON order_book_details.Book_ID = books.Book_ID
GROUP BY order_book_details.Book_ID, books.Title
ORDER BY book_count DESC
LIMIT 3;
```

---

5️⃣ Show the top 3 most expensive books of the Fantasy genre

```sql
SELECT *
FROM books
WHERE genre = 'fantasy'
ORDER BY price DESC
LIMIT 3;
```

---

 6️⃣ Retrieve the total quantity of books sold by each author

```sql
SELECT 
    books.author,
    SUM(order_book_details.Quantity) AS total_quantity_sold
FROM order_book_details
JOIN books 
    ON order_book_details.Book_ID = books.Book_ID
GROUP BY books.author;
```

---

 7️⃣ List the cities where customers who spent over $300 are located

```sql
SELECT DISTINCT
    buyers.city,
    order_book_details.Total_Amount
FROM buyers
JOIN order_book_details 
    ON buyers.Customer_ID = order_book_details.Customer_ID
WHERE order_book_details.Total_Amount > 300;
```

---

 8️⃣ Find the customer who spent the most on orders

```sql
SELECT 
    buyers.Customer_ID,
    buyers.Name,
    SUM(order_book_details.Total_Amount) AS total_spent
FROM order_book_details
JOIN buyers 
    ON order_book_details.Customer_ID = buyers.Customer_ID
GROUP BY buyers.Customer_ID, buyers.Name
ORDER BY total_spent DESC
LIMIT 5;
```

---

 9️⃣ Calculate the stock remaining after fulfilling all orders

```sql
SELECT 
    books.book_ID,
    books.title,
    books.Stock,
    COALESCE(SUM(order_book_details.quantity), 0) AS order_quantity,
    books.Stock - COALESCE(SUM(order_book_details.quantity), 0) AS remaining_quantity
FROM books
LEFT JOIN order_book_details 
    ON books.Book_ID = order_book_details.Book_ID
GROUP BY books.book_ID
ORDER BY books.book_ID;
```

---


📊 Key Findings & Insights

📚 A small number of genres and authors contribute to a significant portion of total revenue, highlighting strong best-sellers.

👥 Repeat customers play an important role in revenue generation, indicating customer loyalty.

💰 High-value orders contribute disproportionately to overall revenue.

📈 Genre-based analysis helps identify categories with strong growth potential.

📦 Stock-level insights assist in inventory planning and demand forecasting.


 📌 Conclusion

This project demonstrates how SQL can be used as a powerful analytical tool to transform raw transactional data into actionable business insights. It reflects real-world analytical thinking, strong query structuring, and a clear understanding of business impact—making it a strong portfolio project for analytics and consulting roles
