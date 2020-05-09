/* Persons with Lung Disorders who were exposed to Amiodarone 
   who had conditions related to drug-induced disorders of the respiratory system
   37017059, 4120268, 4051465, 4119793, 4112813, 4140472, 4110182, 4112814
   
   379 persons out of 1304 - a not-insignificant 29%
   with 2 or more visits related to the time of their their condition_occurrence
*/

SELECT p.person_id as person_id, p.gender as gender, p.month_of_birth as month_of_birth, p.year_of_birth as year_of_birth, 
(strftime('%Y', 'now') - p.year_of_birth) - (strftime('%m', 'now') < p.month_of_birth) as age, 
p.race as race, p.ethnicity as ethnicity, p.state as state_of_residence, co.condition_concept_id as condition_id, 
c.concept_name as condition_name, co.condition_start_date as condition_start_date, 
co.condition_end_date as condition_end_date, COUNT(vo.visit_occurrence_id) as subsequent_visit_count
FROM amiodarone_exposure p, condition_occurrence co, visit_occurrence vo, concept c
WHERE p.person_id = vo.person_id
AND p.person_id = co.person_id
AND (vo.visit_start_date >= co.condition_start_date AND vo.visit_end_date <= co.condition_end_date)
AND co.condition_concept_id = c.concept_id 
AND co.condition_concept_id IN (SELECT DISTINCT(concept_id)
								FROM concept_ancestor
								JOIN concept ON ancestor_concept_id = concept_id
								WHERE descendant_concept_id IN (37017059, 4120268, 4051465, 4119793, 4112813, 4140472, 4110182, 4112814))
AND vo.preceding_visit_occurrence_id IS NOT NULL 
GROUP BY p.person_id
