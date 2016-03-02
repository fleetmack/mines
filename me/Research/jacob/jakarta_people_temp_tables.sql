/*** people who live in Jakarta, Indonesia ***/
create table temp_jacob as 
select id_number, pref_mail_name, pref_name_sort
from a_dw_address_good    
where p_country_code = 'IO'
and lower(p_foreign_cityzip) like '%jakarta%';
commit;
/


/***
drop table temp_jacob;
commit;
/

