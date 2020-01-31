SELECT c.concept_name, COUNT(DISTINCT co.person_id) AS num_people
FROM condition_occurrence co
JOIN concept c
ON c.concept_id = co.condition_concept_id
GROUP BY c.concept_name
