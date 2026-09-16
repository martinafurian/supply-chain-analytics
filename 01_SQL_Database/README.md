# Phase 1: Advanced SQL Relational Database Analytics

## 🎯 Section Overview
This directory contains the foundational SQL architecture developed using **Google BigQuery**. The objective of this phase was to process over 180,000 raw supply chain transactions, transforming chaotic records into highly structured data aggregates optimized for analytical modeling and dashboard engineering.

---

## 🛠️ Implemented Analytics Scripts

### 1. Carrier Performance & On-Time Delivery (OTD) Analytics
* **File:** `01_carrier_performance.sql`
* **Technical Stack:** Common Table Expressions (CTEs), Conditional Aggregations (`COUNT(CASE WHEN)`).
* **Business Insight:** Uncovered that the **First Class** shipping channel suffers from a critical **0.0% On-Time Delivery rate**, signaling severe bottlenecks in urgent courier fulfillment strategies.

### 2. Operational Throughput & Shift Workload Pattern Analysis
* **File:** `02_operational_throughput.sql`
* **Technical Stack:** Window Functions (`SUM() OVER PARTITION BY`), Datetime Extractions, `DENSE_RANK()`.
* **Business Insight:** Evaluated shift processing volumes within the warehouse. Identified that the **Apparel department** experiences its absolute peak processing stress at **02:00 AM**, proving a strategic need for better automated workforce scheduling.

### 3. Financial Revenue Growth & Chronological Trajectories
* **File:** `03_financial_revenue.sql`
* **Technical Stack:** Window Functions (`SUM() OVER ORDER BY` for Running Totals), Chronological Date Truncation.
* **Business Insight:** Engineered a chronological financial tracker. Mapped the corporate growth scalability as gross cumulative revenue rapidly crested from **$343K** in January 2015 to over **$2.3M** by July 2015.

### 4. Security Compliance & Fraud Risk Hotspot Detection
* **File:** `04_fraud_risk.sql`
* **Technical Stack:** Multi-level Grouping, Risk Ratio Bracketing, `HAVING` filtration.
* **Business Insight:** Isolated security loopholes by calculating categorical fraud ratios. Surfaced that **Books** purchased within the **Pacific Asia** market trigger an alarming **8.25% Fraud Risk Rate**, exposing an immediate area for transaction vetting improvements.
