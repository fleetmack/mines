/*** Female Soccer Alumni ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
  and id_number IN
    (select id_number
       from sport
      where sport_code = 'SOC')
  and id_number IN
    (select id_number
       from entity
      where gender_code = 'F')       