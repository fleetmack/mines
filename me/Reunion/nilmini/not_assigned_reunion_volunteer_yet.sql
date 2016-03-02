/*** Class of 1950 -- people not assigned to a reunion volunteer ***/
select id_number, pref_mail_name, pref_name_sort, p_cityline, p_foreign_cityzip
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year = '1950'
and id_number  IN
    (select id_number
       from committee
      where committee_code = 'RGP'
        and committee_status_code = 'A') 
and id_number NOT IN
(select id_number from a_dw_assignment
where pref_class_year = '1950' 
and ass_id_number in
    (select id_number
       from committee
       where committee_code = 'RGP'
       and committee_status_code = 'A'))