select p_email_address
from a_dw_address_good
where id_number IN
(
select distinct assigned_id_number
--id_number, activity_code, to_char((to_date(stop_dt,'YYYYMMDD')),'YYYYMMDD')
from activity
where stop_dt <> '00000000'
and substr(stop_dt,5,2)  BETWEEN '01' and '12'
and substr(stop_dt,7,2) BETWEEN '01' and '31'
and to_char(sysdate,'YYYYMMDD') = to_char((to_date(stop_dt,'YYYYMMDD')),'YYYYMMDD')
)












where to_char(sysdate+6,'YYYYMMDD') = to_char(to_date(stop_dt,'YYYYMMDD') + 6,'YYYYMMDD')

select *
from activity
where activity_code = 'BRY';


select to_char(sysdate+6,'YYYYMMDD')
from dual
where activity_code = 'BRY';