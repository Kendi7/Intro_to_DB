-- task_2.sql
-- This script creates all required tables for the alx_book_store database

USE alx_book_store;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books table (foreign key inline)
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL REFERENCES Authors(author_id),
    price DOUBLE NOT NULL,
    publication_date DATE
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- Create Orders table (foreign key inline)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL REFERENCES Customers(customer_id),
    order_date DATE NOT NULL
);

-- Create Order_Details table (foreign keys inline)
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL REFERENCES Orders(order_id),
    book_id INT NOT NULL REFERENCES Books(book_id),
    quantity DOUBLE NOT NULL
);
