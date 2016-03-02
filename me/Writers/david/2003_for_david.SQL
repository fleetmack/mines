select sum(associated_amount_match + associated_amount_claim)
--sum(associated_amount + associated_amount_match + associated_amount_claim)
--count(distinct id_number)
from a_dw_pyramid
where alloc = '3795'
and person_or_org = 'P'
and date_of_record between '20020701' and '20030630'
and id_number in
    (select id_number
      from a_dw_gift_clubs
      where pc03 = '1')

