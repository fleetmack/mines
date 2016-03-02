/*** PG Per Pref Class Year ***/
select DECODE(pref_class_year,' ','Non-Alum or Non-Widow',pref_class_year) class_year, count(distinct(id_number)) total_donors, count(*) total_gifts
from a_dw_pg
group by DECODE(pref_class_year,' ','Non-Alum or Non-Widow',pref_class_year)
order by class_year;