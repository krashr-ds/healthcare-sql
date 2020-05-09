/* PART I: 284 comorbid_count(s) added */

REPLACE INTO cohort_sample
SELECT cohort_sample.cohort_sample_id, cohort_sample.person_id, cohort_sample.gender, cohort_sample.month_of_birth, 
cohort_sample.year_of_birth, cohort_sample.race, cohort_sample.ethnicity, cohort_sample.state, cohort_sample.place_of_service, 
cohort_sample.condition_era_id, cohort_sample.condition_occurrence_id, cohort_sample.condition_concept_id, cohort_sample.condition_name, 
cohort_sample.condition_start_date, cohort_sample.condition_end_date, COUNT(condition_era.condition_concept_id) as comorbid_count, 0, 0, 0, 0 FROM condition_era
LEFT JOIN cohort_sample ON cohort_sample.person_id = condition_era.person_id 
WHERE cohort_sample.condition_era_id IS NOT NULL
AND condition_era.condition_era_id != cohort_sample.condition_era_id 
AND condition_era.condition_concept_id != 0 
GROUP BY cohort_sample.person_id;

/* PART II: 15 count(s) added; 1 zero count row remaining. */

REPLACE INTO cohort_sample
SELECT cohort_sample.cohort_sample_id, cohort_sample.person_id, cohort_sample.gender, cohort_sample.month_of_birth, 
cohort_sample.year_of_birth, cohort_sample.race, cohort_sample.ethnicity, cohort_sample.state, cohort_sample.place_of_service, 
cohort_sample.condition_era_id, cohort_sample.condition_occurrence_id, cohort_sample.condition_concept_id, cohort_sample.condition_name, 
cohort_sample.condition_start_date, cohort_sample.condition_end_date, COUNT(condition_occurrence.condition_concept_id) as comorbid_count, 0, 0, 0, 0 FROM condition_occurrence
LEFT JOIN cohort_sample ON cohort_sample.person_id = condition_occurrence.person_id 
WHERE (cohort_sample.condition_era_id IS NULL OR cohort_sample.comorbid_count = 0)
AND condition_occurrence.condition_occurrence_id != cohort_sample.condition_occurrence_id 
AND condition_occurrence.condition_concept_id != 0 
GROUP BY cohort_sample.person_id;
