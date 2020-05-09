/* LOINC Relationships
   Domain: Measurement (Other Domains: Observation; Meas Value)
   Concept Class ID: Lab Test; LOINC Class; LOINC Hierarchy; Clinical Observation 
   Relationship IDs: Contained in panel; Concept replaced by; Maps to; Is a; LOINC - SNOMED eq; LOINC - CPT4 eq; Has Answer; Answer of; Mapped from 
   ROWS: 513852
   NOTE: There are SOME drugs and substances in this list under 'LOINC Hierarchy' - Not sure why they are there.
*/

SELECT cr.relationship_id, c.concept_id, c.concept_name, c.domain_id, c.vocabulary_id, c.concept_class_id, cc.concept_name, cc.domain_id, cc.vocabulary_id, cc.concept_class_id
FROM concept_relationship cr, concept c, concept cc
WHERE cr.invalid_reason IS NULL
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
AND c.vocabulary_id = 'LOINC'
AND c.domain_id = 'Measurement'
