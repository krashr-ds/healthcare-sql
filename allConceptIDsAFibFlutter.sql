/* Get Concept IDs - Atrial Fibrillation & Flutter

   25 ROWS
	313217		Atrial fibrillation
	1569170		Atrial fibrillation and flutter
	1569171		Chronic atrial fibrillation
	1569172		Typical atrial flutter
	1569173		Atypical atrial flutter
	1569174		Unspecified atrial fibrillation and atrial flutter
	4108832		Atrial fibrillation and flutter
	4117112		Controlled atrial fibrillation
	4119601		Lone atrial fibrillation
	4119602		Non-rheumatic atrial fibrillation
	4141360		Chronic atrial fibrillation
	4154290		Paroxysmal atrial fibrillation
	4199501		Rapid atrial fibrillation
	4232691		Permanent atrial fibrillation
	4232697		Persistent atrial fibrillation
	35207784	Paroxysmal atrial fibrillation
	35207785	Persistent atrial fibrillation
	37395821	Familial atrial fibrillation
	44782442	Atrial fibrillation with rapid ventricular response
	44820868	Atrial flutter
	44821957	Atrial fibrillation
	44824248	Atrial fibrillation and flutter
	45572094	Unspecified atrial flutter
	45576876	Unspecified atrial fibrillation
	45768480	Longstanding persistent atrial fibrillation

*/

SELECT concept_id, concept_name   /* AFib & Flutter */
			FROM TERMS.concept 
			WHERE domain_id = 'Condition'
			AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I48%')
				OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '427.3%')
				OR (vocabulary_id = 'SNOMED' AND concept_code = 49436004))
			AND invalid_reason IS NULL
	  UNION
	  SELECT concept_id, concept_name  /* Descendants of AFib & Flutter */    
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
		ORDER BY concept_id ASC 
