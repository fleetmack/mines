/*** Take the first part of this, then paste it into excel
/*** Then past the second part of this next to it in excel
/*** Then in excel do simple division

/*** count of distinct donors in FY11 with a class year ending in 1 or 6 ***/
select e.pref_class_year, count(distinct(dw.id_number)) donors
from appeals   a, 
     entity  e,
     a_dw_pyramid  dw
where a.id_number = e.id_number
and   e.id_number = dw.id_number
and to_char(a.date_scheduled,'YYYYMMDD') between '20100701' and '20110630'
and e.record_type_code = 'AL'
and substr(e.pref_class_year,4,1) IN ('1','6')
and dw.year_of_giving = '2011'
and dw.flag_alumni <> '1'
and dw.flag_non_monthend <> '1'
group by e.pref_class_year;

/*** Count of how many people we solicited per class year in 2011 ***/
(select e.pref_class_year, count(distinct(a.id_number)) solicited
from appeals   a, 
     entity  e
where a.id_number = e.id_number
and to_char(a.date_scheduled,'YYYYMMDD') between '20100701' and '20110630'
and e.record_type_code = 'AL'
and substr(e.pref_class_year,4,1) IN ('1','6')
group by e.pref_class_year)