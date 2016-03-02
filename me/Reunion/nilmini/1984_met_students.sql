/*** All 1984 Grad Student Graduates with address info***/
select id_number, pref_mail_name, pref_name_sort, p_cityline, p_foreign_cityzip
from a_dw_address_good     
where id_number in
    (select id_number
      from a_dw_degrees
where degree_type = 'U'
and degree_year = '1984'
and dept_code = 'MET'
and institution_code = '1')

