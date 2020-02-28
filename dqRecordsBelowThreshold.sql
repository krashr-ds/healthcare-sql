/*********
get number of records and the proportion to total number of eligible records that fall below this threshold


**********/


SELECT SUM(total_rows.inv_row) as inv_count, (1.0*SUM(total_rows.inv_row)/SUM(total_rows.row_count)) AS percent_inv
FROM
(
	SELECT 1 AS row_count, (CASE WHEN observation_datetime < '1940-01-01' THEN 1 ELSE 0 END) AS inv_row FROM observation
) total_rows
