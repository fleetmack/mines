select id_number
from a_dw_address_good
where p_country_code in ('UK','EN','IE','FR','ST')
and record_type_code <> 'CP'
