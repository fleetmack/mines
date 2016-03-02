/*** Gugg05 Members ***/
/*** Sorted by p_zipcode ***/
select g.id_number, g.pref_mail_name, g.pref_name_sort, g.pref_class_year, g.record_type_code 
from a_dw_gift_clubs        g,
     a_dw_address_good      a
where a.id_number(+) = g.id_number
  and g.gugg05 = '1'
order by a.p_zipcode
