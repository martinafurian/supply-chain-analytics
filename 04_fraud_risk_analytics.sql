-- ====================================================================================
-- PROJECT STAGE 4: RISK & FRAUD ANALYTICS
-- OBJECTIVE: Identify Fraud Patters by Product Categories and Markets
-- TECHNICAL STACK: Conditional Aggregations, Risk Ratio Bracketing, Multi-Level Grouping
-- ====================================================================================

SELECT 
  `Category Name` AS product_category,
  Market AS geographic_market,
  COUNT(*) AS total_orders,
  
  -- Count only orders flagged as suspected fraud
  COUNT(CASE WHEN `Order Status` = 'SUSPECTED_FRAUD' THEN 1 END) AS fraudulent_orders,
  
  -- Calculate the Fraud Risk Rate (Percentage of fraud over total orders)
  ROUND((COUNT(CASE WHEN `Order Status` = 'SUSPECTED_FRAUD' THEN 1 END) / COUNT(*)) * 100, 2) AS fraud_risk_rate
FROM 
  `project-github-furian-martina.supply_chain_project.raw_data`
GROUP BY 
  product_category,
  geographic_market
HAVING 
  fraudulent_orders > 5 -- Filter out low-volume combinations to focus on high-risk hotspots
ORDER BY 
  fraud_risk_rate DESC;
