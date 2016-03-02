select distinct id_number
--count(id_number),
--sum(total_jnt_commitment)
--sum(associated_amount + associated_amount_match + associated_amount_claim)
from a_dw_pyramid
where date_of_record between '20050101' and '20051231'
and alloc in ('1530',
'778',
'9936',
'2013',
'4013',
'1552',
'4552',
'4310',
'4011',
'522',
'525',
'1390',
'1662',
'782',
'503',
'1832',
'4832',
'4662',
'4178',
'1647',
'898',
'722',
'4718',
'1489',
'4175',
'4464',
'0751',
'4752')
--and record_type_code  not in ('CP','CF','FO')
--and id_number in
--(select id_number from a_dw_address_good)
--group by id_number



