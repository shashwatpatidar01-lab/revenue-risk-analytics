-- Objective: Segment corporate accounts into risk-adjusted revenue brackets
SELECT 
    client_id,
    company_name,
    total_billed_revenue,
    CASE 
        WHEN total_billed_revenue >= 100000 THEN 'Tier 1: Key Strategic Enterprise'
        WHEN total_billed_revenue >= 25000 AND total_billed_revenue < 100000 THEN 'Tier 2: Mid-Market Growth'
        ELSE 'Tier 3: Standard Account'
    END AS account_segmentation,
    CASE 
        WHEN total_transactions = 0 THEN 'High Churn Risk (No Activity)'
        ELSE 'Active Account'
    END AS operational_risk_status
FROM (
    -- Inline subquery consolidating base metrics
    SELECT 
        c.client_id,
        c.company_name,
        COUNT(t.transaction_id) AS total_transactions,
        COALESCE(SUM(t.amount), 0) AS total_billed_revenue
    FROM customers c
    LEFT JOIN transactions t ON c.client_id = t.client_id
    GROUP BY c.client_id, c.company_name
) base_metrics;