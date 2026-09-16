-- ====================================================================================
-- PROJECT STAGE 1: LOGISTICS & SUPPLY CHAIN PERFORMANCE ANALYTICS
-- OBJECTIVE: Evaluate Carrier Efficiency via On-Time Delivery (OTD) Rate
-- TECHNICAL STACK: Common Table Expressions (CTEs), Conditional Aggregations
-- ====================================================================================

WITH DeliveryPerformance AS (
  SELECT 
    -- Matching your exact schema names using backticks for spaces and underscores
    `Shipping Mode` AS shipping_channel,
    `Days for shipping _real_` AS actual_days,
    `Days for shipment _scheduled_` AS scheduled_days,
    
    -- Evaluate fulfillment delays (1 = Delayed, 0 = On Time/Early)
    CASE 
      WHEN `Days for shipping _real_` > `Days for shipment _scheduled_` THEN 1 
      ELSE 0 
    END AS is_delayed,
    
    -- Quantify the magnitude of the delay
    CASE 
      WHEN `Days for shipping _real_` > `Days for shipment _scheduled_` THEN (`Days for shipping _real_` - `Days for shipment _scheduled_`)
      ELSE 0 
    END AS days_overdue
  FROM 
    `project-github-furian-martina.supply_chain_project.raw_data`
  WHERE 
    `Order Status` = 'COMPLETE' -- Using exact schema match for Order Status
)

SELECT 
  shipping_channel,
  COUNT(*) AS total_shipments,

  ROUND(
    (COUNT(CASE WHEN is_delayed = 0 THEN 1 ELSE NULL END) / COUNT(*)) * 100,
    2
  ) AS otd_percentage,

  ROUND(
    (COUNT(CASE WHEN is_delayed = 1 THEN 1 ELSE NULL END) / COUNT(*)) * 100,
    2
  ) AS delay_percentage,

  ROUND(
    AVG(CASE WHEN is_delayed = 1 THEN days_overdue ELSE NULL END),
    1
  ) AS avg_days_overdue
FROM 
  DeliveryPerformance
GROUP BY 
  shipping_channel
ORDER BY 
  otd_percentage DESC;
