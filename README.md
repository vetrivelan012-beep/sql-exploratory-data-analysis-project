SQL Exploratory Data Analysis & Advanced Analytics Project

Exploratory data analysis (EDA) and advanced analytics in SQL Server on a sales data warehouse. The project ends with two reusable SQL views: a Customer Report and a Product Report.

Data Source
The datasets are the Gold layer exported as CSV files from my SQL Data Warehouse Project, which consolidates ERP and CRM data into a star schema.

Files
- gold.dim_customer.csv
- gold.dim_products.csv
- gold.fact_sales.csv

Project Structure
sql-exploratory-data-analysis-project/
├── datasets/
│   ├── gold.dim_customer.csv
│   ├── gold.dim_products.csv
│   └── gold.fact_sales.csv
└── scripts/
    ├── Exploratory Data Analysis/
    │   ├── #1 DATABASE EXPLORATION.sql
    │   ├── #2 DIMENSIONS EXPLORATION.sql
    │   ├── #3 DATE EXPLORATION.sql
    │   ├── #4 MEASURES EXPLORATION.sql
    │   └── #5 MAGNITUDE ANALYSIS.sql
    └── advanced data analytics/
        ├── #1 Change-Over-Time (Trends).sql
        ├── #2 CUMULATIVE ANALYSIS.sql
        ├── #3 PERFORMANCE ANALYSIS.sql
        ├── #4 PART-TO-WHOLE(PROPORTIONAL).sql
        ├── #5 DATA SEGMENTATION.sql
        ├── #6 CUSTOMER REPORT.sql
        └── #7 PRODUCTS REPORT.sql

Part 1: Exploratory Data Analysis
1.Database Exploration - Explores the tables and columns in the database
2.Dimensions Exploration - Explores the categorical fields (customer and product attributes)
3.Date Exploration - Finds the date range and time span of the data
4.Measures Exploration - Calculates the key business metrics (totals, averages, counts)
5.Magnitude Analysis - Compares measures across dimensions (e.g. sales by category or country)

Part 2: Advanced Analytics
1.Change-Over-Time (Trends) - Tracks how sales performance changes over time
2.Cumulative Analysis - Builds running totals to show growth over time
3.Performance Analysis - Compares yearly product performance
4.Part-to-Whole (Proportional) - Shows how much each category contributes to overall sales
5.Data Segmentation - Groups customers and products into segments
6.Customer Report - Final view consolidating key customer metrics
7.Products Report - Final view consolidating key product metrics

Final Deliverables
Customer Report
A SQL view that brings together key customer metrics in one place.

Product Report
A SQL view that brings together key product metrics in one place.

Tools & Skills
SQL Server, T-SQL
Data exploration, trend and cumulative analysis, segmentation
Building reusable reporting views

Author
Arul Vetrivelan (Vetri)
GitHub: vetrivelan012-beep
