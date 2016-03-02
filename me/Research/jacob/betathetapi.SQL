select e.id_number, e.pref_name_sort 
from entity     e,
     activity   a
where a.activity_code = 'FSBTP'
  and e.record_type_code = 'AL'
  and e.id_number = a.id_number


  
