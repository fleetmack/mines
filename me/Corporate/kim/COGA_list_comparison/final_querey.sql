select distinct e.id_number, e.pref_mail_name, e.pref_name_sort, a.p_street1, a.p_street2, a.p_cityline, a.p_email_address
from entity         e,
     temp_kim_numbers    t,
     a_dw_address_good  a
where a.id_number(+) = e.id_number
and lower(e.first_name) = lower(t.first_name)
and lower(e.last_name) like lower(t.last_name)
and e.record_type_code = 'AL'
and e.record_status_code = 'A'
order by e.pref_name_sort






