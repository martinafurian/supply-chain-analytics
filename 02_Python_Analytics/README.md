# Phase 2: Advanced Python Exploratory Data Analysis & Inferential Statistics

## 🎯 Section Overview
This directory houses the advanced Python analytical core of the project, developed inside **VS Code** utilizing an internal **Anaconda Environment**. The goal of this phase was to interface directly with our Google BigQuery Cloud Warehouse via official Google API clients and leverage **NumPy, Pandas, SciPy, and Seaborn** to execute high-performance vectorized operations, hypothesis testing, and operational business visualization.

---

## 🛠️ Implemented Analytics Workflow

### 1. Secure Cloud Ingestion & Authentication
* **Script Module:** Google Cloud Client (`google.cloud.bigquery`).
* **Implementation:** Established a secure session utilizing encryption handshake protocols through service account JSON tokens, securely streaming all 180,519 records straight into a Python memory dataframe.

### 2. Inferential Hypothesis Testing & NumPy Processing (Step 1)
* **Mathematical Stack:** `scipy.stats.ttest_rel` (Paired T-Test), `np.where()`, `np.select()`.
* **Analytical Grounding:** Tested the global shipment framework to verify if operational delay averages are structurally flawed or driven by random distribution noise. 
* **Statistical Result:** 
  - **T-Statistic:** `92.9688` | **P-Value:** `0.0`
  - **Decision:** **REJECT THE NULL HYPOTHESIS (H0)**. The variance between actual delivery intervals and corporate contractual promises is highly statistically significant, confirming an explicit systemic failure in external carrier management.

### 3. Departmental Throughput Curves & Constraints Visuals (Step 2)
* **Visualization Stack:** Seaborn relational lineplots, Pandas datetime extraction.
* **Business Insight:** Re-arranged raw SQL volume processing aggregations into maximum density filters. Discovered that the **Fan Shop department** acts as the absolute warehouse bottleneck, generating a critical stress spike of **1,008 orders** precisely at **10:00 AM**, defining exactly where workforce floor allocation must be reinforced.

### 4. Financial Revenue Growth & Cumulative Trajectories (Step 3)
* **Mathematical Operations:** Chronological period indexing, array cumulative summation (`.cumsum()`).
* **Visual Asset:** Filled Area Chart tracking cash flow expansion from an initial baseline of **$343K** (Jan 2015) up to over **$12M** in financial accumulation.

### 5. Risk Mapping & Compliance Mitigation Hotspots (Step 4)
* **Analysis Model:** Conditional grouped risk-rate distribution profiling.
* **Visual Asset:** Red-gradient categorical horizontal bar chart isolating transaction security loopholes, profiling the alarming **8.25% transaction fraud rate** inside the Asia Pacific book market.

