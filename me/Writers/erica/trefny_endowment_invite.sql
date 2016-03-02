drop table a_temp_mack;
commit;

/*** Add Foundation Board, Mines Advisory Board, and Alumni Association Board of Directors ***/
create table a_temp_mack
as
(select id_number
   from committee
  where committee_status_code = 'A'
    and committee_code IN ('FBOD','MAB','AABOD'));
commit;

/*** Add former & current Board of Trustees ***/
 insert into a_temp_mack  (id_number)
 select id_number
   from committee
  where committee_code = 'BOT'
    and id_number in
        (select id_number from entity where record_status_code = 'A');
commit;

/*** Add Trefny Endowment > $5K donors ***/
insert into a_temp_mack (id_number)
select id_number
from a_dw_pyramid
where alloc = '754';
--group by id_number
--having sum(associated_amount+associated_amount_match+associated_amount_claim) >= 5000;

/*** Add Past Presidents ***/
insert into a_temp_mack (id_number) values ('0000039315'); --scoggins
insert into a_temp_mack (id_number) values ('0000020113'); --trefny
insert into a_temp_mack (id_number) values ('0000028839'); --bickart
insert into a_temp_mack (id_number) values ('0000013553'); --ansell
insert into a_temp_mack (id_number) values ('0000008240'); --mcbride
commit;

/*** Add VP's, AVP's, and other Cabinet Members & Department Heads ***/
insert into a_temp_mack (id_number)
select id_number
from mailing_list
where mail_list_code IN ('DEP','CAB')
  and mail_list_status_code = 'A';
commit;

select distinct(id_number)
from a_temp_mack;