/* Persons with MI or Descendant of MI
   who did not have GI Bleed or Descendant of GI Bleed 
   (Doesn't matter if they are alive or not.)
*/

SELECT DISTINCT(person.person_id), person.* FROM person, condition_occurrence
WHERE person.person_id = condition_occurrence.person_id
AND condition_occurrence.condition_concept_id IN 
	(SELECT concept_id
			FROM concept 
			WHERE domain_id = 'Condition'
			AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I21%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '410%')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 57054005))
			AND invalid_reason IS NULL
	  UNION
	  SELECT concept_id        
			FROM concept_ancestor 
			JOIN concept 
			ON concept_ancestor.descendant_concept_id = concept.concept_id
			WHERE 
			concept_ancestor.ancestor_concept_id != concept_ancestor.descendant_concept_id AND 
			concept_ancestor.ancestor_concept_id IN (
				SELECT concept_id
				FROM concept 
				WHERE domain_id = 'Condition'
				AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I21%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '410%')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 57054005))
				AND invalid_reason IS NULL
				)
		)	
AND condition_occurrence.condition_concept_id NOT IN
    (192671,35208414,44830170,44836279)
AND condition_occurrence.condition_concept_id NOT IN
    (SELECT concept_id FROM concept_ancestor JOIN concept ON concept_ancestor.descendant_concept_id = concept.concept_id 
     WHERE concept_ancestor.ancestor_concept_id != concept_ancestor.descendant_concept_id AND
     concept_ancestor.ancestor_concept_id IN (192671,35208414,44830170,44836279)
     )
