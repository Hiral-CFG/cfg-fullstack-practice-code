USE FoodOrdering;

-- ACTIVITY 2
-- DATA
INSERT INTO MenuItems
VALUES
(1, 'Pizza', 'Cheese and tomato pizza', 9.99, TRUE),
(2, 'Burger', 'Beef burger with lettuce and tomato', 6.99, TRUE),
(3, 'Pasta', 'Spaghetti with marinara sauce', 7.49, FALSE),
(4, 'Salad', 'Fresh mixed greens with vinaigrette', 4.99, TRUE),
(5, 'Soup', 'Tomato soup with croutons', 3.49, FALSE);

-- 2.1
SELECT name AS Item_Name, price AS Cost
FROM MenuItems;

-- 2.2
SELECT name AS Item_Name, price AS Cost
FROM MenuItems;

-- ACTIVITY 3
-- 3.1
SELECT name AS Item_Name, price AS Cost
FROM MenuItems
WHERE price > 5;

-- 3.2
SELECT name AS Item_Name, price AS Cost
FROM MenuItems
WHERE price < 5 AND availability = TRUE;


-- ACTIVITY 4
INSERT INTO Customers 
VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', '2024-01-15'),
(2, 'Bob', 'Smith', 'bob@example.com', '2024-02-20'),
(3, 'Charlie', 'Brown', 'charlie@example.com', '2024-03-10');

INSERT INTO Orders 
VALUES
(1, 1, '2024-04-01'),  
(2, 2, '2024-04-01'),  
(3, 3, '2024-03-30'), 
(4, 1, '2024-04-05'), 
(5, 2, '2024-04-04');  

-- 4.1
UPDATE MenuItems
SET availability = FALSE
WHERE name = 'Pizza';

-- 4.2 
SELECT order_id, customer_id, order_date
FROM Orders
ORDER BY order_date DESC
LIMIT 2;

-- ACTIVITY 5
INSERT INTO OrderItems 
VALUES
(1, 1, 1, 2), 
(2, 2, 2, 3),  
(3, 3, 3, 1), 
(4, 4, 1, 1),  
(5, 5, 2, 2); 

-- 5.1 
SELECT AVG(price) AS average_price
FROM MenuItems;

-- 5.2
SELECT SUM(quantity) AS total_quantity
FROM OrderItems;

-- 5.3
-- Most expensive item
SELECT name, price
FROM MenuItems
ORDER BY price DESC
LIMIT 1;

-- Cheapest item
SELECT name, price
FROM MenuItems
ORDER BY price ASC
LIMIT 1;

-- ACTIVITY 6
-- 6.1
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;

-- 6.2
SELECT order_date, COUNT(order_id) AS order_count
FROM Orders
GROUP BY order_date
ORDER BY order_count DESC
LIMIT 1;

-- 6.3
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;

-- ACTIVITY 7
-- 7.1
SELECT DISTINCT item_id
FROM OrderItems;

-- 7.2
SELECT DISTINCT customer_id
FROM Orders;

-- 7.3
SELECT DISTINCT order_date
FROM Orders;

-- ACTIVITY 8 (optional)
-- 8.1
SELECT TRIM(first_name) AS cleaned_name
FROM Customers;

-- 8.2 
SELECT LOWER(name) AS standardised_name
FROM MenuItems;

-- 8.3
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Customers;
 

