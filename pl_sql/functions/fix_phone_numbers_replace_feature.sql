select id_number, b_phone_formatted, replace(replace(replace(replace(replace(replace(b_phone_formatted,'x'),'('),')'),' '),'.'),'-')
from a_dw_address_good
where b_phone_formatted like '% %'
and b_phone_formatted <> ' '
and length(replace(replace(replace(replace(replace(replace(b_phone_formatted,'x'),'('),')'),' '),'.'),'-')) <> 10