select  id_number, 
        pref_name_sort,
        max(total_cash),
        pref_class_year       
from a_dw_pyramid
where record_type_code = 'AL'
and record_status_code = 'A' 
and date_of_record between '19970701' and '20020528'
having sum(total_cash) > 100
and id_number in    
            (select id_number   
               from a_dw_address_good
              where p_zipcode between '80000-0000' and '80506-9999')
and id_number not in
            (select id_number
               from assignment)
group by id_number, pref_name_sort, record_type_code, pref_class_year









