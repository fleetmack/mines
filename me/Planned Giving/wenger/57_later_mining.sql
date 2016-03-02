select count(id_number)
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year <= '1957'
and p_zipcode between '80000-0000' and '80499-9999'
and id_number in
    (select id_number
    from degrees
    where dept_code = 'MIN')