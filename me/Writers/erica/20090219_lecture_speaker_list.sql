/*** Various Lecture series Speakers -- this is advance report Activity - a_lecturers ***/
select e.id_number, e.pref_mail_name, e.pref_name_sort, a.awd_honor_code, substr(a.awd_honor_dt,1,4) year_spoke, t.short_desc
from entity   e,
        awards_and_honors  a,
        tms_awd_honor       t
where e.id_number = a.id_number
   and t.awd_honor_code = a.awd_honor_code
   and t.award_honor_group_code = 'SPEAK'
order by a.awd_honor_code, e.pref_name_sort;