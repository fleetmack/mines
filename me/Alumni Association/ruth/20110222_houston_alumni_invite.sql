/*** Houston Alumni for Invite ***/
select id_number
from a_dw_address_good
where p_zipcode between '77000-0000' AND '77899-9999'
and record_type_code = 'AL'
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI');