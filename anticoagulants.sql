/* 	ANTICOAGULANTS
   		
	Apixaban 2.5mg, 5mg
	Dabigatran etexilate 75mg, 110mg, 150mg
	Edoxaban 15mg, 30mg, 60mg
	Enoxaparin 60mg, 100mg, 150mg
	Fondaparinux 1.5mg/0.3ml, 2.5mg/0.5ml, 5mg/0.4ml, 7.5mg/0.6ml, 10mg/0.8ml 
	Rivaroxaban 2.5mg, 10mg, 15mg, 20mg
	Warfarin 1mg, 2mg, 2.5mg, 3mg, 4mg, 500mcg, 5mg, 6mg, 7.5mg, 10mg 
	
	NOTE: While this (BELOW) produced a nice tidy result, 
	there were NO ROWS in drug exposure for these entries. *Sigh*
	
	SELECT cc.concept_name, c.*
	FROM concept_relationship cr, concept c, concept cc
	WHERE cr.invalid_reason IS NULL
	AND cr.concept_id_1 = c.concept_id
	AND cr.concept_id_2 = cc.concept_id
	AND cr.relationship_id = 'Is a'
	AND c.domain_id = 'Drug'
	AND c.invalid_reason IS NULL
	AND cc.concept_name IN ('Oral form warfarin','Potassium warfarin','Warfarin sodium','Parenteral form warfarin','Dabigatran etexilate','Dabigatran etexilate mesylate','Rivaroxaban','Apixaban','Fondaparinux','Edoxaban')
	AND cc.vocabulary_id = 'SNOMED'
	AND cc.concept_class_id = 'Pharma/Biol Product'
	AND cc.invalid_reason IS NULL 
	ORDER BY c.concept_name ASC

	HERE is the corrected query, which MUST USE Vocabulary RxNorm and Relationship 'RxNorm is a'
	Result: 97 rows (drugs); 97833 rows (exposed individuals)
*/

SELECT DISTINCT(c.concept_id), c.concept_name, cr.relationship_id, cc.concept_id, cc.concept_name 
FROM concept c, concept_relationship cr, concept cc
WHERE c.invalid_reason IS NULL
AND c.domain_id = 'Drug'
AND c.vocabulary_id = 'RxNorm'
AND (c.concept_name LIKE 'warfarin%' OR c.concept_name LIKE 'dabigatran%' OR c.concept_name LIKE 'rivaroxaban%' OR c.concept_name LIKE 'apixaban%' OR c.concept_name LIKE 'edoxaban%' OR c.concept_name LIKE 'fondaparinux%' OR c.concept_name LIKE 'enoxaparin%')
AND (c.concept_class_id = 'Clinical Drug' OR c.concept_class_id = 'Branded Drug Form')
AND c.concept_id = cr.concept_id_1
AND cc.concept_id = cr.concept_id_2
AND cr.relationship_id = 'RxNorm is a'
ORDER BY c.concept_name ASC
