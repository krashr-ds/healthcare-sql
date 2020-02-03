SELECT p.person_id, (strftime('%Y', 'now') - p.year_of_birth) - (strftime('%m', 'now') < p.month_of_birth) as person_age, p.gender_source_value, v.visit_occurrence_id, v.visit_start_date, c.concept_name
FROM person p, visit_occurrence v, concept c
WHERE v.person_id = p.person_id
AND v.preceding_visit_occurrence_id IS NULL
AND v.visit_concept_id = c.concept_id
AND c.concept_name IS NOT NULL
AND c.concept_name != 'No matching concept'
ORDER BY p.person_id, v.visit_start_date
