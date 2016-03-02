/*** Wrestling Alumni ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number in
    (select id_number from sport where sport_code = 'WR');