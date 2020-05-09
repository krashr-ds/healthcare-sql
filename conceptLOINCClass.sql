/* LOINC Class - 203 ROWS */

SELECT * FROM concept
WHERE invalid_reason IS NULL
AND vocabulary_id = 'LOINC'
AND domain_id = 'Measurement'
AND concept_class_id = 'LOINC Class'
ORDER BY concept_name 
