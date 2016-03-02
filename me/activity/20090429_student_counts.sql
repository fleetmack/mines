/*** Students And Non-Students Have Accepted Invite To An Event ***/
select distinct(activity_code)
from activity
where substr(start_dt,1,4) = '2009'
and activity_participation_code = 'IA'
and id_number IN
    (select id_number from entity_record_type WHERE record_type_code IN 'AL')
and id_number IN
    (select id_number from entity_record_type WHERE record_type_code NOT IN ('AL'))    