drop table a_temp_mack;
commit;

/*** NOTE:  Trisha still need Golden Community Leaders & Local University/Community College Presidents on this list ***/
/**** This was used for a rough estimate ... told Trisha 300 based on these numbers + about 10-15 for University/CC Prez .. but she'd have to add golden community leaders to that ***/



/*** Add Foundation Board, Mines Advisory Board, and Alumni Association Board of Directors, and Visiting Committees ***/
create table a_temp_mack
as
(select id_number
   from committee
  where committee_status_code = 'A'
    and committee_code IN ('FBOD','MAB','AABOD','VAD','VCGC','VCIF','VEB','VENG','VESE','VGE','VGL','VGP','VHON','VHUM','VLAI','VLIB','VME','VMIN','VML','VMME','VMS','VMSC','VPE','VPH','VPHY'));
commit;

/*** Add former & current Board of Trustees ***/
 insert into a_temp_mack  (id_number)
 select id_number
   from committee
  where committee_code = 'BOT'
    and id_number in
        (select id_number from entity where record_status_code = 'A');
commit;


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

select count(distinct(id_number))
from a_temp_mack;