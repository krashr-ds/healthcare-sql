/* ICD10CM for Condition 
   ROWS: 93276
*/
SELECT concept_id, concept_name, concept_code 
FROM concept 
WHERE domain_id = 'Condition'
AND vocabulary_id = 'ICD10CM'
AND invalid_reason IS NULL
ORDER BY concept_name ASC 
