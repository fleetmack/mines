/***create table a_jrod_2
as
(
--insert into a_jrod_2
select id_number, degree_type, dept_code
from a_temp_dept_mail
where degree_type = 'U'
and id_number in
    (select id_number 
       from a_temp_dept_mail
      where degree_type = 'G'))
***/


select id_number, degree_type, dept_code
from a_jrod_2
order by id_number, degree_type


delete from a_jrod_2
where id_number NOT IN
(
      select id_number
      from a_jrod_2    j1
      where degree_type = 'U' 
        and dept_code not in
        (select dept_code
           from a_jrod_2    j2
           where j1.id_number = j2.id_number
             and degree_type = 'G')
       )

commit;
/

          

