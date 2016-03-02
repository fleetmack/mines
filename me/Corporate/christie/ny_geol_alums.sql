/*** Alums in NY with a Geology Degree ***/
select id_number, pref_mail_name, pref_name_sort, pref_class_year, p_city
from a_dw_address_good
where record_type_code = 'AL'
and p_state_code = 'NY'
and id_number In
(select id_number
from a_dw_degrees   d
where dept_code = 'GEOL')
order by p_city