/* 127,911 rows with decimal ICD codes */

SELECT *
FROM concept
WHERE concept_code LIKE '%.%'
AND vocabulary_id LIKE 'ICD%'
