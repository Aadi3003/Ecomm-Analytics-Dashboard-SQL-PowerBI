# Ecommerce SQL Analytics

## Overview
This project analyses e-commerce transaction data using SQL to extract business insights around revenue, customer behaviour, and order lifecycle.

## Key SQL Analysis
The core of this project lies in SQL-based KPI generation.

📄 View full queries: `/sql/kpi_queries.sql`

### Business Problems Solved
* Identify **top customers by revenue contribution**
* Analyse **revenue distribution across product categories**
* Track **order lifecycle (delivered, pending, cancelled)**
* Measure **payment success rate**

## Key Insights
* Total Revenue (Delivered Orders): ₹77K
* Payment Success Rate: 80%
* High revenue concentration among top customers
* Category-level revenue variation observed
* Pending and cancelled orders highlight operational gaps

## Sample SQL Query

```sql
-- Top Customers by Revenue
SELECT 
    u.name,
    SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.status = 'delivered'
GROUP BY u.name
ORDER BY total_spent DESC;
```

## Workflow
1. Data cleaned and structured using SQL
2. KPIs derived through analytical queries
3. Results visualised using Power BI

## Tech Stack

* SQL (MySQL)
* Power BI (Data modelling, DAX, visualisation)

## Project Structure

* `data/` → Raw datasets (CSV)
* `sql/` → SQL queries for KPI analysis
* `powerbi/` → Dashboard file (.pbix)

## Dashboard (Supporting)
Power BI dashboard available in `/powerbi/` for visualisation of SQL-derived insights.
