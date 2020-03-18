/* Starting to search for persons with GI Bleed */

SELECT * FROM condition_occurrence, concept
WHERE condition_occurrence.condition_concept_id = concept.concept_id
AND (concept.concept_name LIKE 'gastrointestinal bleed%'
    OR concept.concept_name LIKE 'gastrointestinal hem%')
AND invalid_reason IS NULL 
