/*** Class of 1955 ... if they were ever PC.... add lifetime giving ***/
select id_number, pref_mail_name, pref_name_sort, pref_class_year
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year = '1955'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where total_years_pc > 0)
