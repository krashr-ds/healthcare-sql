/* ingredientAncestors.sql
   What is an ingredient ancestor ? 

DOMAIN: Drug (All)

VOCABULARY_ID 	CONCEPT_CLASS_ID 

National Drug File - Reference Terminology (VA)
NDFRT 			Ind/CI 
NDFRT 			Mechanism of Acttion 
NDFRT 			Chemical Structure
NDFRT 			Physiologic Effect
NDFRT 			Therapeutic Class

WHO Anatomic Therapeutic Chemical Classification
ATC  			ATC 1st
ATC  			ATC 2nd
ATC  			ATC 3rd
ATC  			ATC 4th
ATC  			ATC 5th

Structured Product Labeling (FDA)
SPL  			Vaccine
SPL  			Prescription Drug
SPL  			OTC Drug
SPL  			Non-Stand Allergenic
SPL  			Plasma Derivative

VA National Drug File Class (VA)
VA Class  		VA Class



*/

SELECT c.concept_id, c.concept_name, c.domain_id, c.vocabulary_id, c.concept_class_id, c.concept_code 
FROM concept_ancestor a, concept c, concept cc 
WHERE a.ancestor_concept_id = c.concept_id
AND a.descendant_concept_id = cc.concept_id
AND a.ancestor_concept_id != a.descendant_concept_id
AND cc.vocabulary_id = 'RxNorm'
AND cc.concept_class_id = 'Ingredient'
AND c.invalid_reason IS NULL AND cc.invalid_reason IS NULL 
ORDER BY c.domain_id, c.vocabulary_id 
