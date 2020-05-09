/* Create a subset of persons_aa_noanticoag
   Age <= 70
   Region - West & Mountain
   2 or more visits r/t their AFib and/or Flutter
   721 persons
   
   Kyle P. Rasku RN April 4, 2020
*/

CREATE TABLE persons_aa_noanticoag2
AS
SELECT p.person_id as person_id, p.gender as gender, p.month_of_birth as month_of_birth, p.year_of_birth as year_of_birth, 
(strftime('%Y', 'now') - p.year_of_birth) - (strftime('%m', 'now') < p.month_of_birth) as age, 
p.race as race, p.ethnicity as ethnicity, p.state as state_of_residence, p.condition_id as condition_id, 
p.condition_name as condition_name, co.condition_start_date as condition_start_date, 
co.condition_end_date as condition_end_date, COUNT(vo.visit_occurrence_id) as subsequent_visit_count, NULL as comorbidities
FROM persons_aa_noanticoag p, condition_occurrence co, visit_occurrence vo
WHERE p.person_id = vo.person_id
AND p.person_id = co.person_id
AND p.state IN ('AZ','CO','ID','MT','NV','NM','UT','WY','AK','CA','HI','OR','WA')
AND (strftime('%Y', 'now') - p.year_of_birth) - (strftime('%m', 'now') < p.month_of_birth) <= 70
AND (vo.visit_start_date >= co.condition_start_date AND vo.visit_end_date <= co.condition_end_date)
AND co.condition_concept_id = p.condition_id
AND vo.preceding_visit_occurrence_id IS NOT NULL 
GROUP BY p.person_id;

