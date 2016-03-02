/*** FY 03 ***/
create table a_temp_nilmini_blah
as (

insert into a_temp_nilmini_blah
select id_number,sum(associated_amount + associated_amount_match + associated_amount_claim) 
from a_dw_pyramid
where date_of_record BETWEEN '20000701' and '20010630'
and person_or_org = 'P'
and flag_alumni = 0
and id_number in
    (select id_number
       from a_dw_address_good
      where p_state_code = 'OK')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 500
group by id_number;
commit;
/

insert into a_temp_nilmini_blah
select id_number
from a_dw_gift_clubs
where p_state_code = 'OK'
and ( pc01 = 1
or    pc02 = 1
or    pc03 = 1);
commit;
/


select * from a_dw_gift_clubs



select distinct id_number from a_temp_nilmini_blah



drop table a_temp_nilmini_blah;
commit;
/

