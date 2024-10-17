-- Create the items table (if not already exists)
CREATE TABLE IF NOT EXISTS items (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,   -- Unique ID for each item
    name VARCHAR(255) NOT NULL,                   -- Item name
    quantity INT NOT NULL                         -- Item quantity, can be negative
);

-- Create the orders table (if not already exists)
CREATE TABLE IF NOT EXISTS orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,   -- Unique ID for each order
    item_id INT NOT NULL,                         -- ID of the item being ordered
    order_quantity INT NOT NULL,                  -- Quantity ordered
    FOREIGN KEY (item_id) REFERENCES items(id)    -- Foreign key linking orders to items
);

-- Create the trigger that decreases the quantity of an item after a new order is added
DELIMITER 1240

CREATE TRIGGER decrease_quantity_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Update the quantity in the items table, subtracting the ordered quantity
    UPDATE items
    SET quantity = quantity - NEW.order_quantity
    WHERE id = NEW.item_id;
END1240

DELIMITER ;

