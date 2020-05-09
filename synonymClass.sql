/* There are ONLY English language synonyms (5.5 million of them) */ 
/* We can narrow them down with concept class Unit, Domain, etc. */

SELECT DISTINCT(cs.concept_synonym_name), cs.concept_id, c.concept_class_id
FROM concept_synonym cs, concept c
WHERE cs.language_concept_id = 4180186
AND cs.concept_id = c.concept_id
AND c.concept_class_id = 'Unit'
