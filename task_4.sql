-- The standard command to get the description of tables is to use DESCRIBE Authors etc

-- This script retrieves the structure of all primary tables
-- in the alx_book_store database without using DESCRIBE or EXPLAIN.

-- Get the structure of the Books table

SHOW COLUMNS FROM Books;


-- SHOW COLUMNS FROM Authors;
-- SHOW COLUMNS FROM Customers;
-- SHOW COLUMNS FROM Orders;
-- SHOW COLUMNS FROM Order_Details;