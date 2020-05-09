/* Update cohort_sample; add condition_era_id */

UPDATE cohort_sample
SET condition_era_id = 
	(SELECT condition_era.condition_era_id FROM condition_era
	 WHERE cohort_sample.condition_concept_id = condition_era.condition_concept_id
	 AND (   
		cohort_sample.condition_start_date = strftime('%m/%d/%Y',condition_era.condition_era_start_date)
	        OR substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2) BETWEEN condition_era.condition_era_start_date AND condition_era.condition_era_end_date
	      )
	 AND  (  cohort_sample.condition_end_date = strftime('%m/%d/%Y',condition_era.condition_era_end_date) 
	         OR substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2) BETWEEN condition_era.condition_era_start_date AND condition_era.condition_era_end_date
	      )
	 )
	 

SELECT * FROM cohort_sample, condition_occurrence, condition_era 
WHERE cohort_sample.condition_era_id IS NULL 
AND cohort_sample.condition_occurrence_id = condition_occurrence.condition_occurrence_id
AND cohort_sample.condition_concept_id = condition_occurrence.condition_concept_id
AND cohort_sample.person_id = condition_occurrence.person_id
AND cohort_sample.condition_concept_id = condition_era.condition_concept_id
AND cohort_sample.person_id = condition_era.person_id

/* Update 1 row where condition era end date was actually LESS THAN condition_occurrence end date */

UPDATE cohort_sample
SET condition_era_id = 6217784
WHERE cohort_sample_id = 264

/* 7 NULLS in condition era...for some items in condition_occurrence */

SELECT * 
FROM cohort_sample
LEFT OUTER JOIN condition_era
ON cohort_sample.condition_concept_id = condition_era.condition_concept_id
AND cohort_sample.person_id = condition_era.person_id
WHERE cohort_sample.condition_era_id IS NULL
