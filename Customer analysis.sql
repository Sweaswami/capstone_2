USE customer_analysis_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender VARCHAR(10),
    birthdate DATE,
    created_at TIMESTAMP
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),  -- Adjust as necessary
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT gender, COUNT(*) AS Count_gender
FROM customers
GROUP BY gender
LIMIT 0, 1000;
SELECT gender, COUNT(*) AS Count_gender
FROM customers
GROUP BY gender;
CREATE TABLE overall (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    Order_date DATE,
    birthday DATE
);           
-- Insert 7518 female customers
INSERT INTO customers (customer_id, gender)
VALUES
(1, 'Female'),
(2, 'Female'),
-- Add more rows as needed up to 7518...
-- Insert 7748 male customers
(7519, 'Male'),
(7520, 'Male');
-- Add more rows as needed up to 7748...
CREATE TABLE gender_count (
    gender VARCHAR(10),
    count INT
);
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
INSERT INTO gender_count (gender, count)
VALUES
('Female', 7518),
('Male', 7748);
UPDATE gender_count
SET count = 8000
WHERE gender = 'Female';
UPDATE gender_count
SET count = 7748
WHERE gender = 'Male';

ALTER TABLE gender_count
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
-- countery wise customer count
DESCRIBE CUSTOMERS;
SELECT * FROM gender_count;
SELECT 
    continent, country, state, city, 
    COUNT(customer_id) AS customer_count
FROM 
    CUSTOMERS
GROUP BY 
    continent, country, state, city
ORDER BY 
    customer_count DESC
LIMIT 0, 1000;
