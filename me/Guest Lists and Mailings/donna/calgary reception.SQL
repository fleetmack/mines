select id_number
from a_dw_address_good  
where p_foreign_cityzip like '%AB%'
and record_type_code in ('FR','AL')
and p_country_code = 'CD'
