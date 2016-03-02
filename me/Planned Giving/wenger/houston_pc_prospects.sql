/*** make this into pb report for wenger after lunch - add address, 5 year history, degrees ***/
select id_number, pref_mail_name, pref_name_sort, pref_class_year
from a_dw_pc_pros
where p_zipcode between '77000' and '77599'
and (flag_100_pfy = 1
or flag_100_cfy_minus_2 = 1
or flag_100_cfy_minus_3 = 1)
and flag_pm = 0
and pref_class_year <= 1964