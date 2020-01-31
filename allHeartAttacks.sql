/* Get me all the Heart Attacks */

SELECT * FROM condition_occurrence, concept
WHERE condition_occurrence.condition_concept_id = concept.concept_id
AND condition_status_source_value BETWEEN 41000 AND 41093
