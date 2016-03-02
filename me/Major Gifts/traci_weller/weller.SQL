SELECT      DISTINCT pref_name_sort 
FROM a_dw_pyramid
WHERE alloc IN
    (SELECT allocation_code 
     FROM allocation
     WHERE LOWER(alloc_dept_code) LIKE 'pe')
AND year_of_giving > 1996
AND associated_amount > 250
AND id_number IN
    (SELECT id_number 
     FROM a_dw_address_good WHERE p_zipcode BETWEEN '77000' AND '77599')





