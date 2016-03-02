create table temp_kims_names
(first_name     varchar2(50),
 last_name      varchar2(50));
commit;

insert into temp_kims_names
(first_name, last_name)
(select f.first_name,    l.last_name
from temp_kim_blah_first_name   f,
     temp_kim_blah_last_name   l);


insert into temp_kims_names
(last_name)
(select last_name
from temp_kim_blah_last_name);


select * from temp_kims_names



drop table temp_kims_names;
commit;