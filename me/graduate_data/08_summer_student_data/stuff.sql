select * from adV_work_entity;



update adv_work_entity awe
   set prefix = 'Mr.'
 where prefix IS NULL
   and gender = 'M';
commit;

update adv_work_entity  awe
   set awe.prefix = 'Ms.'
 where prefix IS NULL  
   and gender = 'F';
commit;

update adv_work_entity  awe
  set  awe.mail_name = 
    (select e.prefix||' '||e.xfirst||' '||e.middle||' '||e.xlast||' '||e.suffix
      from adv_work_entity  e
     where e.header = awe.header)
 where awe.middle is not null
   and awe.suffix is not null;
   
update adv_work_entity  awe
  set  awe.mail_name = 
    (select e.prefix||' '||e.xfirst||' '||e.middle||' '||e.xlast
      from adv_work_entity  e
     where e.header = awe.header)
 where awe.middle is not null;
 
update adv_work_entity  awe
   set awe.mail_name = 
    (select e.prefix||' '||e.xfirst||' '||e.xlast
      from adv_work_entity  e
     where awe.header = e.header)
  where awe.middle is null;
commit;