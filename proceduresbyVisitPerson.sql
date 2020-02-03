/* Looking at Procedures by Visit, Person - 
   Noting > 1 Procedure may be associated with a Visit
   These are Visits where Procedures took place         */
   
SELECT pr.person_id, (strftime('%Y', 'now') - pr.year_of_birth) - (strftime('%m', 'now') < pr.month_of_birth) as person_age, pr.gender_source_value, v.visit_occurrence_id, v.visit_start_date, p.procedure_occurrence_id, c.concept_name
FROM person pr, visit_occurrence v, procedure_occurrence p, concept c
WHERE pr.person_id = p.person_id
AND p.visit_occurrence_id = v.visit_occurrence_id
AND v.visit_occurrence_id IS NOT NULL
AND p.procedure_concept_id = c.concept_id
AND c.concept_id IS NOT NULL
AND c.concept_name IS NOT NULL
AND c.concept_name != 'No matching concept'
ORDER BY pr.person_id, v.visit_start_date
