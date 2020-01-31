SELECT DISTINCT(concept_name) FROM condition_occurrence, concept
WHERE condition_occurrence.condition_concept_id = concept.concept_id
AND concept_name LIKE '%diabet%'
