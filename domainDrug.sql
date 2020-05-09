 /* Drug - 2802506 valid rows; 525413 invalid rows */ 

SELECT concept_id, concept_name, domain_id, vocabulary_id, concept_class_id 
FROM concept 
WHERE domain_id = 'Drug'
AND invalid_reason IS NOT NULL
ORDER BY vocabulary_id, concept_class_id 
