/********************************************************/
/********************************************************/
/************ Summarize Bequest Screen ******************/
/*** Used to generate the report a_pg_bequest_summ in ***/
/********************************************************/
/********************************************************/
select pe.id_number,
       n.pref_name,
       n.name_sort,
       pg.sub_type,
       pg.pg_code,
       pg.pg_status_code,
       pg.remainder_amt,
       pg.pg_amt,
       pg.xcomment 
from planned_gift       pg,
     proposal           pr,
     prospect_entity    pe,
     name               n
where pr.proposal_id = pg.proposal_id
  and pr.prospect_id = pe.prospect_id
  and pe.id_number   = n.id_number
  and n.name_type_code = '00'