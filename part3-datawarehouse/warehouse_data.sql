USE dw_fleximart;

-- -------------------
-- DIM DATE
-- -------------------
INSERT INTO dim_date (full_date, day, month, quarter, year) VALUES
('2024-01-05', 5, 1, 1, 2024),
('2024-01-10', 10, 1, 1, 2024),
('2024-01-15', 15, 1, 1, 2024),
('2024-01-20', 20, 1, 1, 2024),
('2024-01-25', 25, 1, 1, 2024),
('2024-02-05', 5, 2, 1, 2024),
('2024-02-10', 10, 2, 1, 2024),
('2024-02-15', 15, 2, 1, 2024),
('2024-02-20', 20, 2, 1, 2024),
('2024-02-25', 25, 2, 1, 2024);

-- -------------------
-- DIM CUSTOMERS
-- -------------------
INSERT INTO dim_customers (customer_id, first_name, last_name, email, phone, city, registration_date) VALUES
('C001','Rahul','Sharma','rahul@gmail.com','9876543210','Bangalore','2023-01-15'),
('C002','Priya','Patel','priya@yahoo.com','9988776655','Mumbai','2023-02-20'),
('C003','Amit','Kumar','amit@gmail.com','9765432109','Delhi','2023-03-10'),
('C004','Sneha','Reddy','sneha@gmail.com','9123456789','Hyderabad','2023-04-15'),
('C005','Vikram','Singh','vikram@gmail.com','9988112233','Chennai','2023-05-22'),
('C006','Anjali','Mehta','anjali@gmail.com','9876509876','Bangalore','2023-06-18');

-- -------------------
-- DIM PRODUCTS
-- -------------------
INSERT INTO dim_products (product_id, product_name, category, price) VALUES
('P001','Samsung Galaxy S21','Electronics',45999),
('P002','Nike Running Shoes','Fashion',3499),
('P003','Apple MacBook Pro','Electronics',52999),
('P004','Levis Jeans','Fashion',2999),
('P005','Sony Headphones','Electronics',1999),
('P006','Organic Almonds','Groceries',899);

-- -------------------
-- FACT SALES
-- -------------------
INSERT INTO fact_sales (transaction_id, customer_key, product_key, date_key, quantity, unit_price, total_amount) VALUES
('T001',1,1,3,1,45999,45999),
('T002',2,4,2,2,2999,5998),
('T003',3,3,3,1,52999,52999),
('T004',4,2,4,1,3499,3499),
('T005',5,6,5,3,899,2697),
('T006',6,5,6,2,1999,3998);
