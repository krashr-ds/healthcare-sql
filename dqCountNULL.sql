/* Data Quality: Count NULLs, Percent of NULLs
   Kyle P. Rasku RN
   
   Pick a field, any field... 
   (I picked preceding_visit_occurrence_id because I knew it had some NULLs.)
*/

SELECT SUM(total_rows.null_row) as null_count, (1.0*SUM(total_rows.null_row)/SUM(total_rows.row_count)) AS percent_null 
FROM
(
	SELECT 1 AS row_count, (CASE WHEN v.preceding_visit_occurrence_id IS NULL THEN 1 ELSE 0 END) AS null_row FROM visit_occurrence v
) total_rows
