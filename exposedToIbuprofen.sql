/* Persons exposed to Ibuprofen */

SELECT count(DISTINCT person_id) as exposed_peeps FROM drug_exposure 
WHERE drug_concept_id = 19024595
