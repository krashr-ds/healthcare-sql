/* 
New England (Connecticut, Maine, Massachusetts, New Hampshire, Rhode Island, and Vermont)
Mid-Atlantic (New Jersey, New York, and Pennsylvania)
East North Central (Illinois, Indiana, Michigan, Ohio, and Wisconsin) 
West North Central (Iowa, Kansas, Minnesota, Missouri, Nebraska, North Dakota, and South Dakota)
South Atlantic (Delaware, Florida, Georgia, Maryland, North Carolina, South Carolina, Virginia, District of Columbia, and West Virginia) 
East South Central (Alabama, Kentucky, Mississippi, and Tennessee) 
West South Central (Arkansas, Louisiana, Oklahoma, and Texas)
Mountain (Arizona, Colorado, Idaho, Montana, Nevada, New Mexico, Utah, and Wyoming) 
Pacific (Alaska, California, Hawaii, Oregon, and Washington) 
*/

SELECT 
	CASE 
		WHEN TRIM(state) IN ('CT','ME','MA','NH','RI','VT') THEN 'New England'
		WHEN TRIM(state) IN ('NJ','NY','PA') THEN 'Mid-Atlantic'
		WHEN TRIM(state) IN ('IL','IN','MI','OH','WI') THEN 'East North Central'
		WHEN TRIM(state) IN ('IA','KS','MN','MO','NE','ND','SD') THEN 'West North Central'
		WHEN TRIM(state) IN ('DE','FL','GA','MD','NC','SC','VA','DC','WV') THEN 'South Atlantic'
		WHEN TRIM(state) IN ('AL','KY','MS','TN') THEN 'East South Central'
		WHEN TRIM(state) IN ('AR','LA','OK','TX') THEN 'West South Central'
		WHEN TRIM(state) IN ('AZ','CO','ID','MT','NV','NM','UT','WY') THEN 'Mountain'
		WHEN TRIM(state) IN ('AK','CA','HI','OR','WA') THEN 'Pacific'
	END Region,
	count(*)
FROM Person, Location 
WHERE Person.location_id = Location.location_id
GROUP BY Region 
	
