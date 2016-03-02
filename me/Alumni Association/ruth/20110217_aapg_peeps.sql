/*** American Association fo Petroleum Geologists ***/
select id_number, pref_mail_name, pref_name_sort, p_email_address
from a_dw_address_good
where p_email_address > ' '
and record_type_code = 'AL'
and id_number IN
    (select id_number
    from awards_and_honors
    where awd_honor_code = 'S02');