select id_number from a_dw_address_good
where record_type_code = 'AL'
and p_flag_foreign = 0
and id_number in
(select id_number from entity where gender_code = 'F')
