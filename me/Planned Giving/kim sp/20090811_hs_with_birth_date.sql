/*** HS Members and their birthdays ***/
select id_number, pref_mail_name, pref_name_sort, decode(birth_dt,'00000000',' ',birth_dt) birth_date,
         decode(birth_dt,'00000000',' ',substr(birth_dt,1,4)) birth_year,
         decode(birth_dt,'00000000',' ',substr(birth_dt,5,2)) birth_month,
         decode(birth_dt,'00000000',' ',substr(birth_dt,7,2)) birth_day
from entity
where record_status_code = 'A'
and id_number in
    (select id_number
       from a_dw_gift_clubs
     where heritage_society = '1')
order by pref_name_sort