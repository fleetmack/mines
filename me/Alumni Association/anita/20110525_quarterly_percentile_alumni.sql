/*** Use this to get quarterly-percentiles ***/
select pref_class_year, count(id_number)
from entity
where record_status_code = 'A'
and record_type_code = 'AL'
group by pref_class_year
order by pref_class_year