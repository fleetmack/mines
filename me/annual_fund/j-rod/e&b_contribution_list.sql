/*** Econ and Business donors since August 2003 for Kathleen Feighny through Julie ***/

select distinct id_number, pref_mail_name, pref_name_sort, record_status_code, record_type_code, pref_class_year, sum(associated_amount + associated_amount_match + associated_amount_claim)
from a_dw_pyramid
where date_of_record >= '20030801'
and alloc in
    (select allocation_code
    from allocation
    where alloc_dept_code = 'ME')
group by id_number, pref_mail_name, pref_name_sort, record_status_code, record_type_code, pref_class_year