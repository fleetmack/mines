select a.id_number, a.pref_mail_name, a.pref_name_sort, a.pref_class_year
from a_dw_address_good     a,
              a_dw_jobs             j
where a.id_number   = j.id_number
and a.record_type_code = 'AL'
and a.pref_class_year in ('1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980',
                               '1981','1982','1983','1984','1985','1986','1987','1988','1989')
and a.p_zipcode between '80000-0000' and '80499-9999'
and j.job_status_code = 'C'
and j.job_title > ' '
and (lower(j.job_title) like '%manager%'
     or lower(j.job_title) like '%vp%'
     or lower(j.job_title) like '%president%'
     or lower(j.job_title) like '%ceo%'
     or lower(j.job_title) like '%cfo%'
     or lower(j.job_title) like '%director%'
     or lower(j.job_title) like '%trustee%'
     or lower(j.job_title) like '%owner%')
and a.id_number in
    (select id_number
       from a_dw_pyramid
      where date_of_record >= '20000701'
        and flag_alumni <> '1'
        and associated_amount + associated_amount_match + associated_amount_claim >= 250)