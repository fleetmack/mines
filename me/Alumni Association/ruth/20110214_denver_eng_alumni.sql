/*** Denver area engineering alumni ***/
select e.id_number, e.pref_mail_name, e.pref_name_sort, e.first_name, e.last_name, dw.salutation, dw.p_email_address
from a_dw_address_good    dw,
        entity e
where e.id_number = dw.id_number
and dw.p_email_address > ' '
and dw.record_type_code = 'AL'
and dw.id_number IN
    (select id_number from a_dw_degrees
       where institution_code = '1' and degree_code <> '401' and dept_code = 'ENG')
and dw.id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI')
and dw.p_zipcode BETWEEN '80000-0000' AND '80505-9999';