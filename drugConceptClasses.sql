 /* Drug Concept Classes / Vocabularies */ 
 
 /* 71 rows 
 Concept Class / Vocabulary 
ATC 1st	ATC
ATC 2nd	ATC
ATC 3rd	ATC
ATC 4th	ATC
ATC 5th	ATC
CPT4	CPT4
HCPCS	HCPCS
11-digit NDC	NDC
9-digit NDC	NDC
Chemical Structure	NDFRT
Dose Form	NDFRT
Ind / CI	NDFRT
Mechanism of Action	NDFRT
PK	NDFRT
Pharma Preparation	NDFRT
Pharmacologic Class	NDFRT
Physiologic Effect	NDFRT
Therapeutic Class	NDFRT
Brand Name	RxNorm
Branded Dose Group	RxNorm
Branded Drug	RxNorm
Branded Drug Comp	RxNorm
Branded Drug Form	RxNorm
Branded Pack	RxNorm
Clinical Dose Group	RxNorm
Clinical Drug	RxNorm
Clinical Drug Comp	RxNorm
Clinical Drug Form	RxNorm
Clinical Pack	RxNorm
Dose Form	RxNorm
Dose Form Group	RxNorm
Ingredient	RxNorm
Precise Ingredient	RxNorm
Quant Branded Drug	RxNorm
Quant Clinical Drug	RxNorm
Brand Name	RxNorm Extension
Branded Drug	RxNorm Extension
Branded Drug Box	RxNorm Extension
Branded Drug Comp	RxNorm Extension
Branded Drug Form	RxNorm Extension
Branded Pack	RxNorm Extension
Branded Pack Box	RxNorm Extension
Clinical Drug	RxNorm Extension
Clinical Drug Box	RxNorm Extension
Clinical Drug Comp	RxNorm Extension
Clinical Drug Form	RxNorm Extension
Clinical Pack	RxNorm Extension
Clinical Pack Box	RxNorm Extension
Dose Form	RxNorm Extension
Ingredient	RxNorm Extension
Marketed Product	RxNorm Extension
Quant Branded Box	RxNorm Extension
Quant Branded Drug	RxNorm Extension
Quant Clinical Box	RxNorm Extension
Quant Clinical Drug	RxNorm Extension
Supplier	RxNorm Extension
Pharma/Biol Product	SNOMED
Qualifier Value	SNOMED
Substance	SNOMED
Animal Drug	SPL
Cellular Therapy	SPL
Ingredient	SPL
Non-Stand Allergenic	SPL
OTC Drug	SPL
Plasma Derivative	SPL
Prescription Drug	SPL
SPL	SPL
Standard Allergenic	SPL
Supplement	SPL
Vaccine	SPL
VA Class	VA Class */

SELECT DISTINCT concept_class_id, vocabulary_id
FROM concept 
WHERE domain_id = 'Drug'
AND invalid_reason IS NULL
ORDER BY vocabulary_id, concept_class_id 
