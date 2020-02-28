/*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible 
records with datetimes that do not occur on or after their corresponding datetimes

Cleaned up by: Kyle P. Rasku RN
**********/


SELECT  violated.visits_before_birth, 
        CASE WHEN denominator.num_rows = 0 THEN 0 
		 ELSE 1.0*violated.visits_before_birth/denominator.num_rows 
		END  AS pct_violated
FROM
(
	SELECT COUNT(visit_start_date) AS visits_before_birth
    FROM VISIT_OCCURRENCE
    JOIN PERSON
	ON VISIT_OCCURRENCE.person_id = PERSON.person_id
	WHERE PERSON.birth_datetime > VISIT_OCCURRENCE.visit_start_date
) violated,
(
	SELECT COUNT(*) AS num_rows
	FROM VISIT_OCCURRENCE
) denominator
;
