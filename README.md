# Zepto-SQL-Analysis

## Project Overview
This project performs data analysis on an e-commerce dataset, utilizing SQL queries to extract insights into product performance, inventory, and pricing strategies.

## Files Included
- zepto_v2.csv: Raw product data.
- zepto_query.sql: SQL script for database setup, data cleaning, and analysis.

## Dataset Description
The dataset contains product details including category, name, MRP, discount, quantity, and stock status.

## Database Setup
The analysis is conducted using a MySQL database, where the zepto_v2.csv data is loaded into a table.

## Data Exploration & Cleaning
Initial data exploration involved checking for null values, duplicates, and distinct categories. Cleaning focused on correcting invalid price and weight entries.

## Key Insights & Analysis
The SQL queries generated insights such as:
- Top discounted products and categories.
- Estimated category-wise revenue.
- Analysis of out-of-stock products.
- Price per gram calculations and product weight categorization.
- Comparison of discounts for in-stock vs. out-of-stock items.
