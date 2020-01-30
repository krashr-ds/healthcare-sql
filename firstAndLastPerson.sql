/* First & Last Person; a little extra work to exclude the column titles */
/* Kyle Rasku, RN 1/30/2020 */

SELECT * FROM person
WHERE person_id = (SELECT person_id FROM person ORDER BY person_id ASC LIMIT 1)
OR person_id = (SELECT person_id FROM person WHERE person_id != 'person_id' ORDER BY person_id DESC LIMIT 1)
