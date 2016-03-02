/*** Random YA stats for Sara ***/
select count(*) as total_ya
from entity
where record_type_code = 'AL'
and pref_class_year >= '2000';

select count(*) as total_ya_with_good_addresses
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000';

select  distinct(p_state_desc)
--count(distinct(p_state_code)) as different_ya_states
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_country_code = ' '
order by p_state_desc;

select count(distinct(p_country_code))+1 as different_ya_countries
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000';


/*** ALL BELOW ARE JUST IN COLORADO ***/
/*** Random YA stats for Sara ***/
select count(*) as total_ya
from entity
where record_type_code = 'AL'
and pref_class_year >= '2000'
and id_number IN
    (SELECT id_number
         FROM a_dw_address_good
      WHERE p_state_code = 'CO');

select count(*) as total_ya_with_good_addresses
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and id_number IN
    (SELECT id_number
         FROM a_dw_address_good
      WHERE p_state_code = 'CO');

select  distinct(p_state_desc)
--count(distinct(p_state_code)) as different_ya_states
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_country_code = ' '
order by p_state_desc;

select count(distinct(p_country_code))+1 as different_ya_countries
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000';

select count(*) 
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_flag_foreign = '1';