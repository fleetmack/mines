/*** Dead HS members ***/
select  e.id_number, e.pref_mail_name, e.pref_name_sort, 
substr(death_dt,5,2)||'-'||substr(death_dt,7,2)||'-'||substr(death_dt,1,4),
 spouse_name
from entity     e,
       a_dw_gift_clubs      dw
where dw.heritage_society = '1'
   and dw.id_number = e.id_number
   and dw.record_status_code = 'D'  