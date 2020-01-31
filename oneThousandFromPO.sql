/* Select the first 1000 rows from a large table */
/* Filter out annoying row containing row headings */

SELECT * from procedure_occurrence 
WHERE procedure_concept_id != 'procedure_concept_id'
LIMIT 1000
