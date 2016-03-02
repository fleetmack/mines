/*** Employer with alumni working there ***/
select e1.employer_id_number, 
ee.pref_name_sort, 
a.p_street1, 
a.p_street2, 
a.p_street3, 
a.p_foreign_cityzip, 
a.p_city, 
a.p_state_code, 
a.p_zipcode, 
a.p_country_code, 
a.p_phone_area_code, 
a.p_phone_number, 
a.p_email_address,
count(e1.id_number)
from employment  e1,   
entity  ee, 
a_dw_address_good a
where e1.employer_id_number = ee.id_number
and a.id_number(+) = ee.id_number
and a.flag_dns <> '1'
and e1.id_number IN
    (select ert.id_number from entity_record_type ert where ert.record_type_code = 'AL')
and ee.record_type_code = 'CP'
and e1.job_status_code = 'C'
and e1.employ_relat_code = 'PE'
group by e1.employer_id_number, 
ee.pref_name_sort, 
a.p_street1, 
a.p_street2, 
a.p_street3, 
a.p_foreign_cityzip, 
a.p_city, 
a.p_state_code, 
a.p_zipcode, 
a.p_country_code, 
a.p_phone_area_code, 
a.p_phone_number,
a.p_email_address
order by count(e1.id_number) desc