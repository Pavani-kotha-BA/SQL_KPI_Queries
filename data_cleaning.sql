-- Remove duplicates
DELETE FROM 
    patient_table
WHERE 
    patient_id IN (
        SELECT 
            patient_id
        FROM 
            (SELECT 
                patient_id,
                ROW_NUMBER() OVER (PARTITION BY ssn ORDER BY patient_id) AS row_num
             FROM 
                patient_table) t
        WHERE 
            row_num > 1
    );

-- Handle NULLs
UPDATE 
    claims_table
SET 
    claim_status = 'Unknown'
WHERE 
    claim_status IS NULL;
