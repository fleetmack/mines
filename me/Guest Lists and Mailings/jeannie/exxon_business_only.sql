select a.id_number,
       a.pref_mail_name,
       a.pref_name_sort,
       a.record_type_code,
       a.pref_class_year
from a_dw_address_good      a,
     employment             e
where a.id_number           = e.id_number
  and a.record_type_code = 'AL'
  and e.employer_id_number IN ('0000025665',
                               '0000029631',
                               '0000034526',
                               '0000024589',
                               '0000032268')
  and e.job_status_code IN ('R','C');