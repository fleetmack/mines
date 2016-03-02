select id_number, pref_name_sort
from a_dw_jobs 
where employer_id_number in '0000019431'
and record_status_code = 'A'
and flag_faculty_staff = 1
and employ_relat_desc like '%Primary%'
and id_number in (select distinct id_number from a_dw_gift_cfy
where year_of_giving = 2002)

