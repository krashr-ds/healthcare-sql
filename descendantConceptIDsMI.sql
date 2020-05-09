
/* Descendant Concept IDs of Acute MI 
   56 rows; ALL SNOMED!

   Kyle P. Rasku, RN
*/

SELECT
  c.concept_id               AS desc_concept_id,
  c.concept_name             AS desc_concept_name,
  c.concept_code             AS desc_concept_code,
  c.concept_class_id         AS desc_concept_class_id,
  c.vocabulary_id            AS vocabulary_id,
  a.min_levels_of_separation AS min_separation,
  a.max_levels_of_separation AS max_separation
FROM concept_ancestor AS a
  JOIN concept AS c 
  ON a.descendant_concept_id = c.concept_id
WHERE 
  a.ancestor_concept_id != a.descendant_concept_id AND 
  a.ancestor_concept_id IN (
      SELECT concept_id
		FROM concept 
		WHERE domain_id = 'Condition'
		AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I21%')
			OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '410%')
			OR (vocabulary_id = 'SNOMED' AND concept_code = 57054005))
		AND invalid_reason IS NULL
  ) 
  AND c.invalid_reason IS NULL 
ORDER BY desc_concept_name, min_separation
