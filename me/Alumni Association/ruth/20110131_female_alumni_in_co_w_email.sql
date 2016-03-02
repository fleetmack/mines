/*** Female Alums w/ Email in CO ***/
select id_number, pref_mail_name, p_email_address
from a_dw_address_good
where record_type_code = 'AL'
and id_number in
    (select id_number
        from entity
       where gender_code = 'F')
and p_state_code = 'CO'
and p_email_address > ' '
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI')