/* Ancestors of Atrial Fibrillation and Flutter (SNOMED) */
/* Original author: B. Pagiotti 

47 Rows, including Concepts labeled:

Atrial fibrillation
Atrial flutter
Atrial arrhythmia
Fibrillation
Supraventricular arrhythmia
Cardiac arrhythmia
Heart disease
Cardiac finding
Disorder of cardiovascular system
Disorder of mediastinum
Cardiovascular findingm
Disorder of body system
Disorder of thorax
Mediastinal finding
Viscus structure finding
Disorder of thoracic segment of trunk
Finding of region of thorax
Disorder of trunk
Finding of upper trunk
Disorder by body site
Finding of trunk structuree
Disease
Finding of body region
Finding by site
Clinical finding
*/

SELECT max_levels_of_separation, concept.*
FROM concept_ancestor
JOIN concept ON ancestor_concept_id = concept_id
WHERE descendant_concept_id IN (313217, 314665)
ORDER BY max_levels_of_separation
