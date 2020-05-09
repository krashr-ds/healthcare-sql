/* Relationships - Ticagrelor / Brilinta
   MoA: Phenylalanine Hydroxylase Activators; Cytochrome P450 3A4 Inhibitors; Cytochrome P450 3A5 Inhibitors; P-Glycoprotein Inhibitors; P2Y12 Receptor Antagonists
   Is a: P2Y12 Platelet Inhibitor; Platelet aggregation inhibitors excl. heparin; Antiplatelet agent
   
   Domain: Drug
		
		40241186	Ticagrelor	Drug	RxNorm	Ingredient
		40242827	TICAGRELOR	Drug	NDFRT	Pharma Preparation
		40252640	ticagrelor	Drug	ATC	ATC 5th
		44782808	Ticagrelor	Drug	SNOMED	Substance
		45767147	Ticagrelor	Drug	SNOMED	Pharma/Biol Product
		
		45959405	Ticagrelor	Drug	SNOMED	Pharma/Biol Product INVALID (left out)
		
	Domain: Observation
		45957490	Ticagrelor	Observation	SNOMED	Substance
		
	RESULT: 98 ROWS
	
	Relationship IDs: RxNorm ing of; Maps to; Mapped from; Has brand name; RxNorm - SNOMED eq; RxNorm - ATC name; Has drug-drug inter; NDFRT - RxNorm eq; Has MoA; Drug class of drug;
	ATC - RxNorm name; ATC - RxNorm; Maps to; ATC - RxNorm; ATC - SNOMED eq; Is a; Active ing of; Causative agent of (applies to adverse reaction (Condition) or allergy (Observation));
    Subsumes; Spec active ing of (Observation)
		
*/

SELECT cr.relationship_id, c.concept_name, c.domain_id, c.vocabulary_id, cc.concept_name, cc.domain_id, cc.vocabulary_id 
FROM concept_relationship cr, concept c, concept cc
WHERE cr.invalid_reason IS NULL
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
AND cr.concept_id_1 IN (40241186, 40242827, 40252640, 44782808, 45767147, 45957490)
