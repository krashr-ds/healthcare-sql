/* For Cohort Sample
   Procedures performed during the sample condition period  */
   

SELECT cohort_sample.person_id, 
cohort_sample.condition_name,
substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2) as comparison_start_date,
substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2) as comparison_end_date,
procedure_occurrence.procedure_date, procedure_occurrence.procedure_source_concept_id, concept.concept_name 
FROM cohort_sample, procedure_occurrence, concept 
WHERE cohort_sample.person_id = procedure_occurrence.person_id
AND procedure_occurrence.procedure_source_concept_id = concept.concept_id 
AND procedure_occurrence.procedure_date BETWEEN comparison_start_date AND comparison_end_date
ORDER BY cohort_sample.person_id 
