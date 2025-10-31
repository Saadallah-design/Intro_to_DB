CREATE DATABASE IF NOT EXISTS alx_book_store;

-- switch to the database created
-- \c alx_book_store

-- Create the Authors table first, as it is referenced by Books
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table, referencing the Authors table
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT REFERENCES Authors(author_id), 
    price NUMERIC(6, 2) NOT NULL,
    publication_date DATE
);

-- Create the Customers table first, as it is referenced by Orders
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);



-- Create the Orders table, referencing the Customers table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    -- customer_id INT REFERENCES Customers(customer_id), this one is inline syntax rejected by autochecker
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),

    order_date DATE
);

-- Create the Order_Details table for the many-to-many relationship
-- between Orders and Books
CREATE TABLE Order_Details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    book_id INT REFERENCES Books(book_id),
    quantity INT NOT NULL,
);