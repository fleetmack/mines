/*** Senior Design Givers Last 2 years ***/
select id_number, record_type_code, pref_mail_name, pref_name_sort, sum(total_jnt_cash)
from a_dw_pyramid
where year_of_giving IN ('2010','2011')
and alloc IN
('704',
'4980',
'4344',
'4345',
'2340',
'4430',
'B1490')
group by id_number, record_type_code, pref_mail_name, pref_name_sort;