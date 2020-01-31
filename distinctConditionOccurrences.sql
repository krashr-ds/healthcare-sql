/* Conditions Our Population HAS; 6877 rows */

SELECT DISTINCT(c.concept_name)
FROM concept c 
INNER JOIN condition_occurrence co
ON c.concept_id = co.condition_concept_id
WHERE c.domain_id = 'Condition' 

