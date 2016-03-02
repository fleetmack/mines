/*** Track Changes to Donor Continuum (affinity) ***/
drop table a_historical_affinity;
commit;

create table a_historical_affinity
as
SELECT id_number,
       donor_continuum as donor_continuum,
       sysdate as start_date,
       ' ' as end_date,
       1 as xsequence
  FROM a_dw_affinity       
commit;

/*** Create Indexes on Table ***/
CREATE INDEX a_historical_affinity_id ON ADVANCE.a_historical_affinity(id_number);
COMMIT;
/

--      select * from a_historical_affinity order by id_number

/*** Insert new people to the historical affinity table ***/
insert into a_historical_affinity
(select id_number,
        donor_continuum,
        sysdate as start_date,
        ' ' as end_date,
        1 as xsequence
   from a_dw_affinity
  where id_number NOT IN
    (select id_number from a_historical_affinity));
commit;      




     
 
 /*** Insert new row for those with new affinity ***/
 insert into a_historical_affinity ha
 (select dw.id_number,
         dw.donor_continuum,
         sysdate as start_date,
         ' ' as end_date,
         0 as xsequence
    from a_dw_affinity  dw
   where dw.id_number IN
    (select ha2.id_number
       from a_historical_affinity ha2
      where ha2.donor_continuum <> dw.donor_continuum
        and ha.end_date = ' '));
   
   
   
   
   
 
 
 /*** Update xsequence for new row ***/
 update a_historical_affinity  ha
    set ha.xsequence = (
                        select max(ha2.xsequence)+1
                          from a_historical_affinity ha2
                         where ha.id_number = ha2.id_number
                        )
  where ha.xsequence = 0
    and to_char(start_date,'YYYYMMDD') = to_char(sysdate,'YYYYMMDD');
commit;
/                        
 