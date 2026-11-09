/* Intro: Aggregate the data progressively over time.
Helps to understand whether our buisness is growing or declining.*/

-- TASK: Calculate the total sales per month and the running total of sales over time.
-- MONTHLY
SELECT 
  order_date,
  total_sales,
--window fucns.:
  SUM(total_sales) OVER(ORDER BY order_date) AS running_total,
--moving average
  AVG(avg_price) OVER(ORDER BY order_date) AS moving_average
FROM(
	SELECT 
	DATETRUNC(MONTH,order_date) AS order_date,
	SUM(sales_amount) AS total_sales,
	AVG(price) AS avg_price
	FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(MONTH,order_date) 
	)v

--YEARLY
SELECT 
  order_date,
  total_sales,
  SUM(total_sales) OVER(ORDER BY order_date) AS running_total,
  AVG(avg_price) OVER(ORDER BY order_date) AS moving_average
FROM(
	SELECT 
  	DATETRUNC(YEAR,order_date) AS order_date,
  	SUM(sales_amount) AS total_sales,
  	AVG(price) AS avg_price
	FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(YEAR,order_date) 
	)v
