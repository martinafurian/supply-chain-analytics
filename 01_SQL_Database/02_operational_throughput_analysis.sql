-- ====================================================================================
-- PROJECT STAGE 2: OPERATIONAL THROUGHPUT & WORKLOAD ANALYSIS
-- OBJECTIVE: Map Hourly Order Distribution across Departments to Identify Bottlenecks
-- TECHNICAL STACK: Window Functions (COUNT OVER), Hourly Extracting, Dense Ranking
-- ====================================================================================

WITH HourlyLogistics AS (
  SELECT 
    `Department Name` AS department_name,
    
    -- Extract the hour from the order timestamp to analyze workload by shift
    EXTRACT(HOUR FROM `order date _DateOrders_`) AS order_hour,
    
    -- Unique identifier used to count processed orders
    `Order Id` AS order_id
  FROM 
    `project-github-furian-martina.supply_chain_project.raw_data`
  WHERE 
    `Order Status` = 'COMPLETE'   -- Only completed orders contribute to throughput
),

AggregatedThroughput AS (
  SELECT 
    department_name,
    order_hour,
    
    -- Count distinct orders processed in each hour for each department
    COUNT(DISTINCT order_id) AS hourly_orders_processed
  FROM 
    HourlyLogistics
  GROUP BY 
    department_name, 
    order_hour
),

Final AS (
  SELECT
    department_name,
    order_hour,
    hourly_orders_processed,
    
    -- Window Function: total volume processed by each department across all hours
    SUM(hourly_orders_processed) OVER(PARTITION BY department_name) AS total_dept_volume
  FROM AggregatedThroughput
)

SELECT 
  department_name,
  order_hour,
  hourly_orders_processed,
  
  -- Percentage of the department's daily workload occurring in this specific hour
  ROUND((hourly_orders_processed / total_dept_volume) * 100, 2) AS workload_percentage,
  
  -- Rank hours within each department to identify peak activity periods
  DENSE_RANK() OVER(PARTITION BY department_name ORDER BY hourly_orders_processed DESC) AS peak_hour_rank
FROM 
  Final
ORDER BY 
  hourly_orders_processed DESC;
