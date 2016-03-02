/*** 1958 Alums & Deceased Alums ***/
select count(id_number) as "total_alums_1958"
from entity
where record_type_code = 'AL'
and pref_class_year = '1958';

select count(id_number) "as total_deceased_alums_1958"
from entity
where record_type_code = 'AL'
and pref_class_year = '1958'
and record_status_code = 'D';