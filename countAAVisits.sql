/* Count of SUBSEQUENT visits, patients in persons_aa_noanticoag with visits time-related to their atrial arrhythmia
   Kyle P. Rasku, RN April 4, 2020
*/

SELECT p.*, co.condition_start_date, co.condition_end_date, COUNT(vo.visit_occurrence_id) as subsequent_visit_count 
FROM persons_aa_noanticoag p, condition_occurrence co, visit_occurrence vo
WHERE p.person_id = vo.person_id
AND p.person_id = co.person_id
AND (vo.visit_start_date >= co.condition_start_date AND vo.visit_end_date <= co.condition_end_date)
AND co.condition_concept_id = p.condition_id
AND vo.preceding_visit_occurrence_id IS NOT NULL 
GROUP BY p.person_id
