
/* ZERO persons!
   with 
    18268	Adverse effect of other antidysrhythmic drugs	T46.2X5
	4167632	Amiodarone adverse reaction	293451000
	44835377	Cardiac rhythm regulators causing adverse effects in therapeutic use	E942.0
	45551238	Adverse effect of other antidysrhythmic drugs, initial encounter	T46.2X5A
	45556026	Adverse effect of other antidysrhythmic drugs, subsequent encounter	T46.2X5D
	45589832	Adverse effect of other antidysrhythmic drugs, sequela	T46.2X5S

*/


SELECT DISTINCT(person.person_id), person.* FROM person, condition_occurrence
WHERE person.person_id = condition_occurrence.person_id
AND condition_occurrence.condition_concept_id IN 
	(SELECT concept_id
			FROM concept 
			WHERE domain_id = 'Condition'
			AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'T46.2X5%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code = 'E942.0')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 293451000))
			AND invalid_reason IS NULL
	  
		)	
