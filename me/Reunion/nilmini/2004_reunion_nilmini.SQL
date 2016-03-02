select e.id_number, 
e.pref_mail_name, 
decode(e.record_status_code,'D','Deceased',
                             ' '), 
e.pref_class_year 
from entity     e
where e.record_type_code = 'AL'
and e.pref_class_year IN ('1944','1949','1954','1959','1964','1969','1974','1979','1984','1989','1994')
order by e.pref_class_year
