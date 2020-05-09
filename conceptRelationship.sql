/* Let's have a limited look at relationships in concept_relationship */

SELECT c.concept_name, cc.concept_name, cr.relationship_id, r.relationship_name
FROM concept_relationship cr, relationship r, concept c, concept cc
WHERE cr.relationship_id = r.relationship_id
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
LIMIT 200
