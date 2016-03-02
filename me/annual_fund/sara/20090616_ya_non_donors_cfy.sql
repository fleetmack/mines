select id_number
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year between '1999' and '2008'
and p_email_address > ' '
and flag_dns <> '1'
and flag_omit_from_mail <> '1'
and id_number NOT IN
    (select id_number
        from a_dw_pyramid
      where year_of_giving = '2009'
          and flag_alumni <> '1');