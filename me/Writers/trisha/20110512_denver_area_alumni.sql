/*** Denver area alumni for Harry Campbell event ***/
select id_number
from a_dw_address_good  dw
where record_type_code = 'AL'
and dw.p_zipcode BETWEEN '80000-0000' AND '80505-9999'
and dw.id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI');