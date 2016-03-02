/*** Current Houston Parents ***/
select *
from a_dw_address_good
where record_type_code = 'PA'
and p_zipcode BETWEEN '77000-0000' AND '77599-9999';  --note, these zips are wrong, waiting to hear back from Ruth

/*** Geology and Geophysics alumni in Houston ***/
select *
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode BETWEEN '77000-0000' AND '77599-9999'  --note, these zips are wrong, waiting to hear back from Ruth
and id_number in
    (select id_number
        from a_dw_degrees
      where dept_code IN ('GEOL','GEOP')
        and institution_code = '1');