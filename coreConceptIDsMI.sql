      /* Core Concept IDs - Acute MI
	     55 ROWS

312327	Acute myocardial infarction
1569126	ST elevation (STEMI) and non-ST elevation (NSTEMI) myocardial infarction
1569127	ST elevation (STEMI) myocardial infarction of anterior wall
1569128	ST elevation (STEMI) myocardial infarction of inferior wall
1569129	ST elevation (STEMI) myocardial infarction of other sites
35207684	ST elevation (STEMI) myocardial infarction of unspecified site
35207685	Non-ST elevation (NSTEMI) myocardial infarction
44819697	Acute myocardial infarction of other anterior wall, subsequent episode of care
44819698	Acute myocardial infarction, of inferolateral wall
44819699	Acute myocardial infarction of inferolateral wall, episode of care unspecified
44819700	Acute myocardial infarction of inferolateral wall, initial episode of care
44819701	Acute myocardial infarction, subendocardial infarction
44819702	Acute myocardial infarction, unspecified site
44820857	Acute myocardial infarction, of anterolateral wall
44820858	Acute myocardial infarction of anterolateral wall, subsequent episode of care
44820859	Acute myocardial infarction of inferolateral wall, subsequent episode of care
44820860	Acute myocardial infarction of inferoposterior wall, subsequent episode of care
44820861	Acute myocardial infarction of unspecified site, subsequent episode of care
44823111	Acute myocardial infarction of anterolateral wall, initial episode of care
44824237	Acute myocardial infarction of anterolateral wall, episode of care unspecified
44825428	Acute myocardial infarction, of other inferior wall
44825429	Subendocardial infarction, initial episode of care
44825430	Acute myocardial infarction of unspecified site, initial episode of care
44826635	Acute myocardial infarction of inferoposterior wall, episode of care unspecified
44826636	Acute myocardial infarction of other specified sites, episode of care unspecified
44827782	Acute myocardial infarction of other anterior wall, initial episode of care
44828972	True posterior wall infarction, episode of care unspecified
44828973	Subendocardial infarction, subsequent episode of care
44830079	Acute myocardial infarction, of other lateral wall
44831236	Acute myocardial infarction of other anterior wall, episode of care unspecified
44831237	True posterior wall infarction, subsequent episode of care
44832372	Acute myocardial infarction
44832373	Acute myocardial infarction, of inferoposterior wall
44832374	Acute myocardial infarction of other inferior wall, subsequent episode of care
44832375	Acute myocardial infarction of other lateral wall, episode of care unspecified
44832376	Acute myocardial infarction of other specified sites, subsequent episode of care
44833561	Acute myocardial infarction of inferoposterior wall, initial episode of care
44834718	Acute myocardial infarction, of other anterior wall
44834719	Acute myocardial infarction of other inferior wall, episode of care unspecified
44834720	Acute myocardial infarction of other lateral wall, initial episode of care
44834721	Acute myocardial infarction of other lateral wall, subsequent episode of care
44834722	Acute myocardial infarction, true posterior wall infarction
44834723	Acute myocardial infarction, of other specified sites
44834724	Acute myocardial infarction of other specified sites, initial episode of care
44835926	Acute myocardial infarction of other inferior wall, initial episode of care
44835927	Subendocardial infarction, episode of care unspecified
44835928	Acute myocardial infarction of unspecified site, episode of care unspecified
44837099	True posterior wall infarction, initial episode of care
45533436	ST elevation (STEMI) myocardial infarction involving right coronary artery
45557536	ST elevation (STEMI) myocardial infarction involving other sites
45562340	ST elevation (STEMI) myocardial infarction involving left main coronary artery
45572079	ST elevation (STEMI) myocardial infarction involving left anterior descending coronary artery
45572080	ST elevation (STEMI) myocardial infarction involving left circumflex coronary artery
45576865	ST elevation (STEMI) myocardial infarction involving other coronary artery of anterior wall
45605779	ST elevation (STEMI) myocardial infarction involving other coronary artery of inferior wall
	  
*/
	  
SELECT *
	FROM concept 
	WHERE domain_id = 'Condition'
	AND ((vocabulary_id = 'ICD10CM' AND concept_code LIKE 'I21%')
		OR (vocabulary_id = 'ICD9CM' AND concept_code LIKE '410%')
		OR (vocabulary_id = 'SNOMED' AND concept_code = 57054005))
	AND invalid_reason IS NULL
