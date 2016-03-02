/*** Alumni Grad Studetns by Dept  ***/
select distinct e.id_number, e.pref_mail_name, e.pref_name_sort, e.salutation, d.dept_code
from entity e,
        a_dw_degrees  d
where d.id_number(+) = e.id_number
and e.id_number IN
    (SELECT id_number FROM entity_record_type WHERE record_type_code = 'GS')
and dept_code > ' '