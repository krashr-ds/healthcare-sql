REPLACE INTO cohort_sample
SELECT cohort_sample.cohort_sample_id, cohort_sample.person_id, cohort_sample.gender, cohort_sample.month_of_birth, 
cohort_sample.year_of_birth, cohort_sample.race, cohort_sample.ethnicity, cohort_sample.state, cohort_sample.place_of_service, 
cohort_sample.condition_era_id, cohort_sample.condition_occurrence_id, cohort_sample.condition_concept_id, cohort_sample.condition_name, 
cohort_sample.condition_start_date, cohort_sample.condition_end_date, cohort_sample.comorbid_count, cohort_sample.drug_count, COUNT(procedure_occurrence_id), 0, 0 
FROM procedure_occurrence
LEFT JOIN cohort_sample ON cohort_sample.person_id = procedure_occurrence.person_id 
WHERE procedure_occurrence.procedure_date BETWEEN substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2) AND substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2)
GROUP BY cohort_sample.person_id;
