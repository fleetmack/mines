/*** For Pet Degrees List ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and flag_omit_from_mail <> '1'
and id_number IN
    (select id_number from a_dw_degrees where institution_code = '1' and dept_code = 'PET')