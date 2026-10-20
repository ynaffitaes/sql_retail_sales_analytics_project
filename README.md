# Retail Sales Analytics

An end-to-end retail analytics project using Python, SQL and Google BigQuery to transform raw transactional data into actionable business insights.

## Project Overview

This project analyzes retail sales data to understand customer behavior, revenue performance, product performance, and customer churn.

The workflow combines data engineering and business analytics:

- Data cleaning and preprocessing in Python
- Feature engineering and data transformation
- Star schema design
- Data warehousing in BigQuery
- SQL-based business analysis
- Executive-level business recommendations

---

## Technologies Used

- Python
- Pandas
- NumPy
- Google BigQuery
- SQL
- Git
- GitHub

---

## Data Pipeline

### 1. Data Cleaning

The raw dataset was cleaned and standardized using Python by:

- Handling missing values
- Removing duplicates
- Correcting data types
- Standardizing column names

### 2. Feature Engineering

New analytical features were created, including:

- Age Groups
- Date Features

### 3. Data Modeling

A Star Schema was implemented in BigQuery:

#### Fact Table

- fact_orders

#### Dimension Tables

- dim_customer
- dim_product
- dim_date
- dim_payment
- fact_orders

---

## Analytical Areas

### Executive Revenue Analysis

Key metrics evaluated:

- Total Revenue
- Total Orders
- Unique Customers
- Average Order Value (AOV)
- Average Revenue per Customer
- Year-over-Year Revenue Trends
- Month-over-Month Revenue Trends

### Customer Analysis

Key questions:

- Who are the highest-value customers?
- Which age groups generate the most revenue?
- How does spending vary by gender?
- What percentage of customers churn?

### Product Analysis

Key questions:

- Which product categories generate the most revenue?
- Which categories sell the highest quantities?
- Which categories are growing fastest?
- How is revenue distributed across products?

### Churn Analysis

Key questions:

- What is the churn rate?
- Which customer segments churn the most?
- What revenue is associated with churn?
- Which product categories experience the highest churn?

---

## Main Insights

- Customers aged 55+ generate the highest revenue.
- Average Order Value: 2,725.39
- Average Revenue per Customer: 13,719.95
- 2020 was the highest revenue year.
- August was the best-performing month.
- Clothing is the fastest-growing category.
- Approximately 20% of customers have churned.
- Revenue is evenly distributed across product categories.

---

## Business Recommendations

Based on the analysis, recommendations focused on:

- Customer retention
- Churn reduction
- Growth of high-performing product categories
- Seasonal sales planning
- Customer lifetime value optimization

---

## Presentation

A complete business findings and recommendations presentation is included in this repository:

`Retail Analytics Findings & Recommendations.pptx`

---



## Author

Aram Samb
