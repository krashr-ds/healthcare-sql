/* VISIT_OCCURRENCE, inner join PERSON */

select v.*
from visit_occurrence v
inner join person p
on v.person_id = p.person_id
where p.person_id = 1;
