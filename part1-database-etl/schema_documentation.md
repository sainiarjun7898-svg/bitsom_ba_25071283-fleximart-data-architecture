# FlexiMart Database Schema Documentation

## 1. Entity-Relationship Description

### ENTITY: customers  
**Purpose:** Stores customer information.

**Attributes:**
- customer_id: Unique identifier for each customer (Primary Key)  
- first_name: Customer’s first name  
- last_name: Customer’s last name  
- email: Customer’s email address  
- phone: Contact number  
- city: City of residence  
- registration_date: Date of registration  

**Relationships:**
- One customer can place many sales transactions (1:M with sales)

---

### ENTITY: products  
**Purpose:** Stores product details available on FlexiMart.

**Attributes:**
- product_id: Unique product identifier (Primary Key)  
- product_name: Name of the product  
- category: Product category (Electronics, Fashion, Groceries, etc.)  
- price: Price per unit  
- stock_quantity: Available stock  

**Relationships:**
- One product can appear in many sales transactions (1:M with sales)

---

### ENTITY: sales  
**Purpose:** Stores all sales transactions.

**Attributes:**
- transaction_id: Unique transaction identifier (Primary Key)  
- customer_id: References customers(customer_id)  
- product_id: References products(product_id)  
- quantity: Number of units sold  
- unit_price: Price at time of sale  
- transaction_date: Date of transaction  
- status: Completed, Pending, or Cancelled  

**Relationships:**
- Many sales belong to one customer (M:1)  
- Many sales belong to one product (M:1)

---

## 2. Normalization Explanation (3NF)

The FlexiMart database design follows Third Normal Form (3NF). Each table represents a single entity and all non-key attributes depend only on the primary key.  

In the customers table, customer_id uniquely determines first_name, last_name, email, phone, city, and registration_date. There are no partial or transitive dependencies.  

In the products table, product_id determines product_name, category, price, and stock_quantity. All attributes describe only the product and not any other entity.  

In the sales table, transaction_id uniquely identifies each sale and determines customer_id, product_id, quantity, unit_price, transaction_date, and status. Customer and product details are not duplicated here; instead, they are referenced using foreign keys.  

This design avoids update anomalies because customer or product details are stored in only one place. Insert anomalies are avoided because new customers and products can be added without requiring a sale. Delete anomalies are prevented because deleting a sale does not remove customer or product information.

---

## 3. Sample Data Representation

### customers

| customer_id | first_name | last_name | email                  | city      |
|-------------|------------|-----------|------------------------|-----------|
| C001        | Rahul      | Sharma    | rahul.sharma@gmail.com | Bangalore |
| C002        | Priya      | Patel     | priya.patel@yahoo.com  | Mumbai    |

---

### products

| product_id | product_name        | category     | price  |
|------------|---------------------|--------------|--------|
| P001       | Samsung Galaxy S21  | Electronics  | 45999  |
| P004       | Levi's Jeans        | Fashion      | 2999   |

---

### sales

| transaction_id | customer_id | product_id | quantity | unit_price |
|----------------|-------------|------------|----------|------------|
| T001           | C001        | P001       | 1        | 45999      |
| T002           | C002        | P004       | 2        | 2999       |
