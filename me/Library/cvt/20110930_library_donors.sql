/***  CVT Librry Donors between dates you see -- PB report for this ***/
select distinct py.id_number,
py.pref_mail_name,
py.pref_name_sort,
py.pref_class_year,
py.record_type_code
from a_dw_pyramid py
where flag_alumni <> '1'
  and flag_non_monthend <> '1'
  and date_of_record BETWEEN '20110401' AND '20110930'
  and alloc IN
('1530','778','4718', '2013','4013','4310','522','525' ,'1552','4552','1390','4752','1662', '782','503','1832','4832','4662','4178','1647','898', '1489','4175','722','4464','B5602', 'B4736','B4731')