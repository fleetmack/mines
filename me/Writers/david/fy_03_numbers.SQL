/*** FY03 Random Numbers for Annual Report ***/

select sum(associated_amount + associated_amount_match + associated_amount_claim)
from a_dw_pyramid
where date_of_record between '20020701' and '20030630'
and alloc = '3795';


select sum(total_commitment)
from a_dw_pyramid
where date_of_record between '20020701' and '20030630'
and alloc = '3795';


select distinct(id_number)
from a_dw_pyramid
where date_of_record between '20020701' and '20030630';

