  
/* Concept Classes (and their Domains) that ARE NOT Associated with Synonyms */
/* 14 ROWS
   Concept Class
   Condition Type
   Cost Type
   Death Type
   Domain
   Drug Type
   Meas Type
   Observation Type
   Place of Service
   Procedure Type
   Relationship
   Unit
   Visit
   Vocabulary
*/

SELECT DISTINCT(c.concept_class_id), c.domain_id
FROM concept c 
LEFT OUTER JOIN concept_synonym cs
ON c.concept_id = cs.concept_id
WHERE cs.concept_id IS NULL
