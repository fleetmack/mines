/*** DROP THESE TABLES!!! ***/
create table temp_kim_numbers
(id_number      varchar2(3));
commit;

insert into temp_kim_numbers values(          );

select * from temp_kim_numbers

create table temp_kim_blah_last_name
(last_name     varchar2(50));
commit;

insert into temp_kim_blah_last_name values(

select * from temp_kim_blah_last_name


create table temp_kim_blah_first_name
(first_name     varchar2(50));
commit;


insert into temp_kim_blah_first_name values(

select * from temp_kim_blah_first_name

drop table temp_kim_blah_first_name;
drop table temp_kim_blah_last_name;
drop table temp_kim_numbers;
commit;


update temp_kim_numbers t
set t.last_name = 
    (select f.last_name
       from temp_kim_blah_last_name    f
      where f.id_number = t.id_number);
      commit;

alter table temp_kim_numbers
add (first_name     varchar2(50));
commit;

alter table temp_kim_numbers
add (last_name     varchar2(80));
commit;

alter table temp_kim_blah_first_name
add (id_number  varchar2(3));
commit;

alter table temp_kim_blah_last_name
add (id_number  varchar2(3));
commit;

