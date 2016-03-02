/*** Chemical Engineering grads from between 2000 and 2010 ***/
select p_email_address
from a_dw_address_good
where record_type_code = 'AL'
and p_email_address > ' '
and id_number in
    (select id_number
       from a_dw_degrees
      where institution_code = '1'
        and dept_code = 'CPR'
        and degree_year BETWEEN '2000' and '2010');