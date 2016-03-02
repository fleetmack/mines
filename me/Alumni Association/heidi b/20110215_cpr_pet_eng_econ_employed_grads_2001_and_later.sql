/*** Currently Employed Petroleum/Chem Eng/Enginereing/Econ grads who got their degree in 2001 or later ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
    (select id_number
        from a_dw_degrees
       where dept_code IN ('PET','CPR','ENG','ECON')
         and degree_code <> '401'
         and institution_code = '1'
          and substr(grad_dt,1,4) >= '2001')
and id_number IN
    (select id_number
        from a_dw_jobs
      where employ_relat_code = 'PE'
       and job_status_code = 'C')