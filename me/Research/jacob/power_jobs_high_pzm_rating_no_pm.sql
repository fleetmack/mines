/*** Numbers for Jacob --- FY06 start... GG&A Proof ***/
/*** power jobs ... no assignment ... high pzm rating ***/
create table temp_jacob_20050727
as
(select distinct j.id_number 
from a_dw_jobs j
where j.job_status_code = 'C'
  -- and j.employ_relat_code = 'PE'
   and (lower(j.job_title) like '%manager%'
     or lower(j.job_title) like '%vp%'
     or lower(j.job_title) like '%president%'
     or lower(j.job_title) like '%ceo%'
     or lower(j.job_title) like '%cfo%'
     or lower(j.job_title) like '%director%'
     or lower(j.job_title) like '%trustee%'
     or lower(j.job_title) like '%owner%')
  and j.id_number in
    (select id_number
    from entity
    where record_type_code = 'AL'
    and record_status_code = 'A')
  and j.id_number in
    (select id_number
       from a_dw_pyramid
      where flag_alumni <> '1'
      and date_of_record >= '20020701')
  and j.id_number in
    (select id_number
       from demographic_profile
       where dp_rating_type_code = 'PZM'
        and dp_rating_code in ('Z01','Z02','Z06','Z07','Z13','Z14'))
 and j.id_number not in
  (select id_number
   from a_dw_assignment));
commit;
