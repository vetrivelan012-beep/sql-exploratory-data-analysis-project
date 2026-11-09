--Intro: Analyze how a measure evolves over time. Helps track trends and identify seasonality in your data.
--TASK: Analyze Sales Performance Over Time.
--monthly:
SELECT
  MONTH(order_date) AS order_month,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  COUNT(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

--yearly:
SELECT
  YEAR(order_date) AS order_year,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  COUNT(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date);

SELECT
  DATETRUNC(YEAR, order_date) AS order_date,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  COUNT(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR, order_date)
ORDER BY DATETRUNC(YEAR, order_date)

--overall monthly
SELECT
  DATETRUNC(MONTH, order_date) AS order_date,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  COUNT(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH, order_date)
ORDER BY DATETRUNC(MONTH, order_date)
