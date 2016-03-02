select * from a_dw_address_good
where p_flag_foreign = 1
and record_type_code = 'AL'
and record_status_code = 'A'
and id_number in
(select unique id_number from a_dw_pyramid
where date_of_record > '19980701')

