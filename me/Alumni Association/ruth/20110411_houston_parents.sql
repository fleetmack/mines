/*** Houston area parents ***/
select id_number, pref_mail_name, pref_name_sort, p_email_address
from a_dw_address_good
where p_zipcode BETWEEN '77000-0000' AND '77899-9999'
and p_email_address > ' '
and id_number in
    (select id_number from entity_record_type where record_type_code = 'PA')
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNI'));