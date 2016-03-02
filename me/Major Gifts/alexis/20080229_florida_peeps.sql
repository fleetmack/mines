/*** Alexis - Florida People ***/
drop table temp_alexis_fl;
commit;

create table temp_alexis_fl
as
(select e.id_number
from entity_record_type     ert,
     entity                 e
where e.id_number           = ert.id_number
  and ert.record_type_code = 'WI'
  and e.record_status_code = 'A'
  and e.id_number in
    (select id_number
       from a_dw_address_good
      where (p_state_code = 'FL' or b_state_code = 'FL')));
      commit;
      
     
      
insert into temp_alexis_fl (id_number)
select e.id_number
 from entity        e
where e.record_type_code <> 'AL'
and e.id_number IN
    (select id_number
       from a_dw_address_good
      where (p_state_code = 'FL' or b_state_code = 'FL'))
and e.id_number IN
    (select p.id_number
       from a_dw_pyramid    p
      where flag_alumni <> '1')
and e.id_number NOT IN (select t2.id_number from temp_alexis_fl t2);
commit;

select * from temp_alexis_fl;