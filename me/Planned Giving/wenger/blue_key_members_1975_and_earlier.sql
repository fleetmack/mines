/*** Blue Key Honor Society members who graduated in 1975 and earlier***/
select distinct n.id_number, n.name_sort, n.pref_name
from activity   a,
     name       n
where n.id_number = a.id_number
and a.activity_code = 'BK'
and n.name_type_code = '00'
and a.id_number in
    (select id_number
       from a_dw_degrees
      where degree_year <= '1975')