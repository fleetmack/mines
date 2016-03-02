select * from a_dw_address_good
where record_status_code = 'A'
and record_type_code = 'AL'
and p_zipcode between '77000-0000' and '77599-9999'
and flag_omit_from_mail = 0
and person_or_org = 'P'