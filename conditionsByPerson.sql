/* SORT CONDITION_OCCURRENCE by PERSON_ID */

SELECT DISTINCT co.person_id, c.concept_name
FROM condition_occurrence co INNER JOIN concept c
ON co.condition_concept_id = c.concept_id
