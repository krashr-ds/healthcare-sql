/* Patient 88 - White Female, Born in 1922; still alive. */

SELECT C.Concept_Name, P.*, CC.Concept_Name, CCC.Concept_name, L.location_source_value 
FROM Person P, Concept C, Concept CC, Concept CCC, Location L 
WHERE Person_ID = 88
AND P.gender_concept_id = C.concept_id
AND P.race_concept_id = CC.concept_id
AND P.ethnicity_concept_id = CCC.concept_id
AND P.location_id = L.location_id
