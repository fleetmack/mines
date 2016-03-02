/*** Relationships of Coors people who are alumni ***/

select id_number, pref_mail_name
from entity
where record_type_code = 'AL'
and id_number IN
(select relation_id_number
from relationship
where id_number IN
(select id_number
from entity
where last_name = 'Coors'))


union



select id_number, pref_mail_name
from entity
where last_name = 'Coors'
and record_type_code = 'AL'