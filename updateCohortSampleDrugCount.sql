/* Add drug counts for some persons in Cohort Sample
   44 rows updated
*/

REPLACE INTO cohort_sample
SELECT cohort_sample.cohort_sample_id, cohort_sample.person_id, cohort_sample.gender, cohort_sample.month_of_birth, 
cohort_sample.year_of_birth, cohort_sample.race, cohort_sample.ethnicity, cohort_sample.state, cohort_sample.place_of_service, 
cohort_sample.condition_era_id, cohort_sample.condition_occurrence_id, cohort_sample.condition_concept_id, cohort_sample.condition_name, 
cohort_sample.condition_start_date, cohort_sample.condition_end_date, cohort_sample.comorbid_count, COUNT(drug_era.drug_era_id) as drug_count, 0, 0, 0 FROM drug_era
LEFT JOIN cohort_sample ON cohort_sample.person_id = drug_era.person_id 
WHERE (substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2) = drug_era.drug_era_start_date OR drug_era.drug_era_start_date BETWEEN date(substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2), '-15 days') AND substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2))
AND (substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2) = drug_era.drug_era_end_date OR drug_era.drug_era_end_date BETWEEN substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2) AND date(substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2), '+30 days'))
GROUP BY cohort_sample.person_id;
