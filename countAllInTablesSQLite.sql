/* Analyze, then Select Number of Rows from Each Table */
/* Smart Code by DinoCoderSaurus - https://stackoverflow.com/users/5577076/dinocodersaurus */

ANALYZE;
select  DISTINCT tbl_name, CASE WHEN stat is null then 0 else cast(stat as INT) END numrows 
from sqlite_master m 
LEFT JOIN sqlite_stat1 stat on m.tbl_name = stat.tbl 
where m.type='table'
and m.tbl_name not like 'sqlite_%'
order by 1;
