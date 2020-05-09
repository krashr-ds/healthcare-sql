/* SNOMED for Condition
   ROWS: 97549
*/
SELECT concept_id, concept_name, concept_code 
FROM concept 
WHERE domain_id = 'Condition'
AND vocabulary_id = 'SNOMED'
AND invalid_reason IS NULL
ORDER BY concept_name ASC 
