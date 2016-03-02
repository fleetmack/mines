select id_number, pref_mail_name, pref_name_sort, p_city, p_state_code, p_zipcode, p_foreign_cityzip
from a_dw_address_good
where pref_class_year = '1949'
and record_type_code = 'AL'
and id_number not in
    (select id_number
    from a_dw_assignment
   where ass_id_number in
        (select id_number from committee
            where committee_code = 'RGP'
            and committee_status_code = 'A'))
