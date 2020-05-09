/* ICD9CM for Condition
   ROWS: 16492
*/
SELECT concept_id, concept_name, concept_code 
FROM concept 
WHERE domain_id = 'Condition'
AND vocabulary_id = 'ICD9CM'
AND invalid_reason IS NULL
ORDER BY concept_name ASC 
