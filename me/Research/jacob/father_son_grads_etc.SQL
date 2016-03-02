
select * from a_dw_relationship
where relation_type_code IN ('4E','5E','6E','7E')
and id_number in
    (select id_number 
       from entity
      where record_type_code = 'AL'
        and record_status_code = 'D')
and relation_id_number in
    (select id_number 
         from a_dw_address_good
      where record_type_code = 'AL')

