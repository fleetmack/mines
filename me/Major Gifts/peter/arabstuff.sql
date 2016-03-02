/***All people who have AN (not necessarily primary) address in Oman, Awtar, UAE, Saudi Arabia, Yeman, or Kuwait***/
select  distinct id_number
from address 
where country_code 
in ('QA','SB','KU','OM','UA','YE')



/***shows all people who have an address in those countries as well as in the US***/
select distinct id_number
from address 
where country_code 
in ('QA','SB','KU','OM','UA','YE')
and id_number 
    in (select id_number 
        from address
        where country_code = ' ')



/***shows all people who have an address in those countries and DO NOT HAVE AN ADDRESS in the US***/
select distinct id_number
from address 
where country_code 
in ('QA','SB','KU','OM','UA','YE')
and id_number 
    not in (select id_number 
        from address
        where country_code = ' ')









