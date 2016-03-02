/*** Non-Alumni Grad Studetns by Dept --- note: there already is a PB report for this under Alumni ***/
select distinct e.id_number, e.pref_mail_name, e.pref_name_sort, e.salutation, d.dept_code
from entity e,
        a_dw_degrees  d
where d.id_number(+) = e.id_number
and e.record_type_code = 'GS'
and dept_code > ' '