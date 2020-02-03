SELECT 
 CASE WHEN TRIM(gender_source_value) == '1' THEN 'Male'
      WHEN TRIM(gender_source_value) == '2' THEN 'Female'
	  ELSE 'Other' END gender, count(*) 
FROM person GROUP BY gender
