SELECT 
	 DISTINCT( person.person_id ) AS person_id , 
	 CASE WHEN person.gender_concept_id = 8507 THEN 'Male' ELSE 'Female' END AS gender,
	 person.month_of_birth,
	 person.year_of_birth,
	 CASE WHEN person.race_concept_id = 8527 THEN 'White' WHEN person.race_concept_id = 8516 THEN 'Black or African American' ELSE 'Unspecified' END AS race,
	 CASE WHEN person.ethnicity_concept_id = 38003564 THEN 'Not Hispanic' ELSE 'Hispanic' END AS ethnicity,
	 location.state AS state,
	 condition_occurrence.condition_concept_id AS condition_id,
	 CASE WHEN condition_occurrence.condition_concept_id IN (313217,1569171,4117112,4119601,4119602,4141360,4154290,4199501,4232691,4232697,35207784,35207785,44782442,44821957,45576876,45768480) 
	 THEN 'Atrial Fibrillation' 
	 WHEN condition_occurrence.condition_concept_id IN (1569172,1569173,44820868,45572094) THEN 'Atrial Flutter' 
	 ELSE 'Both Atrial Fibrillation and Flutter' END AS condition_name
	 
FROM person, location, condition_occurrence

WHERE person.location_id = location.location_id
AND person.person_id = condition_occurrence.person_id
AND condition_occurrence.condition_concept_id IN 	
(
     SELECT concept_id   /* AFib & Flutter */
			FROM TERMS.concept 
			WHERE domain_id = 'Condition'
			AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I48%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '427.3%')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 49436004))
			AND invalid_reason IS NULL
	  UNION
	  SELECT concept_id    /* Descendants of AFib & Flutter */    
			FROM TERMS.concept_ancestor 
			JOIN TERMS.concept 
			ON concept_ancestor.descendant_concept_id = concept.concept_id
			WHERE 
			concept_ancestor.ancestor_concept_id != concept_ancestor.descendant_concept_id AND 
			concept_ancestor.ancestor_concept_id IN (
				SELECT concept_id
				FROM TERMS.concept 
				WHERE domain_id = 'Condition'
				AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I48%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '427.3%')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 49436004))
				AND invalid_reason IS NULL
			)
) 
