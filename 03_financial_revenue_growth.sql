-- ====================================================================================
-- PROJECT STAGE 3: REVENUE GROWTH & FINANCIAL ANALYTICS
-- OBJECTIVE: Track Monthly Sales and Cumulative Revenue (Running Total) over Time
-- TECHNICAL STACK: Window Functions (SUM OVER ORDER BY), Date Truncation, Aggregations
-- ====================================================================================

WITH MonthlySales AS (
  SELECT 
    -- Truncate the timestamp to the first day of the month to group chronological data
    DATE_TRUNC(DATE(`order date _DateOrders_`), MONTH) AS sales_month,
    
    -- Calculate gross sales and average transaction value for that month
    ROUND(SUM(`Sales`), 2) AS gross_revenue,
    ROUND(AVG(`Sales`), 2) AS avg_transaction_value,
    COUNT(DISTINCT `Order Id`) AS total_orders
  FROM 
    `project-github-furian-martina.supply_chain_project.raw_data`
  WHERE 
    `Order Status` = 'COMPLETE'
  GROUP BY 
    sales_month
)

SELECT 
  sales_month,
  total_orders,
  avg_transaction_value,
  gross_revenue,
  
  -- Window Function: Calculate Cumulative Revenue (Running Total) across months
  ROUND(SUM(gross_revenue) OVER(ORDER BY sales_month ASC), 2) AS cumulative_revenue
FROM 
  MonthlySales
ORDER BY 
  sales_month ASC;
