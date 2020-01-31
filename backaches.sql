/* Oh, my aching back! */

SELECT * from person WHERE person_id IN (SELECT DISTINCT(person_id) FROM condition_occurrence WHERE condition_concept_id = 134736)
