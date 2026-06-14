-- Objective: Join transaction logs with client lists and audit for empty values
SELECT 
    c.client_id,
    c.company_name,
    c.industry,
    COUNT(t.transaction_id) AS total_transactions,
    COALESCE(SUM(t.amount), 0) AS total_billed_revenue,
    COALESCE(AVG(t.amount), 0) AS average_invoice_value
FROM customers c
LEFT JOIN transactions t
    ON c.client_id = t.client_id
GROUP BY c.client_id, c.company_name, c.industry
ORDER BY total_billed_revenue DESC;