USE FoodOrdering;

-- ACTIVITY 1

-- DEMO
SELECT c.first_name, c.last_name, o.order_id, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- 1.1
SELECT c.first_name, c.last_name, o.order_id, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;


-- 1.2
SELECT mi.name AS item_name, oi.quantity
FROM OrderItems oi
JOIN MenuItems mi ON oi.item_id = mi.item_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.customer_id = 3;


-- 1.3
SELECT c.first_name, c.last_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- ACTIVITY 2
-- 2.1
SELECT c.first_name, c.last_name, o.order_id, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- 2.2 
SELECT mi.name AS item_name, o.order_id, o.order_date
FROM MenuItems mi
LEFT JOIN OrderItems oi ON mi.item_id = oi.item_id
LEFT JOIN Orders o ON oi.order_id = o.order_id;

-- 2.3
SELECT o.order_id, o.order_date, mi.name AS item_name
FROM Orders o
RIGHT JOIN OrderItems oi ON o.order_id = oi.order_id
RIGHT JOIN MenuItems mi ON oi.item_id = mi.item_id;

-- ACTIVITY 3
-- DEMO
CREATE VIEW CustomerOrderSummary AS
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,    -- Full name of the customer
    COUNT(o.order_id) AS total_orders,                      -- Total number of orders
    SUM(oi.quantity) AS total_quantity_ordered              -- Total quantity ordered
FROM 
    Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id        -- Join Customers with Orders
LEFT JOIN OrderItems oi ON o.order_id = oi.order_id        -- Join Orders with OrderItems
GROUP BY 
    c.customer_id, c.first_name, c.last_name;              -- Group by customer to aggregate data

SELECT * FROM CustomerOrderSummary;

-- ACTIVITY
-- 3.1
CREATE VIEW PopularItemsView AS
SELECT 
    mi.name AS item_name,                           -- Item name
    SUM(oi.quantity) AS total_quantity_ordered      -- Total quantity ordered
FROM 
    MenuItems mi
JOIN OrderItems oi ON mi.item_id = oi.item_id       -- Join MenuItems with OrderItems
GROUP BY 
    mi.item_id, mi.name;                            -- Group by item to aggregate the total quantity ordered

SELECT * FROM PopularItemsView;
    
-- 3.2
CREATE VIEW CustomerSpendingSummary AS
SELECT 
    c.customer_id,                                            -- Customer ID
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,  -- Customer full name
    SUM(oi.quantity * mi.price) AS total_spent,               -- Total amount spent by customer
    COUNT(o.order_id) AS total_orders                         -- Total number of orders placed by customer
FROM 
    Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id          -- Join Customers with Orders
LEFT JOIN OrderItems oi ON o.order_id = oi.order_id          -- Join Orders with OrderItems
LEFT JOIN MenuItems mi ON oi.item_id = mi.item_id            -- Join OrderItems with MenuItems to get item prices
GROUP BY 
    c.customer_id, c.first_name, c.last_name;                -- Group by customer to aggregate data

SELECT * FROM CustomerSpendingSummary;

-- ACTIVITY 4
-- 4.1
SELECT 
    (SELECT SUM(oi.quantity * mi.price) 
     FROM OrderItems oi
     JOIN MenuItems mi ON oi.item_id = mi.item_id) AS total_revenue;

-- 4.2
SELECT 
    mi.name AS item_name, 
    mi.price AS item_price
FROM 
    MenuItems mi
WHERE 
    mi.price = (SELECT MAX(price) FROM MenuItems);

    
-- 4.3
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    (SELECT MAX(o.order_date) 
     FROM Orders o 
     WHERE o.customer_id = c.customer_id) AS most_recent_order_date
FROM 
    Customers c;
 

