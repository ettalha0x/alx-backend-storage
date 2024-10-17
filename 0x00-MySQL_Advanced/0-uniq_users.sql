-- Create the users table only if it doesn't already exist
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- id: integer, not null, auto-increment, primary key
    email VARCHAR(255) NOT NULL UNIQUE,          -- email: string (255 chars), not null, unique
    name VARCHAR(255)                            -- name: string (255 chars)
);

