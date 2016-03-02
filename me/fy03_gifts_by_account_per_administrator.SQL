/*** Marv Kay's accounts ***/
select * from allocation    a,
              a_dw_pyramid  d
where a.allocation_code     = d.alloc
  and a.administrator       = '0000006186'
  and d.date_of_record      BETWEEN '20020701' AND '20030630'
order by a.allocation_code;



/*** Joanne LeRud's accounts ***/
select a.allocation_code, a.description, d.date_of_record, d.associated_amount + d.associated_amount_match + d.associated_amount_claim 
from allocation    a,
              a_dw_pyramid  d
where a.allocation_code     = d.alloc
  and a.administrator       = '0000021095'
  and d.date_of_record      BETWEEN '20020701' AND '20030630'
order by a.allocation_code;

