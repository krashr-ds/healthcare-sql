/* Drug-Drug Interactions: Ticagrelor / Brilinta
   MoA: Phenylalanine Hydroxylase Activators; Cytochrome P450 3A4 Inhibitors; Cytochrome P450 3A5 Inhibitors; P-Glycoprotein Inhibitors; P2Y12 Receptor Antagonists
   Is a: P2Y12 Platelet Inhibitor; Platelet aggregation inhibitors excl. heparin; Antiplatelet agent
   
   Domain: Drug
		40242827	TICAGRELOR	Drug	NDFRT	Pharma Preparation
		
	RESULT: 31 ROWS
	
	APIXABAN/TICAGRELOR
	ASPIRIN/TICAGRELOR
	ATAZANAVIR/TICAGRELOR
	BOCEPREVIR/TICAGRELOR
	CARBAMAZEPINE/TICAGRELOR
	CLARITHROMYCIN/TICAGRELOR
	CONIVAPTAN/TICAGRELOR
	DABIGATRAN/TICAGRELOR
	DEXAMETHASONE/TICAGRELOR
	FOSPHENYTOIN SODIUM/TICAGRELOR
	INDINAVIR SULFATE/TICAGRELOR
	ITRACONAZOLE/TICAGRELOR
	KETOCONAZOLE/TICAGRELOR
	LOVASTATIN/TICAGRELOR
	MIBEFRADIL DIHYDROCHLORIDE/TICAGRELOR
	MIFEPRISTONE/TICAGRELOR
	NEFAZODONE/TICAGRELOR
	NELFINAVIR MESYLATE/TICAGRELOR
	PHENOBARBITAL/TICAGRELOR
	PHENYTOIN/TICAGRELOR
	POSACONAZOLE/TICAGRELOR
	PRIMIDONE/TICAGRELOR
	RIFAMPIN/TICAGRELOR
	RITONAVIR/TICAGRELOR
	RIVAROXABAN/TICAGRELOR
	SAQUINAVIR/TICAGRELOR
	SIMVASTATIN/TICAGRELOR
	TELAPREVIR/TICAGRELOR
	TELITHROMYCIN/TICAGRELOR
	TICAGRELOR/TIPRANAVIR
	TICAGRELOR/VORICONAZOLE
	
	Relationship ID: Has drug-drug Inter
	Concept ID: 40242827
	Concept Name: TICAGRELOR
	Vocabulary ID: NDFRT
		
*/

SELECT cr.relationship_id, c.concept_id, c.concept_name, c.domain_id, c.vocabulary_id, cc.concept_name, cc.domain_id, cc.vocabulary_id 
FROM concept_relationship cr, concept c, concept cc
WHERE cr.invalid_reason IS NULL
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
AND cr.concept_id_1 = 40242827
AND cr.relationship_id = 'Has drug-drug inter'
AND c.vocabulary_id = 'NDFRT'
ORDER BY cc.concept_name ASC
