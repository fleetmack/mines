/*** John Wanner Memorial Gifts ***/
select distinct(id_number)
from a_dw_pyramid
where receipt IN
(select gift_receipt_number
from gift
where gift_receipt_number IN
    (select receipt from a_dw_pyramid where flag_memorial = 1)
and gift_donor_id = '0000003335')
and id_number NOT IN
('0000043266',
'0000009136',
'0000032118',
'0000040980',
'0000047705',
'0000027855',
'0000014654',
'0000039823',
'0000013805',
'0000011470',
'0000041776',
'0000047723',
'0000047706',
'0000034649',
'0000037488',
'0000037524',
'0000043280',
'0000037538',
'0000012890',
'0000012568');

/*** Identify Marquez Hall Allocations 
select *
from allocation
where lower(short_name) like '%marquez%';
--6-3-5378
select *
from allocation
where lower(short_name) like '%petroleum engineering building%';
--6-3-5478

/*** Donors to one of the above allocations ***/
SELECT distinct(id_number)
from a_dw_pyramid
where alloc IN ('5378','5478')
and associated_code = 'P'
and id_number NOT IN
('0000043266',
'0000009136',
'0000032118',
'0000040980',
'0000047705',
'0000027855',
'0000014654',
'0000039823',
'0000013805',
'0000011470',
'0000041776',
'0000047723',
'0000047706',
'0000034649',
'0000037488',
'0000037524',
'0000043280',
'0000037538',
'0000012890',
'0000012568');

/*** Specific Corporate People ***/
select id_number
from entity
where id_number IN
('0000043266',
'0000009136',
'0000032118',
'0000040980',
'0000047705',
'0000027855',
'0000014654',
'0000039823',
'0000013805',
'0000011470',
'0000041776',
'0000047723',
'0000047706',
'0000034649',
'0000037488',
'0000037524',
'0000043280',
'0000037538',
'0000012890',
'0000012568');