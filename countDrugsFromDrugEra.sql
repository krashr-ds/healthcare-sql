/* Count Drugs from Drug_Era */

SELECT cohort_sample.person_id,
substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2) as comparison_start_date,
substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2) as comparison_end_date,
COUNT(drug_era.drug_era_id)
FROM cohort_sample, drug_era
WHERE cohort_sample.person_id = drug_era.person_id
AND (comparison_start_date = drug_era.drug_era_start_date OR drug_era.drug_era_start_date BETWEEN date(comparison_start_date, '-15 days') AND comparison_end_date)
AND (comparison_end_date = drug_era.drug_era_end_date OR drug_era.drug_era_end_date BETWEEN comparison_start_date AND date(comparison_end_date, '+30 days'))
GROUP BY cohort_sample.person_id 
