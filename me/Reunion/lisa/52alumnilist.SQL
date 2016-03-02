select  * 
from entity         e,   
degrees             d
where e.id_number = d.id_number
  and e.pref_class_year like '1952'
  and e.record_status_code = 'A'
  and d.institution_code = '1'
  and e.record_type_code like '%AL%'

