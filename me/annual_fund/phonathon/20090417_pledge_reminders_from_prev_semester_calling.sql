/*** Those who pledged previous semester and haven't yet made payment ***/
select * from a_mf_main
where hostid in
(select id_number
from appeals
where appeal_code = 'PP09F'
and response_code = 'P'
and id_number IN (select id_number from a_dw_pyramid where year_of_giving = '2009' and transaction_type = 'P')
and id_number NOT IN (select id_number from a_dw_pyramid where year_of_giving = '2009' and transaction_type IN ('PP','GF'))
and id_number NOT IN (select id_number from appeals where appeal_code = 'PP09S'))