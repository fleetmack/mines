create table temp_mack_grads1
(cwid   varchar2(10),
last_name   varchar2(50),
first_name  varchar2(50),
middle      varchar2(3),
prefix      varchar2(10),
suffix      varchar2(10));
commit;

create table temp_mack_grads3
as
(select distinct(cwid), last_name, first_name, middle, prefix, suffix, gender
from temp_mack_grads1);
commit;
order by last_name

create table temp_mack_grads2
(cwid   varchar2(10),
gender  varchar2(1));
commit;

alter table temp_mack_grads1
add (gender varchar2(1));
commit;

update temp_mack_grads1 a
set a.gender = 
    (select b.gender
       from temp_mack_grads2    b
      where a.cwid = b.cwid);
      commit;