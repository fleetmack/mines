select count(id_number)
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year between '1950' and '2003'
and p_flag_foreign = 0
and id_number NOT IN
    (select id_number
       from mailing_list
      where mail_list_code IN ('AAECC','AAEL'))






