/* Device Exposures for Patient 88 */

SELECT d.visit_occurrence_id,
p.provider_name,
c.concept_name as device_concept, 
cc.concept_name as device_type, 
ccc.concept_name as device_source,
d.device_exposure_start_date, 
d.device_exposure_end_date
FROM device_exposure d, concept c, concept cc, concept ccc, provider p 
WHERE d.person_id = 88
AND d.device_concept_id = c.concept_id
AND d.device_type_concept_id = cc.concept_id
AND d.device_source_concept_id = ccc.concept_id
AND d.provider_id = p.provider_id
ORDER BY d.visit_occurrence_id, d.device_exposure_start_date
