/*** 
Mines Medals                --MM
Distinguished Achievement   --DA
Brown Medal                 --BM
Honorary Degree             --HDE, HDS, HEM
***/
select e.id_number, e.pref_mail_name, e.record_type_code, e.pref_name_sort, substr(a.awd_honor_dt,1,4) year, a.awd_honor_code, t.full_desc
from entity e,
     awards_and_honors  a,
     tms_awd_honor t
where e.id_number = a.id_number
  and t.awd_honor_code = a.awd_honor_code
  and (
       (a.awd_honor_code IN ('MM','DA','BM','HDS','HDM')) OR
        (a.awd_honor_code = 'HDE' and a.id_number NOT IN ('0000002376','0000024635'))
       )
order by a.awd_honor_code