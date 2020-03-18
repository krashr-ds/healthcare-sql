/* Heart Attacks 
   3/18/20 Revised & improved:
           ICD9 41000 - 41093
		   ICD10 I21*
		   SNOMED 413444003 - Acute Myocardial Ischemia (disorder)
		          57054005 - Acute MI (disorder)
		   36144 rows returned in 35081ms
*/

SELECT * FROM condition_occurrence, concept
WHERE condition_occurrence.condition_concept_id = concept.concept_id
AND (condition_status_source_value BETWEEN 41000 AND 41093
     OR condition_status_concept_id = 57054005
	 OR condition_status_source_value IN (413444003, 57054005)
	 OR condition_status_source_value LIKE 'I21*')
ORDER BY condition_status_source_value
