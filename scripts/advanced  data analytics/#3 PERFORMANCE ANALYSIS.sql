--intro: Comparing the current value to a target value.
/* Task: Analyze the yearly performance of products by comparing each product's sales to both its average sales performance
         and the previous year's sales.*/
WITH yearly_product_sales AS (
SELECT 
YEAR(s.order_date) AS order_year,
p.product_name,
SUM(s.sales_amount) AS current_sales
FROM gold.fact_sales s LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(s.order_date), p.product_name
)

SELECT
order_year,
product_name,
current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) AS avg_sale,
current_sales - AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg,
CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) < 0 THEN 'Below Avg'
     WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) > 0 THEN 'Above Avg'
     ELSE 'Avg' 
END AS avg_change,
--year over year
LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS py_sales,
current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) AS diff_pre_sale,
CASE WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrese'
     WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
     WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) = 0 THEN 'No Change'
     ELSE '-'
END AS py_change
FROM yearly_product_sales
ORDER BY product_name, order_year
