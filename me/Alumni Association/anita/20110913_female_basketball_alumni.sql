/*** Female Basketball Alumnae ***/
select dw.id_number, dw.pref_mail_name, dw.salutation, dw.p_email_address
from a_dw_addresS_good  dw,
     entity e
where dw.id_number = e.id_number
and e.gender_code = 'F'
and dw.record_type_code = 'AL'
and dw.id_number IN
    (select id_number
       from sport
      where sport_code = 'BKB')
and dw.p_email_address > ' ';