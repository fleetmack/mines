select distinct(id_number)
from a_dw_address_good
where flag_dns <> '1'
and flag_omit_from_mail <> '1'
and 
    (
    id_number IN (select id_number from entity_record_type where record_type_code = 'PA')
    OR
    id_number IN (select id_number from entity_record_type where record_type_code = 'PX' and class_year >= '2009')
    OR
    id_number IN (select id_number from entity where record_type_code IN ('PX') and  id_number IN (select id_number from a_dw_pyramid where year_of_giving >= '2009' )))