/* Relationships - "Is a" SNOMED 'Antiplatelet agent'
   
   Domain: Drug
   Relationship ID: 'Is a'
   		
	RESULT: 30 ROWS; 17 Unique Substances
	Anagrelide Aspirin Cangrelor Cilostazol Clopidogrel Dipyridamole Eptifibatide Iloprost Indobufen Prasugrel Resveratrol Ticagrelor Ticlopidine Tirofiban
    Treprostinil Triflusal Vorapaxar
	
	NOTE: Some of these medications, such as anagrelide, aspirin, cilstazol, clopidogrel, dypyridamole have BOTH concept_class_id 'Pharma/Biol Product' and 'Substance'
	      Others, like cangrelor, indobufen, resveratrol and triflusal are concept_class_id 'Substance' ONLY
	
*/

SELECT c.*
FROM concept_relationship cr, concept c, concept cc
WHERE cr.invalid_reason IS NULL
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
AND cr.relationship_id = 'Is a'
AND c.invalid_reason IS NULL
AND cc.concept_name = 'Antiplatelet agent'
AND cc.vocabulary_id = 'SNOMED'
AND cc.invalid_reason IS NULL 
ORDER BY c.concept_name ASC
