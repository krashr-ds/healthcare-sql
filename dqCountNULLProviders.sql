SELECT SUM(total_rows.null_row) as null_count, (1.0*SUM(total_rows.null_row)/SUM(total_rows.row_count)) AS percent_null
FROM
(
SELECT 1 AS row_count, (CASE WHEN v.provider_id IS NULL THEN 1 ELSE 0 END) AS null_row FROM visit_occurrence v
) total_rows
