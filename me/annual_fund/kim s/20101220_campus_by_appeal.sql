/*** Campus Appeals By FY ***/
select *
--dw.appeal_code, ah.description, '$'||sum(associated_amount)
from a_dw_pyramid  dw,
       appeal_header  ah
where dw.appeal_code = ah.appeal_code
and dw.year_of_giving = '2010'
and dw.id_number in
    (select id_number
        from a_dw_jobs
     where employer_id_number IN ('0000020910','0000019431','0000017894','0000034805','0000042725','0000018591')
         and job_status_code = 'C'
         and employ_relat_code <> 'PE')
and dw.flag_alumni <> '1'
and dw.flag_non_monthend <> '1'
and dw.associated_code <> 'B'
and dw.appeal_code = 'PV10'
--group by dw.appeal_code, ah.description
order by dw.appeal_code