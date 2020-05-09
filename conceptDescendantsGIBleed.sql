/* Descendants of "Gastrointestinal hemorrhage" Concept ID: 192671 
   ROWS: 185
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
  a.ancestor_concept_id = 192671 AND
  c.invalid_reason IS NULL 
ORDER BY desc_concept_name, min_separation
