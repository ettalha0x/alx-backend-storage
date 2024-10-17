-- Create the users table (if not already exists)
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,    -- Unique user ID
    email VARCHAR(255) NOT NULL,                   -- User's email address
    valid_email BOOLEAN DEFAULT FALSE,             -- Attribute to indicate if email is valid
    name VARCHAR(255)                              -- User's name
);

-- Create the trigger to reset valid_email if email has changed
DELIMITER 1240

CREATE TRIGGER reset_valid_email
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has been changed
    IF NEW.email <> OLD.email THEN
        -- Reset valid_email to FALSE
        UPDATE users
        SET valid_email = FALSE
        WHERE id = NEW.id;
    END IF;
END1240

DELIMITER ;

