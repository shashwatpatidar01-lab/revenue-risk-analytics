# Corporate Revenue Risk & Customer LTV Optimization Pipeline

## Business Problem & Context
In mid-market corporate accounting structures, manual processing of ledger logs results in data silos, invisible revenue leakages, and delayed risk interventions. This financial analytics pipeline transforms raw, unmapped transactional databases into an audit-ready, structured layout to optimize customer Lifetime Value (LTV) and flag churn liabilities.

## Technical Stack & Frameworks
* **Language:** SQL (ANSI Standard / PostgreSQL)
* **Architectures:** Common Table Expressions (CTEs), Subqueries, Window Functions, Conditional Logic (`CASE WHEN`), Null Patching (`COALESCE`).
* **Visualizations:** Managed through interactive BI dashboard templates tracking operational metrics.

## Repository Contents
* `sql_queries/01_data_cleaning_and_coalesce.sql`: Sanitizes null transaction exceptions and joins disparate tabular ledgers.
* `sql_queries/02_cohort_revenue_aggregation.sql`: Implements multi-tier strategic client segment structures.
* `sql_queries/03_advanced_window_running_totals.sql`: Utilizes multi-partition window vectors to build historical running balances across sequential fiscal quarters.

## Key Business Insights Achieved
1. **Identified Revenue Leakage:** Isolated baseline account anomalies representing latent client churn liabilities.
2. **Velocity Forecasting:** Constructed cumulative running totals that pinpointed exactly which enterprise tiers crossed core margin goals within 2 quarters.
3. **Resource Re-allocation:** Segmented account bases into 3 distinct operational buckets, enabling customer success teams to re-allocate accounts strategically.
