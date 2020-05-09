/* 

drugIndications.sql
Ingredient Ancestors that are NDFRT Ind/CI

*/

SELECT DISTINCT(c.concept_id), c.concept_name, c.domain_id, c.vocabulary_id, c.concept_class_id, c.concept_code 
FROM concept_ancestor a, concept c, concept cc 
WHERE a.ancestor_concept_id = c.concept_id
AND a.descendant_concept_id = cc.concept_id
AND a.ancestor_concept_id != a.descendant_concept_id
AND c.vocabulary_id = 'NDFRT'
AND c.concept_class_id = 'Ind / CI'
AND cc.vocabulary_id = 'RxNorm'
AND cc.concept_class_id = 'Ingredient'
AND c.invalid_reason IS NULL AND cc.invalid_reason IS NULL 
ORDER BY c.concept_name ASC
