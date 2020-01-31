/* Select only MALES : Note, there are 4377 males in our DB (gender_source_value = 1)*/
/* There are also 5623 FEMALES and 0 persons identified in the DB as neither MALE nor FEMALE */

SELECT * FROM person, concept
WHERE person.gender_concept_id = concept.concept_id
AND concept.concept_name = 'MALE'

