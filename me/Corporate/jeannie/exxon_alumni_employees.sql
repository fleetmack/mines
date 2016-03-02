/*** Exxon-Mobil Alumni Employees ***/
SELECT e.id_number, e.pref_mail_name, e.pref_name_sort, e.pref_class_year
FROM employment em,
     entity     e
WHERE em.id_number          = e.id_number
  AND e.record_type_code    = 'AL'
  AND em.employer_id_number IN ('0000025665',
                             '0000029631',
                             '0000034526',
                             '0000024589',
                             '0000032268',
                             '0000018323')
  AND em.job_status_code = 'C'
  AND em.employ_relat_code IN ('PE','CE');