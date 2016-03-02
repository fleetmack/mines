select * from a_dw_address_good 
where record_type_code = 'AL'
and record_status_code = 'A'
and pref_class_year < 1967
and id_number in
(select id_number from a_dw_pyramid
where year_of_giving > 1994
and total_cash > 100)




select * from a_dw_pyramid
where year_of_giving > 1994

and id_number in
(select  id_number from a_dw_address_good 
where record_type_code = 'AL'
and record_status_code = 'A'
and pref_class_year < 1967)







select * from a_dw_address_good
where record_type_code = 'AL'
and record_status_code = 'A'
and pref_class_year < 1967
and p_country_code <> ' '
and id_number in
(select id_number from a_dw_pyramid
where year_of_giving > 1994)


