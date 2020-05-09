 /* Concept Relationship 
    'Drug has drug class' 
		87748 rows 
		NOTE: NOT actually an association between a drug and its class
		More an association between generic names of drugs and specific manifestations on the shelf in the pharmacy
		Eg) concept_id_1 (ref): clopidogrel 75 MG Oral Tablet Box of 28 by Dr Reddy's	concept_id_2 (ref): clopidogrel
		    concept_id_1 (ref): Aspirin 75 MG Oral Tablet by Almus	                    concept_id_2 (ref): acetylsalicylic acid
*/

SELECT c.concept_name, cc.concept_name 
FROM concept_relationship cr, concept c, concept cc
WHERE cr.relationship_id = 'Drug has drug class'
AND cr.invalid_reason IS NULL
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
/* AND cc.concept_name LIKE 'acetylsalicylic acid' */
/* AND cc.concept_name like 'clopidogrel' */
