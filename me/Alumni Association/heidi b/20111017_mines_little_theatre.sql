/*** Mines Little Theatre People ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
    (select id_number
       from student_activity
      where student_activity_code = 'MLT')
and id_number NOT IN
    (select id_number
       from mailing_list
      where mail_list_code IN ('DNI','DNM'))       