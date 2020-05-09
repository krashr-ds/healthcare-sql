 /* Drugs - Pharmacologic Class ; 618 rows */ 
 
 
SELECT *
FROM concept 
WHERE domain_id = 'Drug'
AND invalid_reason IS NULL
AND concept_class_id = 'Pharmacologic Class'
ORDER BY concept_name 
