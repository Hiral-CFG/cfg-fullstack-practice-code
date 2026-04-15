USE FoodOrdering;

-- ACTIVITY 1 - DEMO
DELIMITER //
CREATE FUNCTION CalculateTotalOrderCost(order_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10,2);

    -- Calculate total cost by summing up the quantity * price for each order item
    SELECT SUM(oi.quantity * mi.price)
    INTO total_cost
    FROM OrderItems oi
    JOIN MenuItems mi ON oi.item_id = mi.item_id
    WHERE oi.order_id = order_id;

    RETURN total_cost;
END //

DELIMITER ;

SELECT CalculateTotalOrderCost(1) AS total_cost;

-- ACTIVITY 2
SELECT 
    o.order_id,
    SUM(oi.quantity * mi.price) AS total_price,
    IF(SUM(oi.quantity * mi.price) > 15, 'Discount available', 'No discount available') AS discount_status
FROM 
    Orders o
JOIN 
    OrderItems oi ON o.order_id = oi.order_id
JOIN 
    MenuItems mi ON oi.item_id = mi.item_id
GROUP BY 
    o.order_id;
   
-- ACTIVITY 3
DELIMITER //

CREATE PROCEDURE UpdateMenuItemPrice(IN item_id INT, IN new_price DECIMAL(10,2))
BEGIN
    -- Update the price of the menu item
    UPDATE MenuItems
    SET price = new_price
    WHERE item_id = item_id;
END //

DELIMITER ;

CALL UpdateMenuItemPrice(1, 6.99);

-- ACTIVITY 4
DELIMITER $$

CREATE TRIGGER SetCreatedAtBeforeInsert
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    SET NEW.order_date = NOW();
END $$

DELIMITER ;

INSERT INTO Orders (order_id, customer_id) 
VALUES (6, 1);

SELECT * FROM Orders;

-- ACTIVITY 5

DELIMITER $$

CREATE EVENT MarkItemsAsUnavailable
ON SCHEDULE EVERY 1 DAY
STARTS '2025-04-01 00:00:00'  -- Specify the starting date and time
DO
BEGIN
    UPDATE MenuItems
    SET availability = FALSE
    WHERE item_id NOT IN (
        SELECT DISTINCT oi.item_id
        FROM OrderItems oi
        JOIN Orders o ON oi.order_id = o.order_id
        WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY
    );
END $$

DELIMITER ;

SHOW EVENTS;

DROP EVENT IF EXISTS MarkItemsAsUnavailable;









