import pandas as pd
import mysql.connector

print("ETL Pipeline Started")

# ========== STEP 1: EXTRACT ==========
customers = pd.read_csv("data/customers_raw.csv")
products = pd.read_csv("data/products_raw.csv")
sales = pd.read_csv("data/sales_raw.csv")
# ========== BASIC CLEANING ==========
customers = customers.fillna("")
products = products.fillna(0)
sales = sales.dropna(subset=["customer_id", "product_id"])

print("CSV files loaded successfully")

# ========== STEP 2: CONNECT TO MYSQL ==========
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Root@123",   # 👈 यहां अपना MySQL password डालना
    database="fleximart_db"
)

cursor = conn.cursor()
print("Connected to MySQL database")

# ========== STEP 3: LOAD CUSTOMERS ==========
for _, row in customers.iterrows():
    sql = """
    INSERT IGNORE INTO customers 
    (customer_id, first_name, last_name, email, phone, city, registration_date)
    VALUES (%s,%s,%s,%s,%s,%s,%s)
    """
    cursor.execute(sql, tuple(row))

conn.commit()
print("Customers data inserted")

# ========== STEP 4: LOAD PRODUCTS ==========
for _, row in products.iterrows():
    sql = """
    INSERT IGNORE INTO products
    (product_id, product_name, category, price, stock_quantity)
    VALUES (%s,%s,%s,%s,%s)
    """
    cursor.execute(sql, tuple(row))

conn.commit()
print("Products data inserted")

# ========== STEP 5: LOAD SALES ==========
for _, row in sales.iterrows():
    sql = """
    INSERT IGNORE INTO sales
    (transaction_id, customer_id, product_id, quantity, unit_price, transaction_date, status)
    VALUES (%s,%s,%s,%s,%s,%s,%s)
    """
    cursor.execute(sql, tuple(row))

conn.commit()
print("Sales data inserted")

cursor.close()
conn.close()

print("ETL PIPELINE COMPLETED SUCCESSFULLY ✅")
