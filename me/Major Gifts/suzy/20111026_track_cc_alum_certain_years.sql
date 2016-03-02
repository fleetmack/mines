/*** T&F and CC alumni with a date range ***/
select id_number
from entity
where record_status_code = 'A'
and record_type_code = 'AL'
and pref_class_year BETWEEN '1948' and '1985'
and id_number IN
    (select id_number
       from sport
      where sport_code IN ('CC','TF'))
     