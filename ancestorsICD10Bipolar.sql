/* ICD10 - Ancestors of Bipolar Disorder */
/* Original code: B. Pagiotti */
/* Note subquery made this VERY fast. Although - returns ZERO rows. */

SELECT
  c.concept_id               AS ancestor_concept_id,
  c.concept_name             AS ancestor_concept_name,
  c.concept_code             AS ancestor_concept_code,
  c.concept_class_id         AS ancestor_concept_class_id,
  c.vocabulary_id            AS vocabulary_id,
  a.min_levels_of_separation AS min_separation,
  a.max_levels_of_separation AS max_separation
FROM concept_ancestor AS a
  JOIN concept AS c 
  ON a.ancestor_concept_id = c.concept_id
WHERE 
  a.ancestor_concept_id != a.descendant_concept_id AND 
  a.descendant_concept_id IN (SELECT concept_id FROM concept WHERE concept_code LIKE 'F31%' and vocabulary_id = 'ICD10CM') AND
  c.invalid_reason IS NULL 
ORDER BY vocabulary_id, min_separation
;
