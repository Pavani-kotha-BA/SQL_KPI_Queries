-- Join claims with providers to get provider names
SELECT 
    c.claim_id,
    c.claim_amount,
    p.provider_name
FROM 
    claims_table c
JOIN 
    provider_table p
ON 
    c.provider_id = p.provider_id;

-- Join patients with claims to get patient info
SELECT 
    p.patient_name,
    p.date_of_birth,
    c.claim_amount,
    c.claim_date
FROM 
    patient_table p
LEFT JOIN 
    claims_table c
ON 
    p.patient_id = c.patient_id;
