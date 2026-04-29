-- Create ecommerce database

CREATE DATABASE ecommerce;

-- Use the database
USE ecommerce;

-- Table to store customer details
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address TEXT
);

-- Table to store product details
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    description TEXT
);

-- Table to store order details
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create Order_Items table for database normalization
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert sample customers
INSERT INTO customers (name, email, address) VALUES
('Himanshu Saini', 'himanshu@example.com', 'Gurgaon, Haryana'),
('Rahul Sharma', 'rahul@example.com', 'Delhi, India'),
('Priya Verma', 'priya@example.com', 'Mumbai, India');

-- Insert 10 sample products
INSERT INTO products (name, price, description) VALUES
('Product A', 100.00, 'Basic product'),
('Product B', 150.00, 'Standard product'),
('Product C', 200.00, 'Advanced product'),
('Product D', 250.00, 'Premium product'),
('Product E', 300.00, 'High-end product'),
('Product F', 120.00, 'Affordable product'),
('Product G', 180.00, 'Mid-range product'),
('Product H', 220.00, 'Quality product'),
('Product I', 275.00, 'Luxury product'),
('Product J', 350.00, 'Top-tier product');


-- Insert sample orders
-- Insert orders from current month (starting from 10th)
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, DATE_FORMAT(CURDATE(), '%Y-%m-10'), 100.00),
(2, DATE_FORMAT(CURDATE(), '%Y-%m-11'), 150.00),
(3, DATE_FORMAT(CURDATE(), '%Y-%m-12'), 200.00),
(1, DATE_FORMAT(CURDATE(), '%Y-%m-13'), 250.00),
(2, DATE_FORMAT(CURDATE(), '%Y-%m-14'), 300.00),
(3, DATE_FORMAT(CURDATE(), '%Y-%m-15'), 120.00),
(1, DATE_FORMAT(CURDATE(), '%Y-%m-16'), 180.00),
(2, DATE_FORMAT(CURDATE(), '%Y-%m-17'), 220.00),
(3, DATE_FORMAT(CURDATE(), '%Y-%m-18'), 275.00),
(1, DATE_FORMAT(CURDATE(), '%Y-%m-19'), 350.00);
-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 100.00),
(1, 2, 1, 150.00),
(2, 3, 1, 200.00),
(3, 4, 2, 250.00),
(4, 5, 1, 300.00),
(5, 6, 3, 120.00),
(6, 7, 1, 180.00),
(7, 8, 2, 220.00),
(8, 9, 1, 275.00),
(9, 10, 1, 350.00);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;


-- Get customers who placed orders in last 30 days
SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- Calculate total order amount per customer
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;

-- Update price of Product C to 45
UPDATE products
SET price = 45.00
WHERE name = 'OnePlus 12';

-- Add discount column to products table
ALTER TABLE products
ADD discount DECIMAL(5,2) DEFAULT 0;


-- Get top 3 products by highest price
SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;

-- Get customers who ordered Product A
SELECT DISTINCT c.name AS customer_name
FROM   customers   c
JOIN   orders      o  ON o.customer_id = c.id
JOIN   order_items oi ON oi.order_id   = o.id
JOIN   products    p  ON p.id          = oi.product_id
WHERE  p.name = 'Product A';

-- Join customers and orders
SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- Get orders where total amount is greater than 150
SELECT *
FROM orders
WHERE total_amount > 150.00;


-- Calculate average order value
SELECT AVG(total_amount) AS avg_order_value
FROM orders;

