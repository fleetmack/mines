select id_number, pref_name_sort, associated_amount from a_dw_pledge_os where year_of_giving = 2002 
and date_of_record > 20020223 and associated_amount > 24999


select * from a_dw_gift_cfy where date_of_record > 20020223 and associated_amount > 24999



select  id_number, pref_name_sort, associated_amount from a_dw_gift_cfy where date_of_record > 20020223 and associated_amount > 24999
