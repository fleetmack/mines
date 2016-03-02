/*** Mines Fund donors in FY11 ***/
select distinct ag.id_number
from a_dw_address_good ag,
     a_dw_pyramid  py
where ag.id_number = py.id_number
and   py.person_or_org = 'P'
and   py.year_of_giving = '2011'
and   py.alloc = '3795'     