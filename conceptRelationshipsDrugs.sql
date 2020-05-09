/* Concept Relationship - Drug Relationships - 16 rows
		Concept ID 4333659 Platelet Aggregation Inhibitor (Pharmacologic Class)
		
		Concepts FROM 4333659
		Subsumes: ASPIRIN, DYPYRIDAMOLE, TICLOPIDINE (Ticlid), EPTIFIBATIDE (Integrilin), TIROFIBAN (Aggrastat), Protease-activated Receptor-1 Agonist
		Is a: Drug Products by FDA Established Class
		Has physio effect: Decreased Platelet Aggregation
		
		Concepts TO 4333659
		Subsumes: Drug Products by FDA Established Class
		Is a: ASPIRIN, DYPYRIDAMOLE, TICLOPIDINE (Ticlid), EPTIFIBATIDE (Integrilin), TIROFIBAN (Aggrastat), Protease-activated Receptor-1 Agonist
		
		NOTE: This class DOES NOT contain clopidogrel, ticagrelor; 
		
*/

SELECT cr.relationship_id, c.concept_name, cc.concept_name 
FROM concept_relationship cr, concept c, concept cc
WHERE cr.invalid_reason IS NULL
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
AND (cr.concept_id_1 = 4333659 OR cr.concept_id_2 = 4333659)
