select * from temp_nick_names;

select rowid from temp_nick_names;

delete from temp_nick_names
where rowid = 'AABH1uAAKAAA8iKABV';
commit;

alter table temp_nick_names
add  (new_name varchar2(30));
commit;

 update temp_nick_names   n
set n.new_name = 
(select substr(n1.name,1,instr(n1.name,'.')-3)
from temp_nick_names   n1
where n.name = n1.name
  and n.major = n1.major);



select name,
     major,
     major2,
     grad,
     email_addy,
substr(new_name,instr(new_name,',')+1)
from temp_nick_names;