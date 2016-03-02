select *
from a_dw_jobs  j,
matching_policy    m
where j.record_status_code = 'A'
and j.record_type_code = 'AL'
and m.id_number = j.employer_id_number
and j.employ_relat_code = 'PE' 
and j.employer_id_number in
    (select id_number 
     from matching_policy 
     where hep_ratio 
     in ('2','3'))
and j.id_number in
    (select unique id_number
     from a_dw_pyramid
     where date_of_record between '20010701' and '20020630')
order by pref_name_sort




