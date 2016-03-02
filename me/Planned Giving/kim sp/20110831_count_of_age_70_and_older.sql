/*** Alumni over age 70 -- use class year of 1963 ***/
select id_number, pref_mail_name, pref_name_sort, record_type_code, pref_class_year, birth_dt
from entity
where record_type_code = 'AL'
and record_status_code = 'A'
and pref_class_year <= '1963'
UNION
/*** Add in all others (not just alumni) where they are over 70 years old ***/
select id_number, pref_mail_name, pref_name_sort, record_type_code, pref_class_year, birth_dt
from entity
where record_status_code = 'A'
and birth_dt <= '19410831'
and birth_dt <> '00000000'
and substr(birth_dt,1,4) <> '0000';