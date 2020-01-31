/* Only persons from California  - 906 persons */

SELECT * FROM person, location
WHERE person.location_id = location.location_id
AND location.state = 'CA'
