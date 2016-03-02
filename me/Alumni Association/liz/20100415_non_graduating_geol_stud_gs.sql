/*** Non-graduating students and grad students in the GEOL dept ***/
select id_number
--, record_type_code, pref_class_year
from a_dw_address_good
where record_type_code <> 'AL'
and id_number IN
    (select id_number from entity_record_type where record_type_code IN ('ST','GS'))
and id_number NOT IN
    (select id_number from ids where ids_type_code = 'CID' and other_id IN (select id_number from a_temp_hold_ids))
and id_number IN
    (select id_number from a_dw_degrees where degree_code = '401' and dept_code = 'GEOL')
order by record_type_code, pref_class_year;