/* Lots of VERY Old People */

SELECT AGroup, Count(*) FROM ( 
  SELECT
	CASE 
	WHEN Age BETWEEN 0 AND 30 THEN '0-30'
	WHEN Age BETWEEN 30 AND 50 THEN '30-50'
	WHEN Age BETWEEN 50 AND 65 THEN '50-65'
	WHEN Age BETWEEN 65 AND 80 THEN '65-80'
	WHEN Age BETWEEN 80 AND 100 THEN '80-100'
	WHEN Age > 100 THEN '100+' END As AGroup
	
    FROM ( SELECT (strftime('%Y', 'now') - year_of_birth) - (strftime('%m', 'now') < month_of_birth) as Age FROM person ) 
)
GROUP BY AGroup
	
