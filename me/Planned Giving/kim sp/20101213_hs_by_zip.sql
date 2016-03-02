select *
from a_dw_gift_clubs
where heritage_society = '1'
and id_number IN
    (select id_number from a_dw_address_good where p_zipcode BETWEEN '80800-0000' AND '80999-9999');

select *
from a_dw_gift_clubs
where heritage_society = '1'
and id_number IN
    (select id_number from a_dw_address_good where p_zipcode BETWEEN '80500-0000' AND '80699-9999');

/***
select *
from a_dw_address_good
where id_number IN
('0000004193',
'0000006503',
'0000010567',
'0000051007');
***/