/* Condition: Atrial Fibrillation or Flutter
	TOTAL ROWS - 10
	
		SNOMED - 6
		ICD10CM - 1
		ICD9CM - 3 
   
*/
SELECT concept_id, concept_name, vocabulary_id, concept_class_id, concept_code 
FROM concept 
WHERE domain_id = 'Condition'
AND vocabulary_id IN ('SNOMED', 'ICD10CM', 'ICD9CM')
AND invalid_reason IS NULL
AND concept_name LIKE 'atrial f%'
ORDER BY vocabulary_id, concept_name ASC 
