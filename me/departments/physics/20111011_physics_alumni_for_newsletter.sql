/*** Physics grads for newsletter (req. by Summer Jackson) ***/
select distinct ag.id_number
from a_dw_address_good ag,
     a_dw_degrees  dg
where ag.id_number = dg.id_number
  and dg.dept_code = 'PHY'
  and dg.degree_code <> '401'
  and ag.record_type_code = 'AL'
  and dg.institution_code = '1'
  and dg.id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNM');


/*** Physics Grad - All - NOT FOR MAILING ***/
/*** This is a PB report - temp_physics_all_20111018 ***/
select distinct e.id_number,
       e.pref_mail_name,
       e.pref_name_sort,
       e.pref_class_year
  from entity e,
       a_dw_degrees dg
 where e.id_number = dg.id_number
   and dg.dept_code = 'PHY'
   and e.record_status_code = 'A'
   and dg.degree_code <> '401'
   and e.record_type_code = 'AL'
   and dg.institution_code = '1';