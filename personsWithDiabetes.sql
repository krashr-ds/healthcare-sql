/* Patients with Diabetes 

Diabetes mellitus 201820
Type 1 diabetes mellitus 201254
Type 2 diabetes mellitus 201826
Type 1 diabetes mellitus uncontrolled 40484648
Type II diabetes mellitus uncontrolled 40482801
Secondary diabetes mellitus 195771
Metabolic syndrome X 436940  
Note the inclusion of Metabolic syndrome X, which is considered ‘prediabetes’ and often associated with related clinical developments */

SELECT * from person
WHERE person.person_id IN (SELECT DISTINCT(condition_occurrence.person_id)
                           FROM condition_occurrence 
						   WHERE condition_occurrence.condition_concept_id IN (201820, 201254, 201826, 40484648, 40482801, 195771, 436940))
