--intro: Group the data based on a specific range. Helps understand the correlation between two measures.
--Segment products into cost ranges and count how many products fall into each segment.
SELECT 
  COUNT(product_key) AS total_products,
  cost_range
FROM(
    SELECT 
      product_key,
      product_name,
      cost,
      CASE WHEN cost < 100 THEN  'Below 100'
           WHEN cost between 100 and 500 THEN '100 - 500'
           ELSE 'Above 500' 
      END AS cost_range
    FROM gold.dim_products
)v
GROUP BY cost_range
ORDER BY total_products DESC;
----------------------------------------------------------------------------
/* 
Group customers into three segments based on their spending behavior;
    -VIP; at least 12months of history and spending more than $5,000.
    -Regular; at least 12months of history but spending $5,000 or less.
    -New; lifespan less than 12months
And find the total number of customers */
WITH customer_spend AS (
SELECT
  c.customer_key,
  SUM(s.sales_amount) AS total_spending,
  MIN(s.order_date) AS first_order,
  MAX(s.order_date) AS last_order,
  DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date)) AS lifespan
FROM gold.fact_sales s LEFT JOIN gold.dim_customers c ON s.customer_key = c.customer_key
GROUP BY c.customer_key
)

SELECT 
  COUNT(customer_key) AS total_customers,
  customer_segment
FROM
(
SELECT 
  customer_key,
  total_spending,
  lifespan,
  CASE WHEN total_spending > 5000 and lifespan >= 12 THEN 'VIP'
       WHEN total_spending <= 5000 and lifespan >= 12 THEN 'Regular'
       ELSE 'New'
  END AS customer_segment
FROM customer_spend
)v
GROUP BY customer_segment
