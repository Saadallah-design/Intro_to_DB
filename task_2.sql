-- Switch to the target database. This command ensures all subsequent CREATE TABLE
-- statements are executed within the 'alx_book_store' schema.
USE alx_book_store;

-- 1. Create the Authors table
-- This table is created first because it is a dependency for the Books table.
CREATE TABLE Authors (
    -- MySQL standard primary key definition: Integer, cannot be NULL, automatically increments.
    author_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. Create the Books table
-- References the Authors table via the author_id foreign key.
CREATE TABLE Books (
    book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    -- Column to hold the foreign key reference
    author_id INT,
    price DECIMAL(10, 2) NOT NULL, -- DECIMAL is more precise than NUMERIC for financial data
    publication_date DATE,
    -- Explicitly define the foreign key constraint
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. Create the Customers table
-- This table is a dependency for the Orders table.
CREATE TABLE Customers (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE, -- Emails should typically be unique
    address TEXT
);

-- 4. Create the Orders table
-- References the Customers table via the customer_id foreign key.
CREATE TABLE Orders (
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- Define the customer_id column before referencing it as a foreign key
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    -- Explicitly define the foreign key constraint
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Create the Order_Details table
-- This is a junction table handling the many-to-many relationship between Orders and Books.
CREATE TABLE Order_Details (
    order_detail_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    -- Explicitly define the foreign key constraints
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
