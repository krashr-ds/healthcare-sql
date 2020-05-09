/* DISTINCT VALID LOINC Lab Tests 
   Domain: Measurement 
   Concept Class ID: Lab Test
   Relationship IDs: Panel Contains 
   ROWS: 1063 

*/

SELECT DISTINCT cr.relationship_id, c.concept_id, c.concept_name, c.domain_id, 
       c.vocabulary_id, c.concept_class_id
FROM concept_relationship cr, concept c
WHERE cr.invalid_reason IS NULL
AND cr.relationship_id = 'Panel contains'
AND cr.concept_id_1 = c.concept_id
AND c.vocabulary_id = 'LOINC'
AND c.domain_id = 'Measurement'
AND c.concept_class_id = 'Lab Test'
AND c.invalid_reason IS NULL
ORDER BY c.concept_name
