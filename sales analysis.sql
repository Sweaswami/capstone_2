USE sales_analysis_db;
CREATE TABLE sales_analysis (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    sale_date DATE,
    quantity_sold INT,
    total_sale_amount DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SHOW TABLES;
CREATE TABLE overall (
    order_date DATETIME,
    unit_price_usd DECIMAL(10, 2),
    quantity INT
);
SELECT MONTHNAME(order_date) AS month, 
       ROUND(SUM((unit_price_usd) * quantity), 2) AS total_revenue_USD  
FROM overall  
GROUP BY MONTHNAME(order_date)  
LIMIT 0, 1000;

SELECT
  MONTHNAME(order_date) AS month,
  ROUND(SUM((unit_price_usd)*quantity),2) AS total_revenue_USD
FROM
  overall
GROUP BY
  MONTHNAME(order_date);
  
  CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10, 2),
    quantity_sold INT DEFAULT 0
);  
INSERT INTO products (product_name, category, price, quantity_sold)
VALUES
('Product A', 'Category 1', 10.00, 150),
('Product B', 'Category 1', 15.50, 200),
('Product C', 'Category 2', 20.00, 100),
('Product D', 'Category 2', 25.00, 80),
('Product E', 'Category 3', 30.00, 60);

SELECT
    product_name,
    SUM(price * quantity_sold) AS total_revenue
FROM products
GROUP BY product_name
ORDER BY total_revenue DESC;

DESCRIBE overall;
INSERT INTO products (product_name, category, price, quantity_sold)
VALUES
('Smartphone', 'Electronics', 699.99, 150),
('Laptop', 'Electronics', 1299.99, 80),
('Headphones', 'Accessories', 199.99, 200),
('Smartwatch', 'Wearables', 249.99, 120),
('Camera', 'Photography', 899.99, 60);
ALTER TABLE overall
ADD COLUMN storekey INT,
ADD COLUMN product_id INT;  -- Assuming you want to link to the products table
SELECT
  storekey,
  ROUND(SUM(unit_price_usd * quantity), 2) AS total_revenue_USD
FROM
  overall
GROUP BY
  storekey
ORDER BY
  total_revenue_USD DESC;
  
SELECT
    p.product_name,
    ROUND(SUM(o.unit_price_usd * o.quantity), 2) AS total_revenue_USD
FROM
    overall o
JOIN
    products p ON o.product_id = p.product_id  -- Correctly joining the tables
GROUP BY
    p.product_name
ORDER BY
    total_revenue_USD DESC
LIMIT 10;
SELECT
    product_name,
    SUM(price * quantity_sold) AS total_revenue
FROM products
GROUP BY product_name
ORDER BY total_revenue DESC;
SELECT
    p.product_name,
    ROUND(SUM(o.unit_price_usd * o.quantity), 2) AS total_revenue_USD
FROM
    overall o
JOIN
    products p ON o.product_id = p.product_id  -- Use the correct foreign key relationship
GROUP BY
    p.product_name
ORDER BY
    total_revenue_USD DESC
LIMIT 10;
-- sales by stores
SELECT
  storekey,
  ROUND(SUM((unit_price_usd)*quantity),2) AS total_revenue_USD
FROM
  overall
GROUP BY
  storekey
order by total_revenue_USD desc
