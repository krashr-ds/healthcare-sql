/* Count Comorbid Conditions
   Target : cohort_sample
   Always SEE before you update
*/

SELECT cs.condition_name as cs_sample_condition, cs.person_id as person_id, ce.condition_concept_id as condition_concept_id, c1.concept_name as condition_name
FROM condition_era ce, concept c1, cohort_sample cs
WHERE cs.person_id = ce.person_id
AND ce.condition_era_id != cs.condition_era_id
AND ce.condition_concept_id = c1.concept_id 
UNION 
SELECT cs.condition_name as cs_sample_condition, cs.person_id as person_id, co.condition_concept_id as condition_concept_id, c2.concept_name as condition_name
FROM condition_occurrence co, concept c2, cohort_sample cs
WHERE cs.condition_era_id IS NULL
AND co.person_id = cs.person_id 
AND co.condition_occurrence_id != cs.condition_occurrence_id
AND co.condition_concept_id = c2.concept_id 
