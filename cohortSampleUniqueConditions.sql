/* With help from Tom Rasku tomrasku@yahoo.com */

CREATE TABLE cohort_sample AS 

SELECT 
	 
	 person.person_id,
	 CASE WHEN person.gender_concept_id = 8507 THEN 'Male' ELSE 'Female' END AS gender,
	 person.month_of_birth,
	 person.year_of_birth,
	 CASE WHEN person.race_concept_id = 8527 THEN 'White' WHEN person.race_concept_id = 8516 THEN 'Black or African American' ELSE 'Unspecified' END AS race,
	 CASE WHEN person.ethnicity_concept_id = 38003564 THEN 'Not Hispanic' ELSE 'Hispanic' END AS ethnicity,
	 location.state AS state,
	 concept2.concept_name AS place_of_service, 
	 unique_condition.condition_occurrence_id AS condition_occurrence_id,
	 unique_condition.condition_concept_id AS condition_concept_id,
	 concept.concept_name AS condition_name, 
	 strftime('%m/%d/%Y', condition_occurrence.condition_start_date) AS condition_start_date, 
	 strftime('%m/%d/%Y', condition_occurrence.condition_end_date) AS condition_end_date,
	 0 as comorbid_count,
	 0 as drug_count,
	 0 as procedure_count,
	 0 as device_count,
	 0 as measurement_count

FROM person, location, condition_occurrence, concept, concept AS concept2, provider, care_site, 
     (SELECT condition_concept_id, MAX(condition_occurrence_id) AS condition_occurrence_id
	  FROM condition_occurrence 
	  WHERE condition_concept_id != 0 
	  GROUP BY condition_concept_id) AS unique_condition
	
	
WHERE person.person_id = condition_occurrence.person_id 
AND person.location_id = location.location_id
AND condition_occurrence.condition_occurrence_id = unique_condition.condition_occurrence_id
AND concept.concept_id = unique_condition.condition_concept_id
AND condition_occurrence.provider_id = provider.provider_id
AND provider.care_site_id = care_site.care_site_id
AND care_site.place_of_service_concept_id = concept2.concept_id 
AND concept.invalid_reason IS NULL
ORDER BY person.person_id 
LIMIT 300;
