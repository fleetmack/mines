/*** Numbers for Jacob --- FY06 start... GG&A Proof ***/
select count(id_number)
from a_dw_jobs j
where (lower(j.job_title) like '%manager%'
     or lower(j.job_title) like '%vp%'
     or lower(j.job_title) like '%president%'
     or lower(j.job_title) like '%ceo%'
     or lower(j.job_title) like '%cfo%'
     or lower(j.job_title) like '%director%'
     or lower(j.job_title) like '%trustee%'
     or lower(j.job_title) like '%owner%')
  and id_number in
    (select id_number
    from entity
    where record_type_code = 'AL'
    and record_status_code = 'A')
  and id_number in
    (select id_number
       from a_dw_pyramid
      where flag_alumni <> '1')
  and id_number in
    (select id_number
       from demographic_profile
       where dp_rating_type_code = 'PZM'
and dp_rating_code in ('Z01','Z02','Z06','Z07','Z13','Z14'))