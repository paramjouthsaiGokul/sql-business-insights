# SQL Business Insights Project

## 📊 Project Overview

This project uses **Microsoft SQL Server** to analyze transactional order data and generate business insights related to sales, customers, products, profitability, and overall business performance.

The project focuses on converting raw order data into meaningful information that can support business decision-making.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Analyze overall business performance
- Identify sales and profit trends
- Analyze customer purchasing behavior
- Identify high-value customers
- Analyze customer segments
- Evaluate product and category performance
- Identify profitable and less-profitable areas
- Compare sales performance across different regions
- Analyze order and shipping-related metrics
- Apply SQL techniques to solve real-world business questions

---

## 🗂️ Dataset

The project uses a transactional order dataset containing information about:

- Orders
- Customers
- Products
- Sales
- Quantity
- Discount
- Profit
- Customer Segments
- Geography
- Shipping

### Main Columns

| Column | Description |
|---|---|
| `Row_ID` | Unique row identifier |
| `Order_ID` | Order identifier |
| `Order_Date` | Date the order was placed |
| `Ship_Date` | Date the order was shipped |
| `Ship_Mode` | Shipping method |
| `Customer_ID` | Customer identifier |
| `Customer_Name` | Customer name |
| `Segment` | Customer segment |
| `Country_Region` | Country/region |
| `City` | Customer city |
| `State` | Customer state |
| `Postal_Code` | Postal code |
| `Region` | Sales region |
| `Product_ID` | Product identifier |
| `Category` | Product category |
| `Sub_Category` | Product sub-category |
| `Product_Name` | Product name |
| `Sales` | Revenue generated |
| `Quantity` | Units sold |
| `Discount` | Discount applied |
| `Profit` | Profit generated |

---

## 🛠️ Tools & Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

The complete analysis was performed using SQL Server.

---

## 🔍 Data Validation

Before performing business analysis, the dataset was checked for:

- Total number of records
- Number of unique orders
- Number of unique customers
- Number of unique products
- Date ranges
- Invalid shipping dates
- Data consistency
- Transaction-level data grain

An important consideration was that a single order can contain multiple products. Therefore, the number of rows is not necessarily equal to the number of unique orders.

For example:

```sql
COUNT(*)
