drop table a_temp_mack;
commit;

/*** Foundation Board ***/
/*** Mines Advisory Board ***/
/*** Visiting Committee Members ***/
/*** AA Board ***/
create table a_temp_mack
as
(select id_number
   from committee
  where committee_status_code = 'A'
    and committee_code IN ('FBOD','MAB','AABOD','VAD','VCGC','VCIF','VEB','VENG','VESE','VGE','VGL','VGP','VHON','VHUM','VLAI','VLIB','VME','VMIN','VML','VMME','VMS','VMSC','VPE','VPH','VPHY'));
commit;
/*** Current & Emeritus BOT ***/
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
/*** VP's/AVP's/Cabinet Members/Dept. Heads ***/
insert into a_temp_mack (id_number)
select id_number
from mailing_list
where mail_list_code IN ('DEP','CAB')
  and mail_list_status_code = 'A';
commit;
/*** Golden City Council Members ***/
insert into a_temp_mack (id_number) values ('0000041531'); --Joe Behm
insert into a_temp_mack (id_number) values ('0000039312'); --Diane Chesbro
insert into a_temp_mack (id_number) values ('0000039311'); --Karen Oxman
insert into a_temp_mack (id_number) values ('0000041671'); --Marjorie Sloan
insert into a_temp_mack (id_number) values ('0000041675'); --Jacob Smith
insert into a_temp_mack (id_number) values ('0000042042'); --Mary Weaver
/*** Gary Wink - Golden Chamber of Commerce ***/
insert into a_temp_mack (id_number) values ('0000034933'); --Gary Wink
/*** Mike Bestor ***/
insert into a_temp_mack (id_number) values ('0000041533'); --Mike Bestor
/*** Chuck Baroch ***/
insert into a_temp_mack (id_number) values ('0000004578'); --Chuck Baroch
/*** Preston Gibson - Jefferson Economic Council ***/
insert into a_temp_mack (id_number) values ('0000042038'); --Preston Gibson
/*** Dan Arvizu of NREL ***/
insert into a_temp_mack (id_number) values ('0000033658'); --Dan Arvizu
/*** Tom Plant - Gov's Energy Office ***/
insert into a_temp_mack (id_number) values ('0000042039'); --Tom Plant
/*** Michele Haney - Red Rocks CC Prez ***/
insert into a_temp_mack (id_number) values ('0000042040'); --Michele Haney
/*** CO Audobon Society ***/
insert into a_temp_mack (id_number) values ('0000042041'); --Gary Graham
/*** PC07 and PC08 ***/
insert into a_temp_mack (id_number)
select id_number
from a_dw_gift_clubs
where (pc07 = '1' or pc08 = '1')
  and id_number in
    (select id_number
       from a_dw_address_good
      where p_zipcode BETWEEN '80000-0000' and '80499-9999');
commit;

select count(distinct(id_number))
from a_temp_mack;