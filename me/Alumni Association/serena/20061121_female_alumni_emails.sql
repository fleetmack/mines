/*** Female Alumni Email Addresses ***/
select id_number, pref_mail_name, pref_name_sort, salutation, pref_class_year, p_email_address
from a_dw_address_good
where record_type_code = 'AL'
and p_email_address > ' '
and id_number in
(select id_number
from entity
where gender_code = 'F')