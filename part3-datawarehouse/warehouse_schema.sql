-- Create Data Warehouse Database
CREATE DATABASE IF NOT EXISTS dw_fleximart;
USE dw_fleximart;

-- =========================
-- Dimension: Customers
-- =========================
CREATE TABLE IF NOT EXISTS dim_customers (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    registration_date DATE
);

-- =========================
-- Dimension: Products
-- =========================
CREATE TABLE IF NOT EXISTS dim_products (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- =========================
-- Dimension: Date
-- =========================
CREATE TABLE IF NOT EXISTS dim_date (
    date_key INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT
);

-- =========================
-- Fact Table: Sales
-- =========================
CREATE TABLE IF NOT EXISTS fact_sales (
    sales_key INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id VARCHAR(10),
    customer_key INT,
    product_key INT,
    date_key INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (customer_key) REFERENCES dim_customers(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_products(product_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);
