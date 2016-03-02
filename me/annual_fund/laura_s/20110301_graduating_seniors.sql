/*** Graduating Seniors with contact info ***/
select e.id_number, decode(e.record_type_code,'AL','GS',e.record_type_code) record_type_code,
        decode(e.record_type_code,'AL','X',' ') alumni_indicator,
        e.pref_mail_name, e.salutation, e.pref_name_sort, e.last_name, e.salutation, dw.dept_code,
     (select t.short_desc from tms_dept_code t where t.dept_code = dw.dept_code) short_desc,
     (select ad.p_email_address from a_dw_address_good ad where ad.id_number = e.id_number) p_email_address,
     (select ad2.p_phone_formatted from a_dw_address_good ad2 where ad2.id_number = e.id_number) p_phone_formatted
from entity  e,
        a_dw_degrees   dw
where dw.id_number(+) = e.id_number
and dw.grad_dt = 'XXXXXXXX';