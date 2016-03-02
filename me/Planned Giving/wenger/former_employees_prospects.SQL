select * from a_dw_assignment
where ass_type in ('PP','PS')
and ass_id_number not in
    (select id_number from a_dw_jobs
      where employer_id_number = '0000034805'
        and job_status_code = 'C')
and lower(ass_pref_name_sort) not like '%kenney%'
and lower(ass_pref_name_sort) not like '%turner%'
