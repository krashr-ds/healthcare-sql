/* Persons with MI who DID NOT have a GI Bleed who were not prescribed low-dose (75,80,81,150 or 162mg) aspirin. 

   NOTES:
   14453 with MI and no GI Bleed
   14201 NOT prescribed low-dose aspirin
   252 received low-dose aspirin; only 1.74% of the patients
*/

CREATE TABLE persons_mi_noasa 
AS
SELECT 
	 DISTINCT( person.person_id ) AS person_id , 
	 CASE WHEN person.gender_concept_id = 8507 THEN 'Male' ELSE 'Female' END AS gender,
	 person.month_of_birth,
	 person.year_of_birth,
	 CASE WHEN person.race_concept_id = 8527 THEN 'White' WHEN person.race_concept_id = 8516 THEN 'Black or African American' ELSE 'Unspecified' END AS race,
	 CASE WHEN person.ethnicity_concept_id = 38003564 THEN 'Not Hispanic' ELSE 'Hispanic' END AS ethnicity,
	 location.state AS state,
	 condition_occurrence.condition_concept_id AS condition_id,
	 condition_occurrence.condition_source_value AS source_code,
	 condition_occurrence.condition_start_date AS start_date,
	 condition_occurrence.condition_end_date AS end_date

FROM person, location, condition_occurrence

WHERE person.location_id = location.location_id
AND person.person_id = condition_occurrence.person_id
AND condition_occurrence.condition_concept_id IN 
	(SELECT concept_id   /* Myocardial Infarction */
			FROM TERMS.concept 
			WHERE domain_id = 'Condition'
			AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I21%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '410%')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 57054005))
			AND invalid_reason IS NULL
	  UNION
	  SELECT concept_id    /* Descendants of MI */    
			FROM TERMS.concept_ancestor 
			JOIN TERMS.concept 
			ON concept_ancestor.descendant_concept_id = concept.concept_id
			WHERE 
			concept_ancestor.ancestor_concept_id != concept_ancestor.descendant_concept_id AND 
			concept_ancestor.ancestor_concept_id IN (
				SELECT concept_id
				FROM TERMS.concept 
				WHERE domain_id = 'Condition'
				AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I21%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '410%')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 57054005))
				AND invalid_reason IS NULL
				)
		)	
AND condition_occurrence.condition_concept_id NOT IN /* Exclude GI bleeds, they likely shouldn't get aspirin */
    (192671,35208414,44830170,44836279)
AND condition_occurrence.condition_concept_id NOT IN  /* Exclude descendants of GI bleed */
    (SELECT concept_id FROM concept_ancestor JOIN concept ON concept_ancestor.descendant_concept_id = concept.concept_id 
     WHERE concept_ancestor.ancestor_concept_id != concept_ancestor.descendant_concept_id AND
     concept_ancestor.ancestor_concept_id IN (192671,35208414,44830170,44836279)
     )
AND person.person_id NOT IN ( /* Exclude patients who received low-dose aspirin including 75mg, 80mg, 81mg, 100mg, 150mg and 162mg */
SELECT drug_exposure.person_id FROM drug_exposure
WHERE drug_exposure.drug_concept_id IN (1112901,19065038,19002900,19003088,19004043,19004044,1112922,1112958,19059059,19068002,46287405,1112960,1112961,1113346,1113614,1113615,1113616,1113618,1113722,19020961,19021575,19046501,19046611,19047856,19052675,19055208,19055994,19059056,19065472,19068003,19072677,19073359,44818357,44818192)
);
