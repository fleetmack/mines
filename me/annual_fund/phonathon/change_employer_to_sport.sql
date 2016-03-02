/*** updates a_mf_main to overwrite the employer name with what sport they played - 
it was a one-time thing I did for rosie in April 2004 ***/

create table temp_athletic_5
as
(select m.hostid, t.full_desc
from a_mf_main      m,
     tms_sport      t,
     a_ath_3        a
where m.hostid = a.id_number
  and t.sport_code = a.sport)
  commit;
  /
  
  
  select * from temp_athletic_5
  
  
  update a_mf_main  m
  set m.jobsconame =
    (select full_desc
        from temp_athletic_5    t
       where t.hostid = m.hostid)
       commit;
       /
       
drop table temp_athletic_5;
commit;
/
    