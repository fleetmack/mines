/*** Specific current committee members ***/
select id_number, pref_mail_name, pref_name_sort, record_type_code, pref_class_year
from entity
where id_number IN
(select id_number
from committee
where committee_code IN
('GEC',
 'FPMBD',
 'FBOGD',
 'FBOGI',
 'FBOGA',
 'FBOGN',
 'AAPP',
 'AASC',
 'AABOD',
 'RGP',
 'PA',
 'SGC',
 'YAC',
 'HGTC')
 and committee_status_code = 'A')
 order by pref_name_sort