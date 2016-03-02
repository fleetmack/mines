/*** Geology people for specific years by class year ***/
create table temp_miriam
as
(select d.id_number, n.pref_name, n.name_sort, a.p_cityline
from a_dw_degrees				d,
     name						n,
     a_dw_address_good          a
where n.id_number		= d.id_number
and a.id_number         = d.id_number
and n.name_type_code = '00'
and d.degree_year IN ('1966', '1967','1968')
and d.institution_code = '1'
and d.dept_code = 'GEOL'
and a.flag_dns = '0'
and a.flag_omit_from_mail = '0');
     

/*** Bring this to powerbuilder - add degree, 5 yr gvg sum, lifetime gvg sum sub reports 
select distinct id_number, pref_name, name_sort, p_cityline
from temp_miriam;

/*** Drop Table     
drop table temp_miriam;
commit;
/
