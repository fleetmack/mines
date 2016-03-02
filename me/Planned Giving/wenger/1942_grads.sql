/*** run in powerbuilder -- add degrees and address sub reports ***/
select id_number, pref_mail_name, pref_name_sort
from entity
where record_type_code = 'AL'
and pref_class_year = '1942'