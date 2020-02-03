SELECT c.concept_name as condition_label, count(*)
FROM person p, condition_occurrence co, concept c
WHERE co.person_id = p.person_id
AND co.condition_concept_id = c.concept_id
AND c.concept_name LIKE '%pressure ulcer%'
GROUP BY condition_label
