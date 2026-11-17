-- Find the Total Sales
SELECT sum(sales_amount) AS total_sales FROM gold.fact_sales

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

-- Find the average selling price
SELECT AVG(price) AS average_price FROM gold.fact_sales

-- Find the total number of Orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales  --[important note: avoid repeats]

-- Find the total number of products
SELECT COUNT(product_id) AS total_products FROM gold.dim_products

-- Find the total number of customers
SELECT COUNT(customer_id) AS total_customers FROM gold.dim_customers

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customer_order FROM gold.dim_customers 

-- Generate a Report that shows all key metrics of the buisness
SELECT 'Total_Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total_Quantity' AS measure_name, SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average_Price' AS measure_name, AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total_Orders' AS measure_name, COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales 
UNION ALL
SELECT 'Total_Products' AS measure_name, COUNT(product_id) AS measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total_Customers' AS measure_name, COUNT(customer_id) AS measure_value FROM gold.dim_customers
UNION ALL
SELECT 'Total_Customers_Ordered' AS measure_name, COUNT(DISTINCT customer_key) AS total_customer_order FROM gold.dim_customers
