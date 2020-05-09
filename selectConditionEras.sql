/* Select condition eras before Update */

SELECT cs.cohort_sample_id, cs.person_id, cs.condition_concept_id, cs.condition_name, cs.condition_start_date, cs.condition_end_date,
ce.condition_era_id, ce.condition_concept_id, strftime('%m/%d/%Y',ce.condition_era_start_date), strftime('%m/%d/%Y',ce.condition_era_end_date)
FROM cohort_sample cs, condition_era ce
WHERE cs.condition_concept_id = ce.condition_concept_id
AND (cs.condition_start_date = strftime('%m/%d/%Y',ce.condition_era_start_date)
	OR date(cs.condition_start_date) BETWEEN ce.condition_era_start_date AND ce.condition_era_end_date)
AND (cs.condition_end_date = strftime('%m/%d/%Y',ce.condition_era_end_date) 
	OR date(cs.condition_end_date) BETWEEN ce.condition_era_start_date AND ce.condition_era_end_date)
