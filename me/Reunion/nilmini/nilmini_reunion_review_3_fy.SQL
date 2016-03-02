select distinct id_number
--sum(associated_amount)
from a_dw_pyramid
where record_type_code = 'AL'
and pref_class_year IN ('1942',
                        '1947',
                        '1952',
                        '1957',
                        '1962',
                        '1967',
                        '1972',
                        '1977',
                        '1982',
                        '1987',
                        '1992')
and year_of_giving = '2001'
--and alloc = 3795
and cfae_purp_code IN ('EF','EU','EA','ED','EE','EL','EO','ER');




