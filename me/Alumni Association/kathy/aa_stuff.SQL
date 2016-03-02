select count(id_number) from a_dw_memb
where memb_year = '2003'
and p_flag_foreign = 0
and record_status_code = 'A'
and memb_type_code NOT IN ('L','H')
and id_number NOT IN
    (select id_number
       from a_dw_memb
      where memb_year = '2004');

select id_number from a_dw_memb
where memb_year = '2003'
and p_flag_foreign = 0
and record_status_code = 'A'
and memb_type_code NOT IN ('L','H')
and id_number NOT IN
    (select id_number
       from a_dw_memb
      where memb_year = '2004');














