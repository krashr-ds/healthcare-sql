SELECT state, count(*)
FROM person, location
WHERE person.location_id = location.location_id
GROUP BY state
