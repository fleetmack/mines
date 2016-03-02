/*** St. Louis Folks ***/
select dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year, dw.record_type_code, dw.p_email_address, dw.p_city, dw.p_state_code, dw.p_zipcode, dw.p_phone_formatted, pm.ass_pref_mail_name, pm.ass_pref_name_sort
from a_dw_address_good  dw,
     a_dw_assignment_pm pm
where pm.id_number(+) = dw.id_number
and dw.person_or_org = 'P'
and dw.p_zipcode BETWEEN '63000-0000' AND '63399-9999'
and dw.record_type_code <> 'SF'
and dw.id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNM','DNI'))
order by dw.pref_name_sort    