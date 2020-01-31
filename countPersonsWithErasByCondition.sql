/*
Description: This query is used to count the persons with any number of eras of a
a set of common conditions. 
256723	Pneumonia and influenza
372906	Blindness - both eyes
435371	Hypothermia
440377	Paralysis
441202	Anaphylaxis
*/

SELECT ce.condition_concept_id, c.concept_name, COUNT(DISTINCT person_id) AS num_people
FROM condition_era ce
JOIN concept c
ON c.concept_id = ce.condition_concept_id
WHERE ce.condition_concept_id
IN ( 256723, 372906, 440377, 441202, 435371 )
GROUP BY ce.condition_concept_id, c.concept_name
ORDER BY num_people DESC;
