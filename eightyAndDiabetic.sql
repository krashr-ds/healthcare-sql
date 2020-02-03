
/* 80 year-olds with DM

Conditions: 
Diabetes mellitus 201820
Type 1 diabetes mellitus 201254
Type 2 diabetes mellitus 201826
Type 1 diabetes mellitus uncontrolled 40484648
Type II diabetes mellitus uncontrolled 40482801
Secondary diabetes mellitus 195771
Metabolic syndrome X 436940  
Note the inclusion of Metabolic syndrome X, which is considered ‘prediabetes’ and often associated with related clinical developments */

SELECT (strftime('%Y', 'now') - year_of_birth) - (strftime('%m', 'now') < month_of_birth) as Age, concept.concept_name, count(*)
FROM person, condition_occurrence, concept
WHERE Age = 80
AND person.person_id = condition_occurrence.person_id
AND condition_occurrence.condition_concept_id IN (201820, 201254, 201826, 40484648, 40482801, 195771, 436940)
AND condition_occurrence.condition_concept_id = concept.concept_id
GROUP BY concept.concept_name
