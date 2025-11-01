-- The standard command to get the description of tables is to use DESCRIBE Authors etc

-- This script retrieves the structure of all primary tables
-- in the alx_book_store database without using DESCRIBE or EXPLAIN.

-- Now using Advanced Schema Query
-- This statement works by querying MySQL's own internal metadata dictionary, which is stored in a special database called INFORMATION_SCHEMA. Think of INFORMATION_SCHEMA as the central library containing the blueprint for every database and table on your server.

-- Script for books full description
USE alx_book_store;

-- Show the full description of the books table
SELECT 
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'books' AND TABLE_SCHEMA = 'alx_book_store'
ORDER BY ORDINAL_POSITION;




-- =========================================
-- This one below didn't work with the autochecker
-- Get the structure of the Books table
-- SHOW COLUMNS FROM books;
-- SHOW COLUMNS FROM Authors;
-- SHOW COLUMNS FROM Customers;
-- SHOW COLUMNS FROM Orders;
-- SHOW COLUMNS FROM Order_Details;