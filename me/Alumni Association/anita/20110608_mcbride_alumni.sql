/*** McBride Alumni ***/
select id_number, pref_mail_name, p_email_address
from a_dw_address_good
where record_type_code = 'AL'
and p_email_address > ' '
and id_number in
    (select id_number from student_activity where student_activity_code = 'MHA')