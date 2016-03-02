/***65-72 only PE undergrad degrees - domestic***/
select distinct id_number 
from a_dw_degrees 
where degree_code = '4'
and institution_code = '1'
and id_number in
(select id_number 
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year between 1965 and 1972
and p_flag_foreign = 0);



/***65-72 only PE undergrad degrees - foreign without email address***/
select distinct id_number 
from a_dw_degrees 
where degree_code = '4'
and institution_code = '1'
and id_number in
(select id_number 
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year between 1965 and 1972
and p_email_address = ' '
and p_flag_foreign = 1);



/***65-72 only PE undergrad degrees - foreign with email address***/
select distinct id_number  
from a_dw_degrees 
where degree_code = '4'
and institution_code = '1'
and id_number in
(select id_number 
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year between 1965 and 1972
and p_email_address > ' '
and p_flag_foreign = 1);



/***80-present all PE degrees (grad and undergrad) - domestic***/
select distinct id_number 
from a_dw_degrees 
where degree_code in ('41','416','13','36','23','4','86')
and institution_code = '1'
and id_number in
(select id_number
from a_dw_address_good
where record_type_code = 'AL'
and record_status_code = 'A'
and (pref_class_year between 1982 and 2003)
and p_flag_foreign = 0);




/***80-present all PE degrees (grad and undergrad) - foreign with email addresses ***/
select distinct id_number 
from a_dw_degrees 
where degree_code in ('41','416','13','36','23','4','86')
and institution_code = '1'
and id_number in
(select id_number
from a_dw_address_good
where record_type_code = 'AL'
and record_status_code = 'A'
and (pref_class_year between 1982 and 2003)
and p_flag_foreign = 1
and p_email_address > ' ');




/***80-present all PE degrees (grad and undergrad) - foreign without email addresses ***/
select distinct id_number 
from a_dw_degrees 
where degree_code in ('41','416','13','36','23','4','86')
and institution_code = '1'
and id_number in
(select id_number
from a_dw_address_good
where record_type_code = 'AL'
and record_status_code = 'A'
and (pref_class_year between 1982 and 2003)
and p_flag_foreign = 1
and p_email_address = ' ');








