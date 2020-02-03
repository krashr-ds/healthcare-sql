SELECT 
ROUND(AVG(total_paid),2) as average_total_paid, 
ROUND(AVG(paid_by_patient),2) as average_paid_by_patient, 
ROUND(AVG(total_paid - paid_by_patient),2) AS average_paid_by_other 
FROM Cost
