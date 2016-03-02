/*** Email For All Seniors ***/
select id_number, pref_mail_name, pref_name_sort, p_email_address, salutation
from a_dw_address_good
where p_email_address > ' '
and id_number in
(select id_number
from entity_record_type
where record_type_code = 'ST'
and class_year = '2009')
and id_Number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNS','EXE'))