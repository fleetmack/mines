/*** non aa members ***/
select count(id_number) from a_dw_address_good
where record_type_code = 'AL'
and record_status_code = 'A'
and id_number NOT IN
    (select id_number
       from a_dw_memb
      where memb_type_code IN ('H','L')
        or memb_year IN ('2003','2004'))
