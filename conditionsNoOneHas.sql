/* Conditions Our Population DOESN'T Have */

SELECT c.concept_id, c.concept_name, c.domain_id 
FROM concept c 
LEFT OUTER JOIN condition_occurrence co
ON c.concept_id = co.condition_concept_id
WHERE c.domain_id = 'Condition' AND co.condition_concept_id IS NULL
