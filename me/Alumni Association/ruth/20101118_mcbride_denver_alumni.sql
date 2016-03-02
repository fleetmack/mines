/*** Denver Area McBride People ***/
select id_number
from a_dw_address_good
where p_zipcode between '80000-0000' and '80505-9999'
and     record_type_code = 'AL'
and   p_email_address > ' '
and     id_number IN
    (select id_number from student_activity where student_activity_code = 'MHA')
and    id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI');