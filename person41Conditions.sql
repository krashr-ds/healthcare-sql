SELECT c.concept_name 
FROM concept c, condition_occurrence co
WHERE c.concept_id = co.condition_concept_id
AND co.person_id = 41
