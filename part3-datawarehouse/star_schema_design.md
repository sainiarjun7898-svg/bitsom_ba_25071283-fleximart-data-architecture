# FlexiMart Data Warehouse – Star Schema Design

## 1. Overview
This document describes the star schema design for the FlexiMart Data Warehouse.
The warehouse is designed to support analytical queries such as sales trends,
top products, customer behavior, and category performance.

The design follows a classic star schema with one central fact table and multiple
dimension tables.

---

## 2. Fact Table

### fact_sales
This table stores measurable business data.

Attributes:
- sales_key (Primary Key)
- transaction_id
- customer_key (FK)
- product_key (FK)
- date_key (FK)
- quantity
- unit_price
- total_amount

This table is used for revenue analysis, trends, and performance tracking.

---

## 3. Dimension Tables

### dim_customers
- customer_key (Primary Key)
- customer_id
- first_name
- last_name
- email
- phone
- city
- registration_date

Purpose: Customer segmentation and geographic analysis.

---

### dim_products
- product_key (Primary Key)
- product_id
- product_name
- category
- price

Purpose: Product and category performance analysis.

---

### dim_date
- date_key (Primary Key)
- full_date
- day
- month
- quarter
- year

Purpose: Time-based analysis (daily, monthly, yearly trends).

---

## 4. Star Schema Structure

fact_sales is the central table connected to:

- dim_customers
- dim_products
- dim_date

Each dimension connects only to the fact table, forming a star-like structure.

---

## 5. Why Star Schema?

- Simple and fast queries  
- Optimized for reporting & BI tools  
- Easy aggregation (SUM, AVG, COUNT)  
- Ideal for AI feature generation and dashboards  

---

## 6. Use Cases

- Monthly sales trend  
- Top selling products  
- Category revenue contribution  
- City-wise customer behavior  
- Forecasting and machine learning pipelines  

---

## 7. Conclusion

This star schema provides a scalable and analytics-friendly foundation for FlexiMart’s
data warehouse and AI data pipelines.
