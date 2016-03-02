/**** 1960 Grads, alive or dead, with city and degree (degree on powerbuilder) ***/

select e.id_number,
       e.pref_mail_name,
       e.pref_name_sort,
       a.p_cityline
from entity                 e,
     a_dw_address_good      a
where a.id_number(+) = e.id_number 
  and e.record_type_code = 'AL'
  and e.pref_class_year = '1960'
