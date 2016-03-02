/*** Sigma Nu people ***/
select id_number
from a_dw_address_good
where id_number in
    (select id_number from student_activity where student_activity_code = 'FSSN');