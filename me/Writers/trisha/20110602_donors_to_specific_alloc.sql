/*** Distinct Donors to allocation 537 in last 5 years ***/
select distinct py.id_number
from a_dw_pyramid  py,
     a_dw_address_good  ad
where ad.id_number(+) = py.id_number
and ad.record_status_code = 'A'
and py.alloc = '537'
and py.year_of_giving >= '2007';

/*** Distinct Donors to allocation 537 ever ***/
select distinct py.id_number
from a_dw_pyramid  py,
     a_dw_address_good  ad
where ad.id_number(+) = py.id_number
and ad.record_status_code = 'A'
and py.alloc = '537';