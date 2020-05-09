/* Drugs for a given Condition Era; Person 88 
   Less useful than I had hoped : There's a lot of overlap in condition eras!
*/

SELECT drug_era.drug_era_id, drug_era.drug_era_start_date, drug_era.drug_era_end_date, concept2.concept_name AS drug_name, concept.concept_name as condition_name, 
condition_era.condition_era_start_date, condition_era.condition_era_end_date
FROM person, condition_era, drug_era, concept, concept AS concept2 
WHERE person.person_id = 88
AND person.person_id = condition_era.person_id
AND condition_era.condition_concept_id = concept.concept_id 
AND person.person_id = drug_era.person_id
AND drug_era.drug_era_start_date BETWEEN condition_era.condition_era_start_date and condition_era.condition_era_end_date
AND drug_era.drug_era_end_date BETWEEN condition_era.condition_era_start_date and DATE(condition_era.condition_era_end_date, '+1 month')
AND drug_era.drug_concept_id = concept2.concept_id
GROUP BY condition_name, drug_name 
