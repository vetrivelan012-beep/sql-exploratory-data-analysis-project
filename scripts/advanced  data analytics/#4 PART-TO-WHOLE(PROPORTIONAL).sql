/* INTRO: Analyze how an individual part is performing compared to the overall, allowing us to 
			understand which category has the greatest impact on the buisness.*/
--Which categories contribute the most to overall sales?
SELECT
  category,
  total_sales,
  SUM(total_sales) OVER() overall_sales,
  CONCAT(ROUND(CAST(total_sales AS float) / SUM(total_sales) OVER() * 100, 2), '%') AS sales_percent
FROM (
	SELECT 
  	p.category,
  	SUM(s.sales_amount) AS total_sales
	FROM gold.fact_sales s LEFT JOIN gold.dim_products p
	ON s.product_key = p.product_key
	GROUP BY p.category
)v
ORDER BY sales_percent DESC
