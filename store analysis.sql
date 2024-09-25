USE store_analysis_db;
CREATE TABLE store_analysis (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100),
    location VARCHAR(100),
    total_sales DECIMAL(10, 2),
    total_customers INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE properties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    square_meters DECIMAL(10, 2),  -- Adjust size as needed
    area DECIMAL(10, 2),            -- Adjust size as needed
    unit_price_usd DECIMAL(10, 2),  -- Adjust size as needed
    quantity INT DEFAULT 0
);
INSERT INTO properties (name, square_meters, area, unit_price_usd, quantity)
VALUES
('Property A', 300, 300, 150, 5),
('Property B', 600, 600, 200, 3),
('Property C', 800, 800, 250, 2);
DESCRIBE overall;
SELECT
    CASE
        WHEN square_meters < 250 THEN '<250'
        WHEN square_meters BETWEEN 250 AND 500 THEN '250 to 500'
        WHEN square_meters BETWEEN 501 AND 750 THEN '500 to 750'
        WHEN square_meters BETWEEN 751 AND 1000 THEN '750 to 1000'
        WHEN square_meters BETWEEN 1001 AND 1250 THEN '1000 to 1250'
        WHEN square_meters BETWEEN 1251 AND 1500 THEN '1250 to 1500'
        WHEN square_meters BETWEEN 1501 AND 1750 THEN '1500 to 1750'
        WHEN square_meters BETWEEN 1751 AND 2000 THEN '1750 to 2000'
        WHEN square_meters > 2000 THEN '> 2000'
    END AS size_bucket,
    ROUND(SUM(unit_price_usd * quantity), 2) AS total_sales
FROM properties
GROUP BY size_bucket
ORDER BY
    CASE
        WHEN size_bucket = '<250' THEN 1
        WHEN size_bucket = '250 to 500' THEN 2
        WHEN size_bucket = '500 to 750' THEN 3
        WHEN size_bucket = '750 to 1000' THEN 4
        WHEN size_bucket = '1000 to 1250' THEN 5
        WHEN size_bucket = '1250 to 1500' THEN 6
        WHEN size_bucket = '1500 to 1750' THEN 7
        WHEN size_bucket = '1750 to 2000' THEN 8
        WHEN size_bucket = '> 2000' THEN 9
    END
LIMIT 0, 1000;
