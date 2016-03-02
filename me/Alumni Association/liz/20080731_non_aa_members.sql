/*** Non-Members of AA ***/
select id_number, salutation, pref_mail_name, pref_name_sort, p_email_address
from a_dw_address_good
where record_type_code = 'AL'
  and p_email_address > ' '
and id_number NOT IN
    (select id_number
    from a_dw_memb 
    where current_active_member = '1')