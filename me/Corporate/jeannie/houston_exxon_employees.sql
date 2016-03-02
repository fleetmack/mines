/*** Houston Exxon Employees ***/
select * 
from a_dw_address_good
where p_zipcode between '77000-0000' and '77599-9999'
  and id_number in
    (select id_number
       from a_dw_jobs
      where employer_id_number in ('0000025665',
'0000029633',
'0000029631',
'0000034526',
'0000024589',
'0000029691',
'0000025663',
'0000032146',
'0000032268',
'0000018323')
        and record_status_code = 'A'
        and job_status_code IN ('R','C'))
      