select e.id_number, e.pref_mail_name, e.pref_name_sort, d.dp_rating_code
  from demographic_profile  d,
       entity               e
where e.id_number = d.id_number
and e.record_status_code = 'D' 
and dp_rating_code IN ('P','S')
order by d.dp_rating_code

