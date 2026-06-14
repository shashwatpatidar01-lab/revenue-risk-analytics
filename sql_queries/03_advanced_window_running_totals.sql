-- Objective: Compute cumulative fiscal running totals to identify velocity trends
WITH chronological_ledger AS (
    SELECT 
        c.company_name,
        t.fiscal_quarter,
        t.amount AS quarter_revenue,
        SUM(t.amount) OVER(
            PARTITION BY c.client_id 
            ORDER BY t.fiscal_quarter
        ) AS cumulative_running_total,
        DENSE_RANK() OVER(
            PARTITION BY c.industry 
            ORDER BY t.amount DESC
        ) AS industry_revenue_rank
    FROM customers c
    INNER JOIN transactions t
        ON c.client_id = t.client_id
)
SELECT 
    company_name,
    fiscal_quarter,
    quarter_revenue,
    cumulative_running_total,
    industry_revenue_rank
FROM chronological_ledger
WHERE cumulative_running_total > 50000
ORDER BY company_name, fiscal_quarter;