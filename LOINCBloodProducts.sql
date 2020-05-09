/* LOINC - Blood Products

   Relationship ID: Subsumes; Is a (only 'Blood Bank')
   ROWS: 34
   
	5% plasma protein fraction
	Acid citrate dextrose | Blood product unit
	Albumin
	Antithrombin
	Apheresis
	Autologous erythrocytes | patient
	Autologous whole blood
	Blood Bank
	Blood product (general)
	Blood product.other
	Coagulation Factors
	Cryoprecipitate
	Cryoprecipitate poor plasma
	Date and time of pheresis procedure | patient
	Erythrocytes
	Fresh frozen plasma
	Frozen erythrocytes
	Granulocytes
	Immune Globulin
	Packed erythrocytes
	Pentaspan
	Plasma
	Platelet concentrate
	Plateletpheresis
	Platelets
	Pooled cryoprecipitate
	Pooled fresh frozen plasma
	Pooled platelet concentrate units | Blood product unit
	Pooled platelets
	RhoGam
	Stem cell product
	Transfuse blood exchange transfusion | patient
	Washed packed erythrocytes | patient
	Whole blood
  
*/

SELECT cr.relationship_id, c.concept_id, c.concept_name, c.domain_id, c.vocabulary_id, c.concept_class_id, cc.concept_name, cc.domain_id, cc.vocabulary_id, cc.concept_class_id
FROM concept_relationship cr, concept c, concept cc
WHERE cr.invalid_reason IS NULL
AND cr.concept_id_1 = c.concept_id
AND cr.concept_id_2 = cc.concept_id
AND c.vocabulary_id = 'LOINC'
AND c.concept_name LIKE 'Blood products'
ORDER BY cc.concept_name ASC 


