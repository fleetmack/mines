/*** Class of 1979 Mailling for Fall 25th Reunion ***/

select id_number
from a_dw_address_good
where flag_omit_from_mail <> '1'
and flag_dns <> '1'
and record_type_code = 'AL'
and pref_class_year = '1979'
and id_number not in
    (select id_number
      from a_dw_pyramid
     where date_of_record > '20040101'
     and flag_alumni <> '1')