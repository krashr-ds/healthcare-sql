/* Persons exposed to Amiodarone: 1304 persons */

CREATE TABLE amiodarone_exposure
AS
SELECT 
	 DISTINCT( person.person_id ) AS person_id , 
	 CASE WHEN person.gender_concept_id = 8507 THEN 'Male' ELSE 'Female' END AS gender,
	 person.month_of_birth,
	 person.year_of_birth,
	 CASE WHEN person.race_concept_id = 8527 THEN 'White' WHEN person.race_concept_id = 8516 THEN 'Black or African American' ELSE 'Unspecified' END AS race,
	 CASE WHEN person.ethnicity_concept_id = 38003564 THEN 'Not Hispanic' ELSE 'Hispanic' END AS ethnicity,
	 location.state AS state

FROM person, location, condition_occurrence, concept

WHERE person.location_id = location.location_id
AND person.person_id = condition_occurrence.person_id
AND condition_occurrence.condition_concept_id = concept.concept_id 
AND person.person_id IN 
(
	SELECT DISTINCT(de.person_id) /* Persons exposed to Amiodarone */
	FROM drug_exposure de, concept c, concept_relationship cr, concept cc
	WHERE c.invalid_reason IS NULL
	AND c.domain_id = 'Drug'
	AND c.vocabulary_id = 'RxNorm'
	AND (c.concept_name LIKE 'amiodarone%')
	AND (c.concept_class_id = 'Clinical Drug' OR c.concept_class_id = 'Branded Drug Form')
	AND c.concept_id = cr.concept_id_1
	AND cc.concept_id = cr.concept_id_2
	AND cr.relationship_id = 'RxNorm is a'
	AND c.concept_id = de.drug_concept_id
);
