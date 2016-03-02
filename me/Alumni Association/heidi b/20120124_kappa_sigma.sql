/*** Kappa Sigma ***/
SELECT id_number, pref_mail_name, pref_name_sort, p_email_address
from a_dw_address_good
where record_type_code = 'AL'
and p_email_address > ' '
and id_number IN
    (select id_number
       from student_activity
      where student_activity_code = 'FSKS');