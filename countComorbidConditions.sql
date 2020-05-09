/* 291 Rows (not 300) */

SELECT cs.person_id as person_id, COUNT(ce.condition_concept_id) AS comorbid_count 
FROM condition_era ce, concept c1, cohort_sample cs
WHERE cs.person_id = ce.person_id
AND ce.condition_era_id != cs.condition_era_id
AND ce.condition_concept_id = c1.concept_id 
AND ce.condition_era_id IS NOT NULL
AND ce.condition_concept_id != 0 
GROUP BY cs.person_id 
UNION 
SELECT cs.person_id as person_id, COUNT(co.condition_concept_id) as comorbid_count
FROM condition_occurrence co, concept c2, cohort_sample cs
WHERE cs.condition_era_id IS NULL
AND co.person_id = cs.person_id 
AND co.condition_occurrence_id != cs.condition_occurrence_id
AND co.condition_concept_id = c2.concept_id 
AND co.condition_concept_id != 0
GROUP BY cs.person_id 
