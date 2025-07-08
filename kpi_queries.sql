-- Example: Monthly Claims Count
SELECT 
    MONTH(claim_date) AS claim_month,
    COUNT(*) AS total_claims
FROM 
    claims_table
WHERE 
    claim_status = 'Approved'
GROUP BY 
    MONTH(claim_date)
ORDER BY 
    claim_month;

-- Example: Average Reimbursement Amount
SELECT 
    provider_id,
    AVG(reimbursement_amount) AS avg_reimbursement
FROM 
    claims_table
GROUP BY 
    provider_id;
