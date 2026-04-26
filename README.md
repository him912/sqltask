# 🛒 Ecommerce Database (MySQL)

## 📌 Overview

This project contains a simple **Ecommerce Database schema** built using MySQL.
It demonstrates table creation, relationships, normalization, and basic SQL queries.

---

## 🧱 Database Structure

### 1. Customers Table

Stores customer information:

* `id` (Primary Key)
* `name`
* `email`
* `address`

### 2. Products Table

Stores product details:

* `id` (Primary Key)
* `name`
* `price`
* `description`

### 3. Orders Table

Stores order details:

* `id` (Primary Key)
* `customer_id` (Foreign Key → customers.id)
* `order_date`
* `total_amount`

### 4. Order_Items Table (Normalization)

Stores products inside each order:

* `id` (Primary Key)
* `order_id` (Foreign Key → orders.id)
* `product_id` (Foreign Key → products.id)
* `quantity`
* `price`

---

## 🔗 Relationships

* One **customer** can have multiple **orders**
* One **order** can have multiple **products**
* One **product** can belong to multiple **orders**

---

## 🚀 Setup Instructions

### 1. Create Database

```sql
CREATE DATABASE ecommerce;
USE ecommerce;
```

### 2. Create Tables

Run the SQL scripts to create:

* customers
* products
* orders
* order_items

### 3. Insert Data

Insert sample data for testing:

* Customers
* Products
* Orders
---
