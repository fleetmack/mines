select distinct(id_number)
from a_dw_address_good
where record_type_code = 'AL'
and id_number in
    (select id_number
       from a_dw_degrees
      where institution_code = '1'
        and dept_code        = 'PET')
and id_number NOT IN
(select id_number
from temp_van_kirk)