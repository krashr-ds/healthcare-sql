/* VALID LOINC Lab Tests & Contents
   Domain: Measurement 
   Concept Class ID: Lab Test
   Relationship IDs: Panel Contains (OTHERS: Mapped from, Maps to, Is a, Contained in panel, LOINC - SNOMED eq)
   ROWS: 13774 

*/

SELECT cr.relationship_id, c.concept_id, c.concept_name, c.domain_id, 
       c.vocabulary_id, c.concept_class_id, 
	   cc.concept_name, cc.domain_id, cc.vocabulary_id, cc.concept_class_id
FROM concept_relationship cr, concept c, concept cc
WHERE cr.invalid_reason IS NULL
AND cr.relationship_id = 'Panel contains'
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
AND c.vocabulary_id = 'LOINC'
AND c.domain_id = 'Measurement'
AND c.concept_class_id = 'Lab Test'
AND c.invalid_reason IS NULL
ORDER BY c.concept_name
