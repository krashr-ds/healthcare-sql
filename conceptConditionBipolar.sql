/* Condition: Bipolar Disorder 
	TOTAL ROWS - 133
	
		SNOMED - 49
		ICD10CM - 42
		ICD9CM - 42 
   
*/
SELECT concept_id, concept_name, vocabulary_id, concept_class_id, concept_code 
FROM concept 
WHERE domain_id = 'Condition'
AND vocabulary_id IN ('SNOMED', 'ICD10CM', 'ICD9CM')
AND invalid_reason IS NULL
AND (concept_name LIKE 'bipolar%' OR concept_name LIKE 'manic%')
ORDER BY vocabulary_id, concept_name ASC 
