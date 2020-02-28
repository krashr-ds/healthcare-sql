/* Validate Concept Codes: ICD9CM, ICD10CM; Exclude procedures 

   This is basic format validation; this does not ensure codes are in the code database.
   
   NOTE: Install & load /usr/lib/sqlite3/pcre.so before attempting to execute.
   
   Regular Expressions Debugged here: https://regex101.com/
   
   :) !
   Kyle P. Rasku RN
*/

SELECT SUM(total_ICDcode_rows.bad_code) as badcode_count, (1.0*SUM(total_ICDcode_rows.bad_code)/SUM(total_ICDcode_rows.row_count)) AS percent_bad FROM 
(
SELECT 1 AS row_count, CASE WHEN concept_code REGEXP '([A-TV-Z|a-tv-z|\d])([\d])([A-TV-Z|a-tv-z|\d])(.?)([A-TV-Z|a-tv-z|\d]{0,4})' THEN 0 ELSE 1 END AS bad_code 
FROM concept
WHERE vocabulary_id IN ('ICD9CM', 'ICD10CM')
AND invalid_reason IS NULL 
AND domain_id = 'Condition'
) total_ICDcode_rows
