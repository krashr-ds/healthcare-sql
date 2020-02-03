/* All measurements by visit; not able to identify what KIND of measurements */

SELECT v.visit_occurrence_id, v.person_id, v.provider_id, v.care_site_id, m.measurement_id, m.measurement_source_value, c.concept_name 
FROM visit_occurrence v
LEFT OUTER JOIN measurement m
ON v.visit_occurrence_id = m.visit_occurrence_id
INNER JOIN concept c
ON m.measurement_source_concept_id = c.concept_id
WHERE v.visit_occurrence_id IS NOT NULL 
AND c.concept_id IS NOT NULL 
AND c.concept_name IS NOT NULL 
