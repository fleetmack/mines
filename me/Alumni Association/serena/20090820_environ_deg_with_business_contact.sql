/*** Environmental Degrees (B, M, and D) with business contact info ***/
select id_number, pref_mail_name, pref_name_sort, pref_class_year, b_company_name_1, b_business_title, b_street1, b_street2, b_street3, b_city, b_state_code, b_zipcode, b_phone_formatted, b_email_address
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
(select id_number
from a_dw_degrees 
where institution_code = '1'
and degree_code IN
('88',
'71',
'1007'));