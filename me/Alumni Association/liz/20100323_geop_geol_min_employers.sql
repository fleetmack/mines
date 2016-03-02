select distinct a.id_number, a.pref_mail_name, a.pref_name_sort,
                 a.p_street1,a.p_street2,a.p_street3,a.p_city, a.p_state_code,a.p_zipcode, c.contact_id_number,
                 a2.pref_mail_name, a2.p_email_address,a2.p_phone_formatted, c.contact_name, c.title, c.Phone_area_code||'.'||c.phone_exchange||'.'||c.phone_number
from a_dw_address_good a,
        a_dw_jobs               j,
        a_dw_degrees            d,
        contact   c,
        a_dW_address_good a2
where a.id_number = j.employer_id_number
    and j.id_number = d.id_number
    and c.id_number(+) = a.id_number
    and a2.id_number(+) = c.contact_id_number
    and a.record_type_code = 'CP'
    and a.p_state_code = 'CO'
    and j.record_type_code = 'AL'
    and j.record_status_code = 'A'
    and j.employ_relat_code = 'PE'
    and c.contact_code (+)= 'CC'
    and j.job_status_code = 'C'
    and d.institution_code = '1'
    and d.dept_code IN ('GEOL','GEOP','MIN')
order by a.pref_name_sort