/* Device Exposures ; only 4 rows */

SELECT cohort_sample.person_id, 
cohort_sample.condition_name,
substr(cohort_sample.condition_start_date, 7) || "-" || substr(cohort_sample.condition_start_date,4,2)  || "-" || substr(cohort_sample.condition_start_date, 1,2) as comparison_start_date,
substr(cohort_sample.condition_end_date, 7) || "-" || substr(cohort_sample.condition_end_date,4,2)  || "-" || substr(cohort_sample.condition_end_date, 1,2) as comparison_end_date,
device_exposure.device_exposure_start_date, device_exposure.device_exposure_end_date, device_exposure.device_source_concept_id, concept.concept_name 
FROM cohort_sample, device_exposure, concept 
WHERE cohort_sample.person_id = device_exposure.person_id
AND device_exposure.device_source_concept_id = concept.concept_id 
AND (comparison_start_date = device_exposure.device_exposure_start_date OR device_exposure.device_exposure_start_date BETWEEN comparison_start_date AND comparison_end_date)
AND (comparison_end_date = device_exposure.device_exposure_end_date OR device_exposure.device_exposure_end_date BETWEEN comparison_start_date AND comparison_end_date)
ORDER BY cohort_sample.person_id 
