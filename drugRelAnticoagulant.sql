/* Relationships - "Is a" SNOMED 'Warfarin, Potassium warfarin, Warfarin sodium, Dabigatran etexilate, 
                                  Rivaroxaban, Apixaban, Fondaparinux, Edoxaban' Pharma/Biol Product
   
   Domain: Drug
   Relationship ID: 'Is a'
   		
	RESULT: 33 ROWS; all 'Drugs'
	Apixaban 2.5mg
	Apixaban 5mg
	Dabigatran etexilate 110mg
	Dabigatran etexilate 150mg
	Dabigatran etexilate 75mg
	Edoxaban 15mg
	Edoxaban 30mg
	Edoxaban 60mg
	Fondaparinux 1.5mg/0.3ml
	Fondaparinux 10mg/0.8ml
	Fondaparinux 2.5mg/0.5ml
	Fondaparinux 5mg/0.4ml
	Fondaparinux 7.5mg/0.6ml
	Rivaroxaban 10mg
	Rivaroxaban 15mg
	Rivaroxaban 2.5mg
	Rivaroxaban 20mg
	Warfarin 1mg, 2mg, 2.5mg, 3mg, 4mg, 500mcg, 5mg, 6mg, 7.5mg, 10mg 
		
*/

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
and cc.concept_class_id = 'Pharma/Biol Product'
AND cc.invalid_reason IS NULL 
ORDER BY c.concept_name ASC
