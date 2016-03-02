select id_number, pref_mail_name, pref_name_sort
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year = '1949'
and flag_dns = 0
and flag_omit_from_mail = 0
and id_number NOT IN
(select id_number
from a_dw_assignment
where pref_class_year = '1949'
and ass_type = 'RV')
