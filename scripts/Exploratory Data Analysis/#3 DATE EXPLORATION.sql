-- SPECIAL DIMENSIONS
-- Find the date of the first and last order
-- How many years of sales are availabe
SELECT 
MIN(order_date) first_order,
MAX(order_date) last_order,
DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) order_range_years
FROM gold.fact_sales

-- Find the yougest and oldest customers
SELECT
MIN(birth_date) oldest_birth_date,
DATEDIFF(YEAR,MIN(birth_date), GETDATE()) oldest_customer_age,
MAX(birth_date) youngest_birth_date,
DATEDIFF(YEAR,MAX(birth_date), GETDATE()) youngest_customer_age
FROM gold.dim_customers
