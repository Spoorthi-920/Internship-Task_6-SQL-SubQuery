-- Task 6: SQL subqueries
-- Understanding sub-queries
CREATE DATABASE task_6;
USE task_6;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name, city) VALUES
(1, 'Aarav', 'Bengaluru'),
(2, 'Diya', 'Hyderabad'),
(3, 'Kabir', 'Mumbai'),
(4, 'Ananya', 'Chennai'),
(5, 'Rohan', 'Delhi');

INSERT INTO Orders (order_id, customer_id, order_amount, order_date) VALUES
(101, 1, 3500.50, '2024-05-01'),
(102, 1, 1800.00, '2024-06-15'),
(103, 2, 2200.75, '2024-05-20'),
(104, 3, 5000.00, '2024-07-01'),
(105, 3, 1200.00, '2024-08-10'),
(106, 4, 4100.25, '2024-03-05'),
(107, 5, 900.00, '2024-01-12');


-- Scalar Subquery
-- High value customer: Find the customer who placed the highest value order.
SELECT customer_name
FROM Customers
WHERE customer_id = (
    SELECT customer_id
    FROM Orders
    ORDER BY order_amount DESC
    LIMIT 1
);

-- Subquery with IN
-- List customers who have placed at least one order.
SELECT customer_name
FROM Customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM Orders
);


-- Subquery with EXISTS
-- Find customers who have not placed any orders.
SELECT customer_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);


-- Correlated Subquery
-- Show the latest order amount for each customer.
SELECT c.customer_name,
       (
         SELECT o.order_amount
         FROM Orders o
         WHERE o.customer_id = c.customer_id
         ORDER BY o.order_date DESC
         LIMIT 1
       ) AS latest_order_amount
FROM Customers c;


-- Subquery in FROM 
-- Find customers whose average order amount is higher than the overall average
SELECT customer_name, avg_amount
FROM (
    SELECT c.customer_name, AVG(o.order_amount) AS avg_amount
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
) AS customer_avg
WHERE avg_amount > (SELECT AVG(order_amount) FROM Orders);


-- ALL Usage
-- Find customers whose every order is above 1000.
SELECT customer_name
FROM Customers c
WHERE 1000 < ALL (
    SELECT o.order_amount
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);





