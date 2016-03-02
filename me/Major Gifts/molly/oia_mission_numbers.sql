select count(id_number) as total_alum
from entity
where record_type_code = 'AL';

select count(id_number) as total_living_alum
from entity
where record_type_code = 'AL'
and record_status_code = 'A';

select count(id_number) as alum_with_good_addresses
from a_dw_address_good
where record_type_code = 'AL';

select count(distinct(id_number)) as undergrad_degree_alums
from a_dw_degrees
where degree_type = 'U';

select count(distinct(id_number)) as grad_degree_alums
from a_dw_degrees
where degree_type = 'G';