/* Condition Names ; 6878 unique names */

SELECT DISTINCT(concept_name) FROM condition_occurrence, concept
WHERE condition_occurrence.condition_concept_id = concept.concept_id
