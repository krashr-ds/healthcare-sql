/* PERSON left outer join MEASUREMENT */

SELECT m.*
FROM measurement m
LEFT OUTER JOIN person p 
ON m.person_id = p.person_id
WHERE p.person_id = 1;
